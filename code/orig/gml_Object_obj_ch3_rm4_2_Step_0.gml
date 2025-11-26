if (global.krishp <= 0)
{
    image_blend = gonecolor;
    oSusieC3.image_speed = 0;
    oKrisPlayerC3.image_speed = 0;
    gameovertimer++;
}

if (gameovertimer == 30)
{
    instance_destroy(oGlobalHP_R3);
    instance_destroy(obj_chaseSR_empty);
    instance_destroy(obj_healthbar_kris);
    instance_destroy(obj_healthbar_susie);
    instance_destroy(txt_krishp_overworld);
    instance_destroy(txt_krismaxhp_overworld);
    instance_destroy(txt_susiehp_overworld);
    instance_destroy(txt_susiemaxhp_overworld);
    room_goto(rGameOverR3C3);
}
