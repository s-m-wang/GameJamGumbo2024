//Set drawing settings
//draw_set_font(talk_font);
draw_set_halign(fa_left);

//Draw text
if(talk){
	draw_text_ext_transformed(obj_textbox.x - 315, obj_textbox.y - 175, text, string_height(text), 450, 3, 3, 0);
} 