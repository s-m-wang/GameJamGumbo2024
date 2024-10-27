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
		
		if(move_x > 0 && !place_meeting(x + 3, y, obj_npc) && !place_meeting(x + 3, y, obj_object)){
			x += move_x;
			obj_camera.x += move_x;
		}
		else if(move_x < 0 && !place_meeting(x - 3, y, obj_npc) && !place_meeting(x - 3, y, obj_object)){
			x += move_x;
			obj_camera.x += move_x;
		}
		if(move_y < 0 && !place_meeting(x, y - 3, obj_npc) && !place_meeting(x, y - 3, obj_object)){
			y += move_y;
			obj_camera.y += move_y;
		}
		else if(move_y > 0 && !place_meeting(x, y + 3, obj_npc) && !place_meeting(x, y + 3, obj_object)){
			y += move_y;
			obj_camera.y += move_y;
		}
		
		//Set sprite
		//REPLACE WITH CORRECT SPRITES
		switch(dir){
			case 0: sprite_index = spr_player_walk_right; image_speed = move_speed * 1; break;
			case 45: break;
			case 90: sprite_index = spr_player_walk_up; image_speed = move_speed * 1; break;
			case 135: break;
			case 180: sprite_index = spr_player_walk_left; image_speed = move_speed * 1; break;
			case 225: break;
			case 270: sprite_index = spr_player_walk_down; image_speed = move_speed * 1; break;
			case 315: break;
		}
	}
	else{
		//Set idle sprite
		if(sprite_index = spr_player_walk_down){
			image_speed = 1;
			sprite_index = spr_player_idle_down;
		}
		else if(sprite_index != spr_player_idle_down){
			image_speed = 0;
			image_index = 1;
		}
	}
	
	//Dialogue with NPC
	if(place_meeting(x + 3, y, obj_npc) || place_meeting(x - 3, y, obj_npc) || place_meeting(x, y + 3, obj_npc) || place_meeting(x, y - 3, obj_npc)){
		if(keyboard_check_pressed(vk_space)){
			obj_text.text = "TEST";
			instance_create_layer(obj_camera.x, obj_camera.y + camera_get_view_height(view_camera[0]) - 128, "Instances", obj_textbox);
			obj_text.talk = true;
			controllable = false;
		}
	}
	
	//Create playground bridge
	if(place_meeting(x + 3, y, obj_pillar_playground) || place_meeting(x - 3, y, obj_pillar_playground) || place_meeting(x, y + 3, obj_pillar_playground) || place_meeting(x, y - 3, obj_pillar_playground)){
		if(keyboard_check_pressed(vk_space)){
			obj_bridge_tile.show = true;
			obj_pillar_playground.glow = false;
			controllable = false;
		}
	}
}
