if (!(room == rm_ch3_sof_skip) && !(room == rm_ch3_sof))
    depth = -y;

if (rudebuster && bustertriggered)
{
    rudetimer++;
    
    if (rudetimer == 0)
    {
        sprite_index = spr_susie_rudebuster;
        image_index = 0;
        image_speed = 1;
    }
    
    if (image_index >= 5)
    {
        bustertimer++;
        
        if (bustertimer == 0)
        {
            var buster = instance_create_depth(x + 100, y + 24, depth - 50, obj_rudebuster);
            
            if (instance_exists(oGlobalC3RoomSOFPath))
            {
                if (instance_exists(obj_bulletboard_sof))
                {
                    buster.targetx = 500;
                    buster.targety = 240;
                    buster.endangle = 0;
                }
            }
        }
        
        if (bustertimer == 10)
        {
        }
        
        if (instance_exists(obj_rudebuster))
        {
            obj_rudebuster.targetx = 512;
            obj_rudebuster.targety = 204;
            obj_rudebuster.endangle = 15;
        }
    }
}
