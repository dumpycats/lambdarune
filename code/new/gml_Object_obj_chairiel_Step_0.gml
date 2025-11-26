var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

if (image_index >= 29)
    image_speed = 0;

sprite_prefetch(spr_chairiel);

if (image_index >= 5)
    chairielshoot = true;

if (chairielshoot)
{
    shottimer++;
    
    if (shottimer == 1)
    {
        instance_create_depth(2814, 199, -51, obj_bulletthin);
        oKrisPlayerC3.sprite_index = sKrisWalkUp;
        oSusieC3.sprite_index = sSusieWalkUp;
        oRalseiC3.sprite_index = sRalseiWalkUp;
        obj_shadowmankr1.sprite_index = spr_shadowman_shock;
        obj_shadowmankr2.sprite_index = spr_shadowman_shock;
        chairielshooting = true;
    }
    
    if (shottimer == 120)
    {
        global.dialogue = 49;
        global.charactertalking = true;
        instance_create_depth(cam_x + 320, cam_y + 394, -40, oDialogueBox);
        instance_create_depth(cam_x + 112, cam_y + 401, -41, oDialogueSprite);
        instance_create_depth(cam_x + 320, cam_y - 270, -50, oTextC3Kreid1);
        oDialogueSprite.sprite_index = sKreidDialogueSprite;
        oDialogueSprite.image_index = 2;
    }
}

if (global.dialogue == 48)
{
    d48timer++;
    
    if (d48timer == 4)
        audio_play_sound(snd_spearrise, 0.7, false);
}

if (global.dialogue == 52)
{
    d52timer++;
    
    if (d52timer == 1)
    {
        image_index = 0;
        oSusieC3.sprite_index = sSusieWalkRight;
        oRalseiC3.sprite_index = sRalseiWalkRight;
        oKrisPlayerC3.sprite_index = sKrisWalkRight;
    }
}

if (global.dialogue == 53)
{
    d53timer++;
    
    if (d53timer == 30)
        obj_KreidKR2.sprite_index = spr_kreideyesclosed;
    
    if (d53timer == 60)
    {
        global.dialogue = 54;
        global.charactertalking = true;
        instance_create_depth(cam_x + 320, cam_y + 394, -40, oDialogueBox);
        instance_create_depth(cam_x + 112, cam_y + 401, -41, oDialogueSprite);
        instance_create_depth(cam_x + 320, cam_y - 270, -50, oTextC3Kreid1);
        oDialogueSprite.sprite_index = sKreidDialogueSprite;
        oDialogueSprite.image_index = 4;
    }
}
