if (pull == 1)
    draw_self();

if (pull == 1)
{
    if (instance_exists(obj_battle_sof))
    {
        if (global.alldown)
        {
            image_speed = 0;
            speed = 0;
        }
        else
        {
            time = current_time / 1000;
        }
    }
}
