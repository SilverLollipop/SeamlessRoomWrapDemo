if (instance_number(player) == 0) exit

var xx = player.x - WIDTH / 2
var yy = player.y - HEIGHT / 2

camera_set_view_size(main_camera, WIDTH, HEIGHT);
for (var i = 0; i < 4; i++) {
	camera_set_view_size(corner_cameras[i], WIDTH, HEIGHT);
	camera_set_view_size(edge_cameras[i], WIDTH, HEIGHT);
}

camera_set_view_pos(main_camera, xx, yy)

camera_set_view_pos(corner_cameras[TOP_LEFT], xx - room_width, yy - room_height)
camera_set_view_pos(corner_cameras[TOP_RIGHT], xx + room_width, yy - room_height)
camera_set_view_pos(corner_cameras[BOTTOM_LEFT], xx - room_width, yy + room_height)
camera_set_view_pos(corner_cameras[BOTTOM_RIGHT], xx + room_width, yy + room_height)

camera_set_view_pos(edge_cameras[TOP], xx, yy - room_height)
camera_set_view_pos(edge_cameras[LEFT], xx - room_width, yy)
camera_set_view_pos(edge_cameras[BOTTOM], xx, yy + room_height)
camera_set_view_pos(edge_cameras[RIGHT], xx + room_width, yy)

var sideFlags = SideFlags.none
var center_x, center_y;

if (xx < 0) {
	center_x = -xx
	sideFlags = sideFlags | SideFlags.left
} else if (xx + WIDTH >= room_width) {
	center_x = xx + WIDTH - room_width
	sideFlags = sideFlags | SideFlags.right
}

if (yy < 0) {
	center_y = -yy
	sideFlags = sideFlags | SideFlags.top
} else if (yy + HEIGHT >= room_height) {
	center_y = yy + HEIGHT - room_height
	sideFlags = sideFlags | SideFlags.bottom
}

view_set_camera(0, main_camera)
switch (sideFlags) {
	case SideFlags.none:
		for (var i = 1; i < 4; i++) {
			view_set_visible(i, false);
		}
		break;
	case SideFlags.top:
	case SideFlags.left:
	case SideFlags.bottom:
	case SideFlags.right:
		view_set_visible(1, true);
		for (var i = 2; i < 4; i++) {
			view_set_visible(i, false);
		}
		break;
	case SideFlags.topLeft:
	case SideFlags.topRight:
	case SideFlags.bottomLeft:
	case SideFlags.bottomRight:
		for (var i = 1; i < 4; i++) {
			view_set_visible(i, true);
		}
		break;
}

view_set_visible(0, true);
view_camera_side[0] = sideFlags

