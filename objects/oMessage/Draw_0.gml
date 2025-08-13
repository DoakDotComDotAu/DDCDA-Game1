// Store original scale
var _xscale = image_xscale;
var _yscale = image_yscale;

// Set scale for text
var scale_factor = 0.5;  // Scale the text to 50%
image_xscale = scale_factor;
image_yscale = scale_factor;

// Set text style
draw_set_font(fnt_12);  // Your font
draw_set_color(c_white);  // Text color: white
draw_set_halign(fa_left);  // Align text to the left
draw_set_valign(fa_top);   // Align text to the top

// Calculate position where the text will be drawn
var text_x = x - (sprite_width * _xscale) / 2;  // Adjust for the object scale
var text_y = y - (sprite_height * _yscale) / 2; // Adjust for the object scale

// Draw the text at the adjusted position
draw_text(text_x, text_y, message);

// Restore scale
image_xscale = _xscale;
image_yscale = _yscale;
