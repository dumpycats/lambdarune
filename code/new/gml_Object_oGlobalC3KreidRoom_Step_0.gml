var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
var cam_x2 = camera_get_view_x(view_camera[1]);
var cam_y2 = camera_get_view_y(view_camera[1]);
var cam_1 = view_camera[1];
sprite_prefetch(sDialogueBox);
sprite_prefetch(sSusieDialogueSprite);
timer++;

if (timer == -50)
{
    global.dialoguetop = false;
    global.dialogue = 1;
    global.charactertalking = true;
    instance_create_depth(320, cam_y + 394, -40, oDialogueBox);
    instance_create_depth(112, cam_y + 401, -41, oDialogueSprite);
    oDialogueSprite.sprite_index = sRalseiDialogueSprite;
    oDialogueSprite.image_index = 18;
    instance_create_depth(320, cam_y - 270, -50, oTextC3Kreid1);
}

if (timer == 1)
{
    audio_sound_gain(snd_noise, 1, 0);
    audio_sound_gain(mus_strollingshady, 1, 0);
    audio_sound_gain(mus_kreid_overworld, 1, 0);
}

if (oKrisPlayerC3.x >= 750)
    shadowspawn = true;

if (global.dialogue < 46)
{
    cam_xpre = cam_x;
    cam_x2 = cam_x;
    cam_y2 = cam_y;
}

if (global.dialogue == 46)
{
    audio_sound_gain(mus_kreid_overworld, 0, 1000);
    var cam0 = view_camera[0];
    camera_set_view_target(cam0, obj_cameracontroller);
}
