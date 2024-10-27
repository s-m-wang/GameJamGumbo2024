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
dir = point_direction(0, 0, horizontal, vertical);

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

if(controllable){
	//Movement system
	if(horizontal != 0 || vertical != 0){
		move_x = lengthdir_x(move_speed, dir);
		move_y = lengthdir_y(move_speed, dir);
		
		if(move_x > 0 && !place_meeting(x + 3, y, obj_npc)){
			x += move_x;
		}
		else if(move_x < 0 && !place_meeting(x - 3, y, obj_npc)){
			x += move_x;
		}
		if(move_y < 0 && !place_meeting(x, y - 3, obj_npc)){
			y += move_y;
		}
		else if(move_y > 0 && !place_meeting(x, y + 3, obj_npc)){
			y += move_y;
		}
		
		//Set sprite
		//REPLACE WITH CORRECT SPRITES
		switch(dir){
			case 0: sprite_index = spr_player; break;
			case 45: sprite_index = spr_player; break;
			case 90: sprite_index = spr_player; break;
			case 135: sprite_index = spr_player; break;
			case 180: sprite_index = spr_player; break;
			case 225: sprite_index = spr_player; break;
			case 270: sprite_index = spr_player; break;
			case 315: sprite_index = spr_player; break;
		}
	}
	else{
		//Set idle sprite
		//REPLACE WITH CORRECT IDLE SPRITES
		switch(dir){
			case 0: sprite_index = spr_player; break;
			case 45: sprite_index = spr_player; break;
			case 90: sprite_index = spr_player; break;
			case 135: sprite_index = spr_player; break;
			case 180: sprite_index = spr_player; break;
			case 225: sprite_index = spr_player; break;
			case 270: sprite_index = spr_player; break;
			case 315: sprite_index = spr_player; break;
		}
	}
	
	//Dialogue with NPC
	if(place_meeting(x + 3, y, obj_npc) || place_meeting(x - 3, y, obj_npc) || place_meeting(x, y + 3, obj_npc) || place_meeting(x, y - 3, obj_npc)){
		if(keyboard_check_pressed(vk_space)){
			obj_text.text = "TEST";
			instance_create_layer(obj_camera.x + 14, obj_camera.y + camera_get_view_height(view_camera[0]) - 64, "Instances", obj_textbox);
			obj_text.talk = true;
			controllable = false;
		}
	}
}