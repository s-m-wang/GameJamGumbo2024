//Closing textbox
if(keyboard_check_pressed(vk_space)){
	obj_text.talk = false;
	obj_player.controllable = true;
	instance_destroy();
}

//Layering effect
depth = -y;