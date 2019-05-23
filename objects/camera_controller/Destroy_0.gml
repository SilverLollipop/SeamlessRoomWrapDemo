camera_destroy(main_camera)

for(var i = 0; i < 4; i++) {
	camera_destroy(corner_cameras[i])
}