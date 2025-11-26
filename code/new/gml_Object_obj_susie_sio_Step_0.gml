depth = -y;

if (rush)
{
    percent1++;
    
    if (percent1 <= 20)
    {
        sprite_index = spr_susie_attack_prepare_serious;
        instance_create_depth(x, y, depth + 6, obj_susie_sio_echo);
        var position = animcurve_channel_evaluate(curveslowerer, percent1 / 20);
        x = lerp(208, 286, position);
    }
}

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
            
            if (instance_exists(oGlobalC3RoomMikeFight))
            {
                if (!instance_exists(obj_bulletboard_sio))
                {
                    buster.targetx = 570;
                    buster.targety = 190;
                    buster.endangle = 20;
                }
                else
                {
                    buster.targetx = 340;
                    buster.targety = 40;
                    buster.endangle = 70;
                }
            }
        }
        
        if (bustertimer == 10)
        {
        }
    }
}
