if (!oSOULChapter3Select.memoleave && oSOULChapter3Select.memoview)
{
    if (global.c3kreidcompleted)
    {
        if (x == 320)
        {
            timer++;
            
            if (timer >= 20)
                image_alpha += 0.05;
        }
    }
}

if (!(x == 320))
{
    image_alpha -= 0.1;
    timer = 0;
}

if (image_alpha > 1)
    image_alpha = 1;

if (image_alpha < 0)
    image_alpha = 0;
