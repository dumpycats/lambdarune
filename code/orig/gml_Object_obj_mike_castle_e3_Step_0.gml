timer++;

if (timer == 40)
{
    with (obj_ch3_epilogue_text)
    {
        talking = true;
        dialogue = 74;
        reset_dialogue_normal();
    }
}

x = xx + xoffset;

if (jiggle)
    jiggletimer++;

switch (jiggletimer)
{
    case 0:
        image_index = 10;
        xoffset = 4;
        break;
    case 2:
        xoffset = -4;
        break;
    case 4:
        xoffset = 3;
        break;
    case 6:
        xoffset = -3;
        break;
    case 8:
        xoffset = 2;
        break;
    case 10:
        xoffset = -2;
        break;
    case 12:
        xoffset = 1;
        break;
    case 14:
        xoffset = -1;
        break;
    case 16:
        xoffset = 0;
        obj_ch3_epilogue_text.e1trigger = false;
        
        with (obj_ch3_epilogue_text)
        {
            if (dialogue <= 78)
            {
                talking = true;
                dialogue = 76;
                reset_dialogue_normal();
            }
        }
        
        jiggle = false;
        jiggletimer = -1;
        break;
}
