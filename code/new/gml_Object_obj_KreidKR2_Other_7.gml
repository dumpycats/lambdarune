var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

if (htimer1 > 5 && sprite_index == spr_kreidhatremove)
{
    sprite_index = spr_kreididle;
    global.dialogue = 23;
    global.charactertalking = true;
    instance_create_depth(cam_x + 320, cam_y + 394, -40, oDialogueBox);
    instance_create_depth(cam_x + 112, cam_y + 401, -41, oDialogueSprite);
    oDialogueSprite.sprite_index = sKreidDialogueSprite;
    oDialogueSprite.image_index = 5;
    instance_create_depth(cam_x + 320, cam_y - 270, -50, oTextC3Kreid1);
}

if (sprite_index == spr_kreidsnap)
    sprite_index = spr_kreididle;

if (sprite_index == spr_kreidhatunremove)
{
    sprite_index = spr_kreidhatidle;
    global.dialogue = 56;
    global.charactertalking = true;
    instance_create_depth(cam_x + 320, cam_y + 394, -40, oDialogueBox);
    instance_create_depth(cam_x + 112, cam_y + 401, -41, oDialogueSprite);
    oDialogueSprite.sprite_index = sKreidDialogueSprite;
    oDialogueSprite.image_index = 0;
    instance_create_depth(cam_x + 320, cam_y - 270, -50, oTextC3Kreid1);
}
