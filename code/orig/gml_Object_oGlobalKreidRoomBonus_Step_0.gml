var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
timer++;

if (timer == 30)
    audio_play_sound(mus_THE_GREATEST_COMEDY, 1, false, 0.3, false, 0.1);

if (timer == 120)
{
    global.dialogue = 1;
    global.charactertalking = true;
    instance_create_depth(320, cam_y + 240, -40, oDialogueBox);
    instance_create_depth(112, cam_y + 247, -41, oDialogueSprite);
    oDialogueSprite.sprite_index = sKreidDialogueSprite;
    oDialogueSprite.image_index = 2;
    instance_create_depth(320, cam_y - 270, -43, oTextC3Kreid1Bonus);
}
