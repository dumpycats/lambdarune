var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

if (obj_kris_c3.y >= 220)
{
    dialoguebottom = false;
    dialoguetop = true;
}
else
{
    dialoguebottom = true;
    dialoguetop = false;
}

if (walk)
{
    walkpercent++;
    var walkposition = animcurve_channel_evaluate(curvelinear, walkpercent / 30);
    
    if (walkpercent <= 30)
    {
        SUSIE.x = lerp(KRIS.x + 400, KRIS.x + 150, walkposition);
        SUSIE.image_speed = 1.6666666666666667;
        RALSEI.x = lerp(KRIS.x + 500, KRIS.x + 250, walkposition);
        RALSEI.image_speed = 1.6666666666666667;
    }
    else if (walkpercent == 31)
    {
        RALSEI.image_speed = 0;
        RALSEI.image_index = 0;
        SUSIE.image_speed = 0;
        SUSIE.image_index = 0;
    }
    
    if (walkpercent == 40)
    {
        talking = true;
        dialogue = 3;
        reset_dialogue_normal();
    }
}

if (speeding)
{
    speedtimer++;
    
    if (speedtimer == 0)
    {
        SUSIE.speed = -8;
        SUSIE.sprite_index = sSusieWalkLeft;
        SUSIE.image_speed = 1.6666666666666667;
    }
    
    if (SUSIE.x <= (obj_kris_c3.x + 60))
    {
        talking = true;
        dialogue = 19;
        reset_dialogue_normal();
        SUSIE.image_speed = 0;
        SUSIE.image_index = 0;
        SUSIE.speed = 0;
        SUSIE.sprite_index = sSusieWalkLeftUpset;
        speeding = false;
    }
}

if (out)
{
    outpercent++;
    var outposition = animcurve_channel_evaluate(curvelinear, outpercent / 90);
    
    if (outpercent <= 90)
    {
        KRIS.x = lerp(326, 626, outposition);
        KRIS.image_speed = 0.5;
        SUSIE.x = lerp(378, 678, outposition);
        SUSIE.image_speed = 0.5;
        SUSIE.sprite_index = sSusieWalkRight;
        RALSEI.x = lerp(570, 870, outposition);
        RALSEI.image_speed = 0.5;
        RALSEI.sprite_index = sRalseiWalkRight;
    }
    
    var alpha = lerp(0, 1, outposition);
    draw_sprite_ext(sBlackScreen, 0, 320, 240, 2, 2, 0, c_white, alpha);
    
    if (outpercent == 95)
    {
        talking = true;
        dialogue = 26;
        reset_dialogue_normal();
    }
}

if (ending)
{
    endingpercent++;
    
    if (endingpercent == 6)
    {
        oPersistent.androidsavetimer = -1;
        
        if (!global.c3kreidfightcompleted)
        {
            instance_create_depth(0, 0, -59, obj_memorandum_notice_c3);
            obj_memorandum_notice_c3.image_index = 4;
            global.c3kreidfightcompleted = true;
        }
        
        room_goto(rLambdaruneLogoToC3);
    }
}
