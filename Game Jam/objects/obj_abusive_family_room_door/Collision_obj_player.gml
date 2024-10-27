global.player_x = 384;
global.player_y = 352;

if (global.cv1_abusive_family_room) {
	room_goto(rm_abusive_family_cv1);
}
else if (global.cv2_abusive_family_room) {
	room_goto(rm_abusive_family_cv2);
}
else {
	room_goto(rm_abusive_family);
}
