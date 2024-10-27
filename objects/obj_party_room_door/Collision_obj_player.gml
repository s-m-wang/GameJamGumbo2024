global.player_x = 384;
global.player_y = 480;

if (global.cv1_college_party) {
	room_goto(rm_party_cv1);
}
else if (global.cv2_college_party) {
	room_goto(rm_party_cv2);
}
else {
	room_goto(rm_party);
}
