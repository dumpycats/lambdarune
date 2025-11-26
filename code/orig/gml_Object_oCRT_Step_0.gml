if (window_get_fullscreen())
    surface_resize(application_surface, (windowheight / 3) * 4, windowheight);
else if (windowheight > 1048)
    surface_resize(application_surface, 1280, 960);
else
    surface_resize(application_surface, 640, 480);
