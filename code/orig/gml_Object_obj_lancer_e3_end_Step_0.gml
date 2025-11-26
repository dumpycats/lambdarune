depth = -y - 50;
timer++;

if (timer == 120)
{
    with (obj_ch3_epilogue_text)
    {
        talking = true;
        dialogue = 109;
        dialoguebottom = false;
        dialoguetop = true;
        reset_dialogue_normal();
    }
}
