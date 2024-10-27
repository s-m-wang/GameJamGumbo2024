global.player_x = 320;
global.player_y = 320;

if (global.cv1_wedding) {
	room_goto(rm_wedding_cv1);
}
else if (global.cv2_wedding) {
	room_goto(rm_wedding_cv2);
}
else {
	room_goto(rm_wedding);
}
