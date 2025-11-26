if (keyboard_check_pressed(vk_f4))
{
    if (window_get_fullscreen())
    {
        window_set_fullscreen(false);
        
        if (windowheight > 1048)
            window_set_size(1280, 960);
        else
            window_set_size(640, 480);
        
        window_center();
    }
    else
    {
        window_center();
        window_set_fullscreen(true);
    }
}

window_set_cursor(cr_none);
