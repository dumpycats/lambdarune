var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
timer++;

if (timer == 1)
    audio_sound_gain(mus_wind, 10, 1000);

if (timer == 105)
    oSusieC3.image_index = 1;

if (timer == 120)
{
    global.dialogue = 1;
    global.charactertalking = true;
    instance_create_depth(320, cam_y + 86, -40, oDialogueBox);
    instance_create_depth(112, cam_y + 93, -41, oDialogueSprite);
    oDialogueSprite.sprite_index = sSusieDialogueSprite;
    oDialogueSprite.image_index = 15;
    instance_create_depth(320, cam_y - 270, -50, oTextC3R1);
}

if (global.dialogue == 2)
{
    dialogue2timer++;
    
    if (dialogue2timer == 20)
        oSusieC3.image_index = 0;
    
    if (dialogue2timer == 25)
        oSusieC3.image_index = 1;
    
    if (dialogue2timer == 30)
        oSusieC3.image_index = 0;
    
    if (dialogue2timer == 35)
        oSusieC3.image_index = 1;
    
    if (dialogue2timer == 65)
    {
        oSusieC3.sprite_index = sSusieLand;
        oSusieC3.image_index = 0;
        audio_play_sound(snd_wing, 1, false);
    }
    
    if (dialogue2timer == 80)
    {
        oSusieC3.sprite_index = sSusieWalkLeftUpset;
        oSusieC3.image_index = 0;
        audio_play_sound(snd_wing, 1, false);
    }
}
else
{
    dialogue2timer = 0;
}

if (dialogue2timer == 125)
{
    global.dialogue = 3;
    global.charactertalking = true;
    instance_create_depth(320, cam_y + 86, -40, oDialogueBox);
    instance_create_depth(112, cam_y + 93, -41, oDialogueSprite);
    oDialogueSprite.sprite_index = sSusieDialogueSprite;
    oDialogueSprite.image_index = 23;
    instance_create_depth(320, cam_y - 270, -50, oTextC3R1);
}

if (global.dialogue == 4)
{
    dialogue4timer++;
    
    if (dialogue4timer == 15)
        oSusieC3.sprite_index = sSusieWalkDownUpset;
    
    if (dialogue4timer == 30)
        oSusieC3.sprite_index = sSusieWalkRightUpset;
    
    if (dialogue4timer == 45)
        oSusieC3.sprite_index = sSusieWalkUp;
    
    if (dialogue4timer == 75)
    {
        global.dialogue = 5;
        global.charactertalking = true;
        instance_create_depth(320, cam_y + 86, -40, oDialogueBox);
        instance_create_depth(112, cam_y + 93, -41, oDialogueSprite);
        oDialogueSprite.sprite_index = sSusieDialogueSprite;
        oDialogueSprite.image_index = 3;
        instance_create_depth(320, cam_y - 270, -50, oTextC3R1);
    }
}
else
{
    dialogue4timer = 0;
}

if (global.dialogue == 6)
{
    dialogue6timer++;
    
    if (dialogue6timer == 10)
        oKrisPlayerC3.sprite_index = sKrisWalkDown;
    
    if (dialogue6timer == 55)
    {
        global.dialogue = 7;
        global.charactertalking = true;
        instance_create_depth(320, cam_y + 86, -40, oDialogueBox);
        instance_create_depth(112, cam_y + 93, -41, oDialogueSprite);
        oDialogueSprite.sprite_index = sSusieDialogueSprite;
        oDialogueSprite.image_index = 11;
        instance_create_depth(320, cam_y - 270, -50, oTextC3R1);
    }
}
else
{
    dialogue6timer = 0;
}

var cam_x2 = camera_get_view_x(view_camera[1]);
var cam_y2 = camera_get_view_y(view_camera[1]);
camera = camera_create();
camera = view_camera[1];

if (global.dialogue == 12)
{
    dialogue12timer++;
    
    if (dialogue12timer == 15)
        oKrisPlayerC3.sprite_index = sKrisWalkUp;
    
    if (dialogue12timer >= 70 && dialogue12timer <= 175)
    {
        view_camera[0] = view_camera[1];
        cam_y2 -= 1;
        camera_set_view_pos(camera, cam_x, cam_y2);
        global.dialoguetop = false;
        global.dialoguebottom = true;
    }
    
    if (dialogue12timer == 205)
    {
        global.dialogue = 13;
        global.charactertalking = true;
        instance_create_depth(320, cam_y2 + 394, -40, oDialogueBox);
        instance_create_depth(112, cam_y2 + 401, -41, oDialogueSprite);
        oDialogueSprite.sprite_index = sSusieDialogueSprite;
        oDialogueSprite.image_index = 34;
        instance_create_depth(320, cam_y - 270, -50, oTextC3R1);
    }
}

if (global.dialogue == 19)
{
    dialogue19timer++;
    
    if (dialogue19timer >= 0 && dialogue19timer < 53)
    {
        view_camera[0] = view_camera[1];
        cam_y2 += 2;
        camera_set_view_pos(camera, cam_x, cam_y2);
        global.dialoguetop = true;
        global.dialoguebottom = false;
    }
    
    if (dialogue19timer >= 53)
    {
        view_camera[1] = view_camera[0];
        view_camera[0] = view_camera[0];
    }
    
    if (dialogue19timer == 68)
    {
        global.dialogue = 20;
        global.charactertalking = true;
        instance_create_depth(320, cam_y + 394, -40, oDialogueBox);
        instance_create_depth(112, cam_y + 401, -41, oDialogueSprite);
        oDialogueSprite.sprite_index = sSusieDialogueSprite;
        oDialogueSprite.image_index = 1;
        instance_create_depth(320, cam_y - 270, -50, oTextC3R1);
    }
}
else
{
    dialogue19timer = 0;
}
