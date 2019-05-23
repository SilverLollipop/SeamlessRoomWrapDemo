if (debug_mode) {
	var color = c_white;
	switch (view_current) {
		case 0:
			color = c_red
			break
		case 1:
			color = c_lime
			break
		case 2:
			color = c_aqua
			break
		case 3:
			color = c_fuchsia
			break
	}
	draw_set_color(color)
	draw_rectangle(0, 0, room_width, room_height, true)
	draw_set_color(c_white)
}