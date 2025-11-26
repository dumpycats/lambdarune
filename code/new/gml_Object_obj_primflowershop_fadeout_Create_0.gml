image_xscale = 2;
image_yscale = 2;
image_alpha = 0;

if (global.finished)
{
    oPersistent.androidsavetimer = -1;
    
    if (!global.c3primcompleted)
    {
        instance_create_depth(0, 0, -59, obj_memorandum_notice_c3);
        obj_memorandum_notice_c3.image_index = 5;
        global.c3primcompleted = true;
    }
}
