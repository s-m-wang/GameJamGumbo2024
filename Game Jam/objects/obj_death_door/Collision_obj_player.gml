global.player_x = 448;
global.player_y = 320;

if (global.cv1_death) {
	room_goto(rm_death_cv1);
}
else if (global.cv2_death) {
	room_goto(rm_death_cv2);
}
else {
	room_goto(rm_death);
}
