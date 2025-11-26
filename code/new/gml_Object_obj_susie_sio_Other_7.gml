if (sprite_index == spr_susie_defend)
{
    image_speed = 0;
    image_index = 5;
}

if (sprite_index == spr_susie_item)
{
    sprite_index = spr_susie_idle;
    ENGINE.susiebattleicon = 0;
    var item_entry = ds_map_find_value(global.item_data, ENGINE.used_items);
    var heal_value = ds_map_find_value(item_entry, "heal");
    var team_heal = ds_map_find_value(item_entry, "team_heal");
    
    if (team_heal)
    {
        ENGINE.PARTYMEMBER1.itemchoice = heal_value;
        ENGINE.PARTYMEMBER1.flashtrigger = true;
        ENGINE.PARTYMEMBER2.itemchoice = heal_value;
        ENGINE.PARTYMEMBER2.flashtrigger = true;
        ENGINE.PARTYMEMBER3.itemchoice = heal_value;
        ENGINE.PARTYMEMBER3.flashtrigger = true;
    }
    else if (ENGINE.itemtargets == ENGINE.PARTYMEMBER1)
    {
        if (ENGINE.used_items == ENGINE.ITEM_REVIVE && !ENGINE.krisdown)
        {
            if (global.krishp > 0)
            {
                ENGINE.PARTYMEMBER1.itemchoice = round(global.krismaxhp / 2);
                ENGINE.PARTYMEMBER1.flashtrigger = true;
            }
        }
        else
        {
            ENGINE.PARTYMEMBER1.itemchoice = heal_value;
            ENGINE.PARTYMEMBER1.flashtrigger = true;
        }
    }
    else if (ENGINE.itemtargets == ENGINE.PARTYMEMBER2)
    {
        if (ENGINE.used_items == ENGINE.ITEM_REVIVE && !ENGINE.susiedown)
        {
            if (global.susiehp > 0)
            {
                ENGINE.PARTYMEMBER2.itemchoice = round(global.susiemaxhp / 2);
                ENGINE.PARTYMEMBER2.flashtrigger = true;
            }
        }
        else
        {
            ENGINE.PARTYMEMBER2.itemchoice = heal_value;
            ENGINE.PARTYMEMBER2.flashtrigger = true;
        }
    }
    else if (ENGINE.itemtargets == ENGINE.PARTYMEMBER3)
    {
        if (ENGINE.used_items == ENGINE.ITEM_REVIVE && !ENGINE.ralseidown)
        {
            if (global.ralseihp > 0)
            {
                ENGINE.PARTYMEMBER3.itemchoice = round(global.ralseimaxhp / 2);
                ENGINE.PARTYMEMBER3.flashtrigger = true;
            }
        }
        else
        {
            ENGINE.PARTYMEMBER3.itemchoice = heal_value;
            ENGINE.PARTYMEMBER3.flashtrigger = true;
        }
    }
}

if (sprite_index == spr_susie_mercy)
{
    ENGINE.susiebattleicon = 0;
    
    if (rudebuster)
        bustertriggered = true;
    
    if (ENGINE.susieactoptions == 0 && ENGINE.susieactoptionsvertical == 1)
    {
        ENGINE.PARTYMEMBER2.sprite_index = spr_susie_idle;
        
        if (ENGINE.itemtargets == ENGINE.PARTYMEMBER1)
        {
            ENGINE.PARTYMEMBER1.itemchoice = 16;
            ENGINE.PARTYMEMBER1.flashtrigger = true;
        }
        else if (ENGINE.itemtargets == ENGINE.PARTYMEMBER2)
        {
            ENGINE.PARTYMEMBER2.itemchoice = 16;
            ENGINE.PARTYMEMBER2.flashtrigger = true;
        }
        else if (ENGINE.itemtargets == ENGINE.PARTYMEMBER3)
        {
            ENGINE.PARTYMEMBER3.itemchoice = 16;
            ENGINE.PARTYMEMBER3.flashtrigger = true;
        }
    }
}

if (sprite_index == spr_susie_rudebuster)
{
    sprite_index = spr_susie_idle;
    bustertriggered = false;
    rudebuster = false;
    bustertimer = -1;
    rudetimer = -1;
}

if (sprite_index == spr_susie_attack)
{
    image_speed = 0;
    image_index = 3;
}

if (sprite_index == spr_susie_act)
    sprite_index = spr_susie_idle;
