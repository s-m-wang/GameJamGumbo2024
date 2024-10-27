global.player_x = 352;
global.player_y = 480;

if (global.cv1_fight) {
	room_goto(rm_fight_cv1);
}
else if (global.cv2_fight) {
	room_goto(rm_fight_cv2);
}
else {
	room_goto(rm_fight);
}
