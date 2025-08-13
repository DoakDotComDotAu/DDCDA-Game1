// Dummy references to keep rooms in final build
var _dummy;
_dummy = rlvl1;
_dummy = rlvl2;
_dummy = rlvl3;
_dummy = rlvl4;
_dummy = rlvl5;
_dummy = rlvl6;
_dummy = rlvl7;
_dummy = rlvl8;
_dummy = rlvl9;

// Get the last character of the object name as suffix
var name_str = object_get_name(object_index);
var suffix_char = string_copy(name_str, string_length(name_str), 1);
var suffix = real(suffix_char);

// Compose the room name
var room_name = "rlvl" + string(suffix);

// Get the room asset index (untyped integer)
var room_index = asset_get_index(room_name);

// Check if it is a room
if (asset_get_type(room_index) == asset_room) {
    event_target_room = room_index; // store integer room ID
} else {
    show_debug_message("Room not found: " + room_name);
    event_target_room = rmain; // fallback room index
}

// Set the sprite frame
image_speed = 0;
image_index = suffix;

// Define click handler
on_click = function() {
    if (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id)) {
        room_goto(event_target_room);
    }
};
