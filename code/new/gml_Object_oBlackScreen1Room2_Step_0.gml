image_alpha += 0.1;

if (image_alpha >= 1)
    audio_stop_all();

if (global.wtfdialogue == 0)
{
    if (image_alpha == 1.1)
        room_goto(rChapter3Room3);
}

if (global.wtfdialogue == 1)
{
    if (image_alpha == 4.4)
        room_goto(rChapter3Room3);
}
