global.player_x = 480;
global.player_y = 480;

if (global.cv1_divorce_room) {
	room_goto(rm_divorce_cv2);
}
else if (global.cv2_divorce_room) {
	room_goto(rm_divorce_cv2);
}
else {
	room_goto(rm_divorce);
}
