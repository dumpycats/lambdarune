image_alpha += 0.1;

if (image_alpha == 1)
{
}

if (image_alpha == 1.1)
{
    instance_destroy(obj_chaseSR_empty);
    instance_destroy(obj_healthbar_kris);
    instance_destroy(obj_healthbar_susie);
    instance_destroy(txt_krishp_overworld);
    instance_destroy(txt_krismaxhp_overworld);
    instance_destroy(txt_susiehp_overworld);
    instance_destroy(txt_susiemaxhp_overworld);
    room_goto(rChapter3Room5);
}
