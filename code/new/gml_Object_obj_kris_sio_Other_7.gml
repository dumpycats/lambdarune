if (sprite_index == spr_kris_fight && battlestart)
{
    image_index = 7;
    image_speed = 0;
}

if (sprite_index == spr_kris_act)
    sprite_index = spr_kris_idle;

if (sprite_index == spr_kris_item)
{
    sprite_index = spr_kris_idle;
    ENGINE.krisbattleicon = 0;
    var item_entry = ds_map_find_value(global.item_data, ENGINE.used_itemk);
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
    else if (ENGINE.itemtargetk == ENGINE.PARTYMEMBER1)
    {
        if (ENGINE.used_itemk == ENGINE.ITEM_REVIVE && !ENGINE.krisdown)
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
    else if (ENGINE.itemtargetk == ENGINE.PARTYMEMBER2)
    {
        if (ENGINE.used_itemk == ENGINE.ITEM_REVIVE && !ENGINE.susiedown)
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
    else if (ENGINE.itemtargetk == ENGINE.PARTYMEMBER3)
    {
        if (ENGINE.used_itemk == ENGINE.ITEM_REVIVE && !ENGINE.ralseidown)
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
