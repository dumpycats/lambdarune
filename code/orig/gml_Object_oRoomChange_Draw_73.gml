draw_self();

if (roomchange)
{
    if (roomchanging)
    {
        timer++;
        
        if (timer == 0)
        {
            instance_create_depth(x, y, -y - 1500, obj_blackscreen_fadein);
            global.playermove = false;
        }
        
        if (instance_exists(obj_kris_c3))
        {
            obj_kris_c3.image_speed = 0;
            obj_kris_c3.image_index = 0;
        }
        
        if (instance_exists(obj_susie_c3))
        {
            obj_susie_c3.image_speed = 0;
            obj_susie_c3.image_index = 0;
        }
        
        if (instance_exists(obj_ralsei_c3))
        {
            obj_ralsei_c3.image_speed = 0;
            obj_ralsei_c3.image_index = 0;
        }
        
        obj_blackscreen_fadein.image_alpha += 0.1;
        
        if (obj_blackscreen_fadein.image_alpha == 1.3)
            room_goto(roomtarget);
    }
}
