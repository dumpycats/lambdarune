image_alpha += 0.016;
audio_sound_gain(g, 0, 666);

if (image_alpha >= 1)
{
    timer++;
    
    if (timer == 75)
        room_goto(rChapter3Room1);
}
