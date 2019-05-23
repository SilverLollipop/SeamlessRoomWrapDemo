#macro WIDTH 640
#macro HEIGHT 640
#macro TOP_LEFT 0
#macro TOP_RIGHT 1
#macro BOTTOM_LEFT 2
#macro BOTTOM_RIGHT 3
#macro TOP 0
#macro LEFT 1
#macro BOTTOM 2
#macro RIGHT 3

enum SideFlags {
	none = 0,
	top = 1,
	left = 2,
	bottom = 4,
	right = 8,
	topLeft = 3,
	bottomLeft = 6,
	bottomRight = 12,
	topRight = 9
}

var proj = matrix_build_projection_ortho(WIDTH, HEIGHT, 0, 32000)

main_camera = camera_create_view(0, 0, WIDTH, HEIGHT, 0, -1, 0, 0, 64, 64)
camera_set_proj_mat(main_camera, proj)

for(var i = 0; i < 4; i++) {
	corner_cameras[i] = camera_create_view(0, 0, WIDTH, HEIGHT, 0, -1, 0, 0, 0, 0)
	camera_set_proj_mat(corner_cameras[i], proj)
	edge_cameras[i] = camera_create_view(0, 0, WIDTH, HEIGHT, 0, -1, 0, 0, 0, 0)
	camera_set_proj_mat(edge_cameras[i], proj)
}

