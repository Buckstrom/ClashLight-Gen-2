isHovering = (point_in_rectangle(mouse_x, mouse_y, mAPPEAR_COORDS))
if (isHovering) {
	if (mouse_check_button_pressed(mb_left)) {
		instance_destroy(mWEP)
		room_goto(init);
	}
}