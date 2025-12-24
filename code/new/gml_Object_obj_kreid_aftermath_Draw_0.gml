draw_self();

if (d29trigger)
{
    d29timer++;
    
    if (d29timer == 0)
    {
        sprite_index = spr_kreid_walkup;
        y += 2;
    }
    
    if (d29timer == 50)
    {
        talking = true;
        dialogue = 30;
        reset_dialogue_normal();
    }
}

if (drop)
{
    droppercent++;
    
    if (droppercent == 1)
    {
        image_index = 0;
        image_speed = 1;
        sprite_index = spr_kreid_drop;
        instance_destroy(obj_kris_hair);
    }
    
    var dropposition = animcurve_channel_evaluate(curvefaster, droppercent / 4);
    obj_kris_c3.y = lerp(244, 268, dropposition);
    
    if (droppercent == 4)
    {
        audio_play_sound(snd_noise, 1, false);
        obj_kris_c3.image_index = 1;
    }
    
    if (droppercent == 5)
        obj_kris_c3.x += 4;
    
    if (droppercent == 6)
        obj_kris_c3.x -= 8;
    
    if (droppercent == 7)
        obj_kris_c3.x += 6;
    
    if (droppercent == 8)
        obj_kris_c3.x -= 3;
    
    if (droppercent == 9)
        obj_kris_c3.x += 2;
    
    if (droppercent == 10)
        obj_kris_c3.x -= 1;
    
    if (droppercent == 40)
    {
        x += 12;
        image_index = 0;
        sprite_index = spr_kreid_walkup;
        image_speed = 0;
    }
    
    if (droppercent == 60)
    {
        talking = true;
        dialogue = 18;
        reset_dialogue_normal();
        drop = false;
    }
}

if (mercy)
{
    mercypercent++;
    
    if (mercypercent == 1)
    {
        audio_play_sound(snd_mercyadd, 1, false);
        var mercyobj = instance_create_depth(x + 22, y, depth - 100, obj_mercynumber);
        mercyobj.value = lang("obj_kreid_aftermath_Draw_0_0");
        mercyobj.maximum = true;
    }
    
    if (mercypercent == 90)
    {
        x += 14;
        y -= 2;
        sprite_index = spr_kreid_walkleft;
        talking = true;
        dialogue = 26;
        reset_dialogue_normal();
        mercy = false;
    }
}

if (look)
{
    lookpercent++;
    
    if (lookpercent == 1)
    {
        talking = true;
        dialogue = 35;
        reset_dialogue_normal();
        look = false;
    }
}

if (stand)
{
    standpercent++;
    
    if (standpercent == 1)
    {
        obj_kris_c3.sprite_index = sKrisWalkRight;
        obj_kris_c3.image_index = 0;
        obj_kris_c3.y -= 2;
        obj_kris_c3.x += 2;
    }
    
    if (standpercent == 20)
    {
        talking = true;
        dialogue = 36;
        reset_dialogue_normal();
        stand = false;
    }
}

if (stare)
{
    starepercent++;
    
    if (starepercent == 30)
    {
        talking = true;
        dialogue = 37;
        reset_dialogue_normal();
        stare = false;
    }
}

if (walk)
{
    walkpercent++;
    var walkposition = animcurve_channel_evaluate(curvelinear, walkpercent / 24);
    
    if (walkpercent <= 24)
    {
        x = lerp(350, 320, walkposition);
        image_speed = 0.5;
    }
    else if (walkpercent == 25)
    {
        image_speed = 0;
        image_index = 0;
    }
    
    if (walkpercent == 35)
    {
        if (instance_exists(obj_kreid_nohitcheck))
            sprite_index = spr_kreid_nohitnoogie;
        else
            sprite_index = spr_kreid_hug;
        
        image_speed = 1;
        obj_kris_c3.image_alpha = 0;
    }
    
    if (instance_exists(obj_kreid_nohitcheck))
    {
        if (walkpercent == 38)
            audio_play_sound(snd_grab, 1, false);
        
        if (walkpercent == 41)
            audio_play_sound(snd_deathsqueak, 1, false);
    }
}

if (walkout)
{
    walkoutpercent++;
    var walkoutposition = animcurve_channel_evaluate(curvelinear, walkoutpercent / 24);
    
    if (walkoutpercent <= 24)
    {
        x = lerp(320, 350, walkoutposition);
        image_speed = 0.5;
    }
    else if (walkoutpercent == 25)
    {
        image_speed = 0;
        image_index = 0;
    }
    
    if (walkoutpercent == 35)
    {
        talking = true;
        dialogue = 40;
        reset_dialogue_normal();
        stare = false;
    }
}

var advance_pressed = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
var skip_pressed = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X"));

if (!talking || text_complete)
    interacttimer++;

if (place_meeting(x, y, obj_kris_c3) && global.playermove)
{
    if (interacttimer >= 0)
    {
        if (advance_pressed)
        {
            if (dialogue == 40)
            {
                dialogue += 1;
                reset_dialogue_normal();
            }
            
            if (dialogue >= 42)
            {
                dialogue = 43;
                reset_dialogue_normal();
            }
            
            talking = true;
            global.playermove = false;
            obj_kris_c3.image_speed = 0;
            obj_kris_c3.image_index = 0;
        }
    }
}
