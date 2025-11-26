window_set_caption("LAMBDARUNE Chapter 3");
sprite_prefetch(sSusieDialogueSprite);
sprite_prefetch(sDialogueBox);
audio_sound_gain(snd_foane, 0.4, 0);
audio_sound_gain(snd_mike, 0.6, 0);
audio_stop_sound(mus_outofbounds);
timer = 0;
dialogue2timer = 0;
dialogue4timer = 0;
dialogue6timer = 0;
dialogue12timer = 0;
dialogue19timer = 0;
global.dialogue = 1;
global.ralseitalk = false;
global.susietalk = false;
global.texttalk = false;
global.emptytalk = false;
global.foanetalk = false;
global.feighlinetalk = false;
global.playermove = true;
global.charactertalking = false;
global.dialoguetop = false;
global.dialoguebottom = true;

if (!instance_exists(obj_spacechannel_screen1))
    instance_create_depth(771, 446, 0, obj_spacechannel_screen1);

if (!instance_exists(obj_spacechannel_screen2))
    instance_create_depth(1291, 446, 0, obj_spacechannel_screen2);
