// Reverse gravity if oSpace exists in the room
var gravityDir = 1; // 1 = normal gravity, -1 = reversed
if (instance_exists(oSpace)) {
    gravityDir = -1;
}

// Apply gravity (direction-aware)
ysp += 0.1 * gravityDir;
xsp = 0;

// First Frame snapping
if (firstFrame)
{
    firstFrame = false;
    var tempY = y;
    while (!place_meeting(x, tempY, oSolid) && !place_meeting(x, tempY, oBarrier) && abs(tempY - y) < 64)
    {
        tempY += 1 * gravityDir;
    }
    if (place_meeting(x, tempY, oSolid) || place_meeting(x, tempY, oBarrier))
    {
        y = tempY - 1 * gravityDir;
        ysp = 0;
    }
}

// Only allow snapping if in oSpace and NOT touching oSolid
if (place_meeting(x, y, oSpace) && !place_meeting(x, y + gravityDir, oSolid))
{
    // Snap in opposite gravity direction
    if (keyboard_check_pressed(vk_up))
    {
        var tempY = y;
        while (!place_meeting(x, tempY, oSolid) && abs(tempY - y) < 64)
        {
            tempY -= 1 * gravityDir;
        }
        if (place_meeting(x, tempY, oSolid))
        {
            y = tempY + 1 * gravityDir;
            ysp = 0;
        }
    }

    if (keyboard_check_pressed(vk_down))
    {
        var tempY = y;
        while (!place_meeting(x, tempY, oSolid) && abs(tempY - y) < 64)
        {
            tempY += 1 * gravityDir;
        }
        if (place_meeting(x, tempY, oSolid))
        {
            y = tempY - 1 * gravityDir;
            ysp = 0;
        }
    }
}
else
{
    if (keyboard_check(vk_left))  xsp = -1;
    if (keyboard_check(vk_right)) xsp =  1;
}

// Jumping logic based on gravity direction
if place_meeting(x, y + gravityDir, oSolid) || place_meeting(x, y + gravityDir, oBarrier)
{
    ysp = 0;
    if keyboard_check(vk_up) ysp = -2 * gravityDir;
}

// Interactions
if place_meeting(x, y, oGoodBox)
{
    room_goto_next();
}

if place_meeting(x, y, oRedo) || 
place_meeting(x, y, oSpike) || 
place_meeting(x, y, oFakeGoodBox) || 
place_meeting(x, y, oKillBox)
{
    room_restart();
}

move_and_collide(xsp, ysp, oSolid);

