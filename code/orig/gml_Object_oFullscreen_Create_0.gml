windowwidth = display_get_width();
windowheight = display_get_height();

if (windowheight > 1048)
    window_set_size(1280, 960);
else
    window_set_size(640, 480);

window_center();
window_enable_borderless_fullscreen(true);
