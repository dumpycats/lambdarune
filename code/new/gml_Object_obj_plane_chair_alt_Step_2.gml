y = round(yy + global.yoffset);
depth = -y;

if (instance_exists(obj_plane_text))
{
    if (obj_plane_text.dialogue >= 10)
    {
        if (y == 348)
            image_index = 4;
        
        if (y == 382)
            image_index = 4;
    }
}
