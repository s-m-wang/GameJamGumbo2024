if(show){
	image_alpha = lerp(image_alpha, 1, 0.01);
	built = true;
}
if(image_alpha > 0.9 && built){
	obj_player.controllable = true;
	show = false;
	built = false;
}




