/// @description camera_set_view_size2(camera, width, height)
/// @param camera
/// @param width
/// @param height

var xx = camera_get_view_x(argument0)
var yy = camera_get_view_y(argument0)
var width = camera_get_view_width(argument0)
var height = camera_get_view_height(argument0)
camera_set_view_size(argument0, argument1, argument2)
camera_set_view_pos(
	argument0,
	min(room_width - argument1, max(0, xx + (width - argument1) / 2)),
	min(room_height - argument2, max(0, yy + (height - argument2) / 2)))