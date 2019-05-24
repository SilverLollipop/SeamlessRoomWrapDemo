// draw normally if main view
if (!instance_exists(camera_controller) || view_current == 0) {
	draw_self()
	exit
}

var sideFlags0 = camera_controller.view_camera_side[0]
var sideFlags = camera_controller.view_camera_side[view_current]

// remove flags similar to main view flag
sideFlags = sideFlags & ~sideFlags0

var px = x;
var py = y;
var offset_x = (sideFlags & SideFlags.left) ? -1 : ((sideFlags & SideFlags.right) ? 1 : 0)
var offset_y = (sideFlags & SideFlags.top) ? -1 : ((sideFlags & SideFlags.bottom) ? 1 : 0)

// use built-in variables for convience of using draw_self()
x += offset_x * room_width;
y += offset_y * room_height;

draw_self()

x = px
y = py
