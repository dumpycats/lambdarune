draw_self();

if (!turnoff)
    draw_sprite_ext(spr_ralseiroom, 6, 320, 240, 1, 1, 0, c_white, 1);

depth = -y + 30;

if (fall)
{
    percent1++;
    
    if (percent1 == 1)
    {
        obj_queen_e3.image_index = 2;
        obj_lancer_e3.image_index = 2;
        obj_kreid_e3.image_index = 2;
        obj_ralsei_e3.sprite_index = sRalseiWalkUp;
        obj_susie_e3.sprite_index = sSusieWalkUp;
        obj_kris_e3.sprite_index = sKrisWalkUp;
        obj_lancer_e3.direction = -90;
        obj_ralsei_e3.direction = -90;
        obj_susie_e3.direction = -90;
        obj_kris_e3.direction = -90;
        obj_kreid_e3.direction = -90;
        obj_lancer_e3.speed = 8;
        obj_ralsei_e3.speed = 8;
        obj_susie_e3.speed = 8;
        obj_kris_e3.speed = 8;
        obj_kreid_e3.speed = 8;
    }
    
    if (percent1 == 6)
    {
        obj_lancer_e3.speed = 0;
        obj_ralsei_e3.speed = 0;
        obj_susie_e3.speed = 0;
        obj_kris_e3.speed = 0;
        obj_kreid_e3.speed = 0;
    }
    
    if (percent1 <= 30)
    {
        var position = animcurve_channel_evaluate(curvefaster, percent1 / 30);
        y = lerp(-116, 216, position);
        
        if (percent1 == 30)
        {
            obj_queen_e3.image_index = 3;
            audio_play_sound(snd_impact, 1, false, 0.6);
            sprite_index = spr_mike_land_alt;
            image_index = 0;
        }
    }
}
