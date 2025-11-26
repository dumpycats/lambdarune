if (timer < 12)
    draw_sprite_ext(spr_SOUL_line, 0, 320, 360, 1, 1 - (timer / 12), 0, c_white, 1);

draw_self();

if (timer == 170)
{
    oPersistent.androidsavetimer = -1;
    room_goto(rm_ch3credits_installment2);
    
    if (!global.c3epiloguecompleted)
    {
        instance_create_depth(0, 0, -59, obj_memorandum_notice_c3);
        obj_memorandum_notice_c3.image_index = 8;
        global.c3epiloguecompleted = true;
    }
}

if (timer == 230)
{
}