switch (sideFlags) {
	case SideFlags.none:
		view_set_xport(0, 0)
		view_set_yport(0, 0)
		break;
	case SideFlags.top:
		view_set_xport(0, 0)
		view_set_yport(0, center_y)
		camera_set_view_size2(main_camera, WIDTH, HEIGHT - center_y)
		view_set_xport(1, 0)
		view_set_yport(1, 0)
		view_set_camera(1, edge_cameras[BOTTOM])
		camera_set_view_size2(edge_cameras[BOTTOM], WIDTH, center_y)
		view_camera_side[1] = SideFlags.bottom
		break;
	case SideFlags.left:
		view_set_xport(0, center_x)
		view_set_yport(0, 0)
		camera_set_view_size2(main_camera, WIDTH - center_x, HEIGHT)
		view_set_xport(1, 0)
		view_set_yport(1, 0)
		view_set_camera(1, edge_cameras[RIGHT])
		camera_set_view_size2(edge_cameras[RIGHT], center_x, HEIGHT)
		view_camera_side[1] = SideFlags.right
		break;
	case SideFlags.bottom:
		view_set_xport(0, 0)
		view_set_yport(0, 0)
		camera_set_view_size2(main_camera, WIDTH, HEIGHT - center_y)
		view_set_xport(1, 0)
		view_set_yport(1, HEIGHT - center_y)
		view_set_camera(1, edge_cameras[TOP])
		camera_set_view_size2(edge_cameras[TOP], WIDTH, center_y)
		view_camera_side[1] = SideFlags.top
		break;
	case SideFlags.right:
		view_set_xport(0, 0)
		view_set_yport(0, 0)
		camera_set_view_size2(main_camera, WIDTH - center_x, HEIGHT)
		view_set_xport(1, WIDTH - center_x)
		view_set_yport(1, 0)
		view_set_camera(1, edge_cameras[LEFT])
		camera_set_view_size2(edge_cameras[LEFT], center_x, HEIGHT)
		view_camera_side[1] = SideFlags.left
		break;
	case SideFlags.topLeft:
		view_set_xport(0, center_x)
		view_set_yport(0, center_y)
		camera_set_view_size2(main_camera, WIDTH - center_x, HEIGHT - center_y)
		view_set_xport(1, 0)
		view_set_yport(1, 0)
		view_set_camera(1, corner_cameras[BOTTOM_RIGHT])
		camera_set_view_size2(corner_cameras[BOTTOM_RIGHT], center_x, center_y)
		view_camera_side[1] = SideFlags.bottomRight
		view_set_xport(2, center_x)
		view_set_yport(2, 0)
		view_set_camera(2, corner_cameras[BOTTOM_LEFT])
		camera_set_view_size2(corner_cameras[BOTTOM_LEFT], WIDTH - center_x, center_y)
		view_camera_side[2] = SideFlags.bottomLeft
		view_set_xport(3, 0)
		view_set_yport(3, center_y)
		view_set_camera(3, corner_cameras[TOP_RIGHT])
		camera_set_view_size2(corner_cameras[TOP_RIGHT], center_x, HEIGHT - center_y)
		view_camera_side[3] = SideFlags.topRight
		break;
	case SideFlags.topRight:
		view_set_xport(0, 0)
		view_set_yport(0, center_y)
		camera_set_view_size2(main_camera, WIDTH - center_x, HEIGHT - center_y)
		view_set_xport(1, 0)
		view_set_yport(1, 0)
		view_set_camera(1, corner_cameras[BOTTOM_RIGHT])
		camera_set_view_size2(corner_cameras[BOTTOM_RIGHT], WIDTH - center_x, center_y)
		view_camera_side[1] = SideFlags.bottomRight
		view_set_xport(2, WIDTH - center_x)
		view_set_yport(2, 0)
		view_set_camera(2, corner_cameras[BOTTOM_LEFT])
		camera_set_view_size2(corner_cameras[BOTTOM_LEFT], center_x, center_y)
		view_camera_side[2] = SideFlags.bottomLeft
		view_set_xport(3, WIDTH - center_x)
		view_set_yport(3, center_y)
		view_set_camera(3, corner_cameras[TOP_LEFT])
		camera_set_view_size2(corner_cameras[TOP_LEFT], center_x, HEIGHT - center_y)
		view_camera_side[3] = SideFlags.topLeft
		break;
	case SideFlags.bottomLeft:
		view_set_xport(0, center_x)
		view_set_yport(0, 0)
		camera_set_view_size2(main_camera, WIDTH - center_x, HEIGHT - center_y)
		view_set_xport(1, 0)
		view_set_yport(1, 0)
		view_set_camera(1, corner_cameras[BOTTOM_RIGHT])
		camera_set_view_size2(corner_cameras[BOTTOM_RIGHT], center_x, HEIGHT - center_y)
		view_camera_side[1] = SideFlags.bottomRight
		view_set_xport(2, center_x)
		view_set_yport(2, HEIGHT - center_y)
		view_set_camera(2, corner_cameras[TOP_LEFT])
		camera_set_view_size2(corner_cameras[TOP_LEFT], WIDTH - center_x, center_y)
		view_camera_side[2] = SideFlags.topLeft
		view_set_xport(3, 0)
		view_set_yport(3, HEIGHT - center_y)
		view_set_camera(3, corner_cameras[TOP_RIGHT])
		camera_set_view_size2(corner_cameras[TOP_RIGHT], center_x, center_y)
		view_camera_side[3] = SideFlags.topRight
		break;
	case SideFlags.bottomRight:
		view_set_xport(0, 0)
		view_set_yport(0, 0)
		camera_set_view_size2(main_camera, WIDTH - center_x, HEIGHT - center_y)
		view_set_xport(1, WIDTH - center_x)
		view_set_yport(1, HEIGHT - center_y)
		view_set_camera(1, corner_cameras[TOP_LEFT])
		camera_set_view_size2(corner_cameras[TOP_LEFT], center_x, center_y)
		view_camera_side[1] = SideFlags.topLeft
		view_set_xport(2, WIDTH - center_x)
		view_set_yport(2, 0)
		view_set_camera(2, corner_cameras[BOTTOM_LEFT])
		camera_set_view_size2(corner_cameras[BOTTOM_LEFT], center_x, HEIGHT - center_y)
		view_camera_side[2] = SideFlags.bottomLeft
		view_set_xport(3, 0)
		view_set_yport(3, HEIGHT - center_y)
		view_set_camera(3, corner_cameras[TOP_RIGHT])
		camera_set_view_size2(corner_cameras[TOP_RIGHT], WIDTH - center_x, center_y)
		view_camera_side[3] = SideFlags.topRight
		break;

}

for (var i = 0; i < 4; i++) {
	var camera = view_get_camera(i)
	view_set_wport(i, camera_get_view_width(camera))
	view_set_hport(i, camera_get_view_height(camera))
}