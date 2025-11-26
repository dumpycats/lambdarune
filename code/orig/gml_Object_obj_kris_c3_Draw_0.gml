draw_sprite_ext(sBlackScreen, 0, x, y, 2, 2, 0, c_white, backgroundalpha);

if (room == rm_ch3_kreidfight || room == rm_ch3_kreidfight_skip)
{
    if (global.endofbattle)
    {
        whitetimer++;
        whitealpha -= 0.05;
        draw_sprite_ext(sWhiteScreen, 0, x, y, 2, 2, 0, c_white, whitealpha);
        
        if (whitealpha == 1)
        {
            obj_kreid_c3.sprite_index = spr_kreid_rage;
            obj_kris_c3.sprite_index = spr_kris_idle;
            obj_kris_c3.image_speed = 1;
            backgroundalpha = 0;
            instance_destroy(obj_shadowspike);
            instance_destroy(obj_shadowspike_2);
            instance_destroy(obj_battle_kf);
            instance_destroy(obj_SOUL_battle);
            instance_destroy(obj_SOUL_TP);
            instance_destroy(obj_tpbar);
            instance_destroy(obj_bulletboard_kf);
        }
        
        switch (whitetimer)
        {
            case 24:
                obj_kreid_c3.xoffset = -1;
                break;
            case 25:
                obj_kreid_c3.xoffset = 2;
                break;
            case 26:
                obj_kreid_c3.xoffset = 2;
                break;
            case 27:
                obj_kreid_c3.xoffset = 0;
                break;
            case 35:
                obj_kreid_c3.xoffset = 2;
                break;
            case 36:
                obj_kreid_c3.xoffset = 4;
                break;
            case 37:
                obj_kreid_c3.xoffset = 1;
                break;
            case 38:
                obj_kreid_c3.xoffset = 0;
                break;
            case 70:
                obj_kreid_c3.xoffset = -1;
                break;
            case 71:
                obj_kreid_c3.xoffset = 3;
                break;
            case 72:
                obj_kreid_c3.xoffset = 1;
                break;
            case 73:
                obj_kreid_c3.xoffset = 0;
                break;
            case 75:
                obj_kreid_c3.xoffset = -2;
                break;
            case 76:
                obj_kreid_c3.xoffset = 4;
                break;
            case 77:
                obj_kreid_c3.xoffset = 0;
                break;
            case 78:
                obj_kreid_c3.image_speed = 1;
                obj_kreid_c3.image_index = 0;
                obj_kreid_c3.sprite_index = spr_kreid_jump;
                break;
            case 79:
                obj_kreid_c3.xoffset = 3;
                break;
            case 81:
                obj_kreid_c3.xoffset = 2;
                break;
            case 82:
                obj_kreid_c3.xoffset = -1;
                break;
            case 83:
                obj_kreid_c3.xoffset = -3;
                break;
            case 84:
                obj_kreid_c3.xoffset = 2;
                break;
            case 85:
                obj_kreid_c3.xoffset = 6;
                break;
            case 86:
                obj_kreid_c3.xoffset = 7;
                break;
            case 87:
                obj_kreid_c3.xoffset = 0;
                obj_plane_kf.endbattle = true;
                break;
            default:
                break;
        }
    }
}

if (instance_exists(obj_battle_kf))
{
    if (global.alldown)
    {
        backgroundalpha = 0.7;
    }
    else if ((global.enemyturn || enginetarget.textenemy) && !manualoff)
    {
        backgroundalpha += (1/30);
        backgroundalpha = clamp(backgroundalpha, 0, 0.5);
    }
    else
    {
        backgroundalpha -= (1/30);
        backgroundalpha = clamp(backgroundalpha, 0, 0.5);
    }
}

draw_self();

if (flashalpha > 0)
{
    shader_set(shFlash);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, flashcolor, flashalpha);
    shader_reset();
}

if (flashtrigger)
{
    flashpercent += 0.1;
    
    if (flashpercent <= 0.5)
        flashalpha += 0.2;
    else
        flashalpha -= 0.2;
    
    if (flashpercent == 1)
        flashtrigger = false;
}
else
{
    flashalpha = 0;
    flashpercent = 0;
}

if (room == rm_ch3_fountain)
{
    flashalpha = 1;
    draw_sprite_ext(sprite_index, image_index, x, y + 4, image_xscale, image_yscale, 0, c_black, image_alpha);
    draw_sprite_ext(sprite_index, image_index, x, (y - 4) + (sprite_yoffset * 4), image_xscale, image_yscale * -3, 0, c_black, image_alpha);
}
