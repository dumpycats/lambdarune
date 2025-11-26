if (!instance_exists(obj_battle_sio))
{
    instance_destroy();
    instance_create_depth(x, y, -684, obj_sio_text_postbattle);
}
