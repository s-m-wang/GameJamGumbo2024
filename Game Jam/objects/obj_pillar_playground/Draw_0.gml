if(glow){
	gpu_set_blendmode(bm_add);
	for(c = 0; c < 360; c += 20){
		draw_sprite_ext(sprite_index, image_index, x + lengthdir_x(6, c), y + lengthdir_y(6, c), image_xscale, image_yscale, image_angle, image_blend, sinWave * 0.1);
	}
	gpu_set_blendmode(bm_normal);
}
else{
	gpu_set_blendmode(bm_normal);
}

draw_self();