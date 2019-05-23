// draw the object 9 times
for (var i = -1; i <= 1; i++) {
	for (var j = -1; j <= 1; j++) {
		draw_sprite_ext(
			sprite_index,
			image_index,
			x + room_width * i,
			y + room_height * j,
			image_xscale,
			image_yscale,
			image_angle,
			image_blend,
			image_alpha)
	}
}