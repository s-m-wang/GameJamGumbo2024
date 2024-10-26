//Normalize diagonal vector
move_speed_diagonal = move_speed * 0.707;

//Room boundaries
x = clamp(x, 0, room_width - 29);
y = clamp(y, 0, room_height - 35);

//Movement inputs
left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));
up = keyboard_check(ord("W"));
down = keyboard_check(ord("S"));

horizontal = right - left;
vertical = down - up;

//Stop moving
if(!controllable){
	left = 0;
	right = 0;
	up = 0;
	down = 0;
	image_speed = 0;
}

//Layering effect
depth = -y;

//Diagonal movement speed
if(horizontal != 0 && vertical != 0){
	horizontal_speed = horizontal * move_speed_diagonal;
	vertical_speed = vertical * move_speed_diagonal;
}
//Vertical and horizontal movement speed
else{
	horizontal_speed = horizontal * move_speed;
	vertical_speed = vertical * move_speed;
}

//Controlling characters
if(controllable){

	//Moving character + camera with checking for collisions
	if(horizontal_speed > 0 && !place_meeting(x + 3, y, obj_npc)){
		x += horizontal_speed;
	}
	else if(horizontal_speed < 0 && !place_meeting(x - 3, y, obj_npc)){
		x += horizontal_speed;
	}
	if(vertical_speed < 0 && !place_meeting(x, y - 3, obj_npc)){
		y += vertical_speed;
	}
	else if(vertical_speed > 0 && !place_meeting(x, y + 3, obj_npc)){
		y += vertical_speed;
	}

	//Moving with animation
	if(keyboard_check_pressed(ord("D"))){
		//sprite_index = spr_player_right;
		image_speed = move_speed* 1;
	}
	else if(keyboard_check_pressed(ord("A"))){
		//sprite_index = spr_player_left;
		image_speed = move_speed * 1;
	}
	else if(keyboard_check_pressed(ord("S"))){
		//sprite_index = spr_player_front;
		image_speed = move_speed* 1;
	}
	else if(keyboard_check_pressed(ord("W"))){
		//sprite_index = spr_player_back;
		image_speed = move_speed* 1;
	}

	//Idle standing
	//if(horizontal_speed = 0 && vertical_speed = 0 && sprite_index = spr_player_front && !keyboard_check(vk_anykey)){
	//	sprite_index = spr_player_idle;
	//	image_index = 0;
	//	image_speed = 0;
	//}
	//else if(horizontal_speed = 0 && vertical_speed = 0 && sprite_index = spr_player_back && !keyboard_check(vk_anykey)){
	//	sprite_index = spr_player_idle;
	//	image_index = 1;
	//	image_speed = 0;
	//}
	//else if(horizontal_speed = 0 && vertical_speed = 0 && sprite_index = spr_player_left && !keyboard_check(vk_anykey)){
	//	sprite_index = spr_player_idle;
	//	image_index = 2;
	//	image_speed = 0;
	//}
	//else if(horizontal_speed = 0 && vertical_speed = 0 && sprite_index = spr_player_right && !keyboard_check(vk_anykey)){
	//	sprite_index = spr_player_idle;
	//	image_index = 3;
	//	image_speed = 0;
	//}
	if(place_meeting(x + 3, y, obj_npc) || place_meeting(x - 3, y, obj_npc) || place_meeting(x, y + 3, obj_npc) || place_meeting(x, y - 3, obj_npc)){
		if(keyboard_check_pressed(vk_space)){
			obj_text.text = "TEST";
			instance_create_layer(obj_camera.x + 14, obj_camera.y + camera_get_view_height(view_camera[0]) - 64, "Instances", obj_textbox);
			obj_text.talk = true;
			controllable = false;
		}
	}
}