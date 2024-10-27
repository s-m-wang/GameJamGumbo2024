global.player_x = 576;
global.player_y = 512;

if (global.cv1_childhood_room) {
	room_goto(rm_childhood_room_cv1);
}
else if (global.cv2_childhood_room) {
	room_goto(rm_childhood_room_cv2);
}
else {
	room_goto(rm_childhood_room);
}
