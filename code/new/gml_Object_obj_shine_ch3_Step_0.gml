percent1++;

if (percent1 <= 60)
{
    var position = animcurve_channel_evaluate(curvelinear, percent1 / 60);
    x = lerp(xx, obj_kris_sof_end.x, position);
    y = lerp(yy, obj_kris_sof_end.y, position);
}

if (percent1 == 70)
{
    with (obj_ch3_foaneend_text)
    {
        reset_dialogue_normal();
        dialogue = 50;
        talking = true;
        audio_play_sound(snd_item, 1, false);
    }
    
    instance_destroy();
}

image_alpha += 0.1;
