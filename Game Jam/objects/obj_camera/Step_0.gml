if (x < 0) x = 0;
if (x + camera_get_view_width(view_camera[0]) > room_width) {
	x = room_width - camera_get_view_width(view_camera[0]);
}
camera_set_view_pos(view_camera[0],x,y);