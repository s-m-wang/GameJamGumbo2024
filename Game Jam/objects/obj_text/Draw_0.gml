//Set drawing settings
//draw_set_font(talk_font);
draw_set_halign(fa_left);

//Draw text
if(talk){
	draw_text_ext_transformed(obj_textbox.x + 8, obj_textbox.y + 8, text, string_height(text), 450, 0.45, 0.45, 0);
} 