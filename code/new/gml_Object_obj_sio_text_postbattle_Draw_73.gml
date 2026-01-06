var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

if (talking)
{
    interacttimer = -2;
    subimg += 0.1;
    
    if (dialoguetop)
    {
        draw_sprite_ext(sDialogueBox, subimg, cam_x + 320, cam_y + 86, 1, 1, 0, c_white, 1);
        quipyoffset = -308;
    }
    else if (dialoguebottom)
    {
        draw_sprite_ext(sDialogueBox, subimg, cam_x + 320, cam_y + 394, 1, 1, 0, c_white, 1);
        quipyoffset = 0;
    }
    
    draw_set_alpha(1);
    draw_set_font(fDeterminationMW);
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    var text_x;
    
    if (!(dialogue == 1300))
    {
        text_x = charactertalking ? (camera_get_view_x(view_camera[0]) + 174) : (camera_get_view_x(view_camera[0]) + 58);
        
        if (dialoguebottom)
            text_y = camera_get_view_y(view_camera[0]) + 338;
        else if (dialoguetop)
            text_y = camera_get_view_y(view_camera[0]) + 30;
    }
    
    var shadow_color = 8192771;
    var shadow_color1 = 4667705;
    
    if (!destroy)
    {
        draw_text_color(text_x + 1, text_y + 1, displayed_text, shadow_color1, shadow_color1, shadow_color, shadow_color, 1);
        draw_set_color(c_white);
        draw_text(text_x, text_y, displayed_text);
    }
    
    var advance_pressed = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
    var skip_pressed = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X"));
    
    switch (dialogue)
    {
        case 1:
            susietalk = false;
            tennatalk = true;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 1;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_0"), 25);
            typing_speed = 1;
            break;
        case 2:
            susietalk = false;
            tennatalk = true;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 0;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_1"), 25);
            typing_speed = 1;
            break;
        case 3:
            susietalk = false;
            tennatalk = true;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 0;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_2"), 25);
            typing_speed = 1;
            break;
        case 4:
            susietalk = false;
            tennatalk = true;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 4;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_3"), 25);
            typing_speed = 1;
            break;
        case 5:
            susietalk = false;
            tennatalk = true;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 5;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_4"), 25);
            typing_speed = 1;
            break;
        case 6:
            susietalk = false;
            tennatalk = true;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 4;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_5"), 25);
            typing_speed = 1;
            break;
        case 7:
            susietalk = false;
            tennatalk = true;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 0;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_6"), 25);
            typing_speed = 1;
            break;
        case 8:
            ralseitalk = true;
            tennatalk = false;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 20;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_7"), 25);
            typing_speed = 1;
            break;
        case 9:
            ralseitalk = false;
            tennatalk = true;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_8"), 25);
            typing_speed = 1;
            break;
        case 10:
            susietalk = false;
            tennatalk = true;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 7;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_9"), 25);
            typing_speed = 1;
            break;
        case 11:
            susietalk = true;
            tennatalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 4;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_10"), 25);
            typing_speed = 1;
            break;
        case 12:
            susietalk = false;
            tennatalk = true;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_11"), 25);
            typing_speed = 1;
            break;
        case 13:
            texttalk = true;
            charactertalking = false;
            tennatalk = false;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_12"), 31);
            typing_speed = 1;
            d13timer++;
            
            if (d13timer == 0)
            {
                window_set_caption(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_13"));
                obj_maximike_battle.aura = true;
                audio_play_sound(snd_rocket_long, 1, false);
                audio_play_sound(snd_closet_impact, 1, false);
                obj_susie_sio.sprite_index = spr_susie_shocked;
                obj_ralsei_sio.sprite_index = spr_ralsei_shock;
            }
            
            break;
        case 14:
            texttalk = false;
            charactertalking = true;
            tennatalk = true;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 0;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_14"), 25);
            typing_speed = 1;
            break;
        case 15:
            susietalk = false;
            tennatalk = true;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 0;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_15"), 25);
            typing_speed = 1;
            break;
        case 16:
            susietalk = false;
            tennatalk = true;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 0;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_16"), 25);
            typing_speed = 1;
            break;
        case 17:
            susietalk = false;
            tennatalk = true;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 0;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_17"), 25);
            typing_speed = 1;
            break;
        case 18:
            susietalk = false;
            tennatalk = true;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 4;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_18"), 25);
            typing_speed = 1;
            break;
        case 19:
            susietalk = false;
            tennatalk = true;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 5;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_19"), 25);
            typing_speed = 1;
            break;
        case 20:
            susietalk = false;
            tennatalk = true;
            charactertalking = false;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 5;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_20"), 25);
            typing_speed = 1;
            obj_susie_sio.sprite_index = sSusieWalkRightUpset;
            obj_ralsei_sio.sprite_index = sRalseiWalkRight;
            break;
        case 21:
            tennatalk = true;
            texttalk = false;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 3;
            charactertalking = true;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_21"), 25);
            typing_speed = 1;
            break;
        case 22:
            susietalk = false;
            tennatalk = true;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 3;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_22"), 25);
            typing_speed = 1;
            break;
        case 23:
            miketalk = true;
            tennatalk = false;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 3;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_23"), 31);
            typing_speed = 1;
            charactertalking = false;
            audio_stop_sound(snd_deep_noise);
            break;
        case 24:
            miketalk = true;
            tennatalk = false;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 3;
            charactertalking = false;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_24"), 31);
            typing_speed = 1;
            break;
        case 25:
            miketalk = false;
            tennatalk = true;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 3;
            charactertalking = true;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_25"), 25);
            typing_speed = 1;
            break;
        case 26:
            miketalk = true;
            tennatalk = false;
            charactertalking = false;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 3;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_26"), 31);
            typing_speed = 1;
            break;
        case 27:
            miketalk = true;
            tennatalk = false;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 3;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_27"), 31);
            typing_speed = 1;
            break;
        case 28:
            miketalk = true;
            tennatalk = false;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 3;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_28"), 31);
            typing_speed = 1;
            break;
        case 29:
            miketalk = true;
            tennatalk = false;
            charactertalking = true;
            dialogueiconchoice = mikedialoguesprite;
            dialogueicon = 1;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_29"), 25);
            typing_speed = 1;
            break;
        case 30:
            miketalk = false;
            ralseitalk = false;
            susietalk = true;
            charactertalking = true;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 6;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_30"), 25);
            typing_speed = 1;
            break;
        case 31:
            miketalk = false;
            ralseitalk = false;
            susietalk = true;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 3;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_31"), 25);
            typing_speed = 1;
            break;
        case 32:
            susietalk = false;
            tennatalk = true;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_32"), 25);
            typing_speed = 1;
            obj_mike_sio_aftermath.sprite_index = spr_mike_spin;
            obj_mike_sio_aftermath.image_index = 6;
            break;
        case 33:
            miketalk = true;
            tennatalk = false;
            dialogueiconchoice = mikedialoguesprite;
            dialogueicon = 6;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_33"), 25);
            typing_speed = 1;
            obj_mike_sio_aftermath.image_index = 10;
            break;
        case 34:
            susietalk = false;
            tennatalk = true;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 3;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_34"), 25);
            typing_speed = 1;
            break;
        case 35:
            susietalk = false;
            tennatalk = true;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 8;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_35"), 25);
            typing_speed = 1;
            obj_tenna_sio_aftermath.image_index = 5;
            break;
        case 36:
            miketalk = true;
            tennatalk = false;
            dialogueiconchoice = mikedialoguesprite;
            dialogueicon = 10;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_36"), 25);
            typing_speed = 1;
            obj_mike_sio_aftermath.image_index = 1;
            break;
        case 37:
            miketalk = true;
            tennatalk = false;
            dialogueiconchoice = mikedialoguesprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_37"), 25);
            typing_speed = 1;
            obj_mike_sio_aftermath.image_index = 2;
            break;
        case 38:
            miketalk = true;
            tennatalk = false;
            dialogueiconchoice = mikedialoguesprite;
            dialogueicon = 7;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_38"), 25);
            typing_speed = 1;
            obj_mike_sio_aftermath.image_index = 1;
            break;
        case 39:
            miketalk = true;
            tennatalk = false;
            dialogueiconchoice = mikedialoguesprite;
            dialogueicon = 12;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_39"), 25);
            typing_speed = 1;
            obj_mike_sio_aftermath.image_index = 2;
            break;
        case 40:
            miketalk = true;
            tennatalk = false;
            dialogueiconchoice = mikedialoguesprite;
            dialogueicon = 12;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_40"), 26);
            typing_speed = 1;
            obj_mike_sio_aftermath.image_index = 7;
            break;
        case 41:
            miketalk = true;
            tennatalk = false;
            dialogueiconchoice = mikedialoguesprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_41"), 25);
            typing_speed = 1;
            obj_mike_sio_aftermath.image_index = 6;
            break;
        case 42:
            susietalk = false;
            tennatalk = true;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 1;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_42"), 25);
            typing_speed = 1;
            obj_tenna_sio_aftermath.image_index = 4;
            break;
        case 43:
            susietalk = false;
            tennatalk = true;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 8;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_43"), 25);
            typing_speed = 1;
            break;
        case 44:
            susietalk = true;
            ralseitalk = false;
            miketalk = false;
            tennatalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 4;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_44"), 25);
            typing_speed = 1;
            obj_mike_sio_aftermath.image_index = 0;
            break;
        case 45:
            susietalk = true;
            ralseitalk = false;
            miketalk = false;
            tennatalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 0;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_45"), 25);
            typing_speed = 1;
            break;
        case 46:
            susietalk = false;
            ralseitalk = false;
            miketalk = false;
            tennatalk = true;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_46"), 25);
            typing_speed = 1;
            break;
        case 47:
            susietalk = true;
            ralseitalk = false;
            miketalk = false;
            tennatalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 25;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_47"), 25);
            typing_speed = 1;
            break;
        case 48:
            susietalk = true;
            ralseitalk = false;
            miketalk = false;
            tennatalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 12;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_48"), 25);
            typing_speed = 1;
            break;
        case 49:
            susietalk = true;
            ralseitalk = false;
            miketalk = false;
            tennatalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 10;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_49"), 25);
            typing_speed = 1;
            break;
        case 50:
            susietalk = true;
            ralseitalk = false;
            miketalk = false;
            tennatalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 13;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_50"), 25);
            typing_speed = 1;
            break;
        case 51:
            susietalk = true;
            ralseitalk = false;
            miketalk = false;
            tennatalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 5;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_51"), 25);
            typing_speed = 1;
            break;
        case 52:
            susietalk = true;
            ralseitalk = false;
            miketalk = false;
            tennatalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 0;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_52"), 25);
            typing_speed = 1;
            break;
        case 53:
            susietalk = true;
            ralseitalk = false;
            miketalk = false;
            tennatalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 3;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_53"), 25);
            typing_speed = 1;
            break;
        case 54:
            susietalk = true;
            ralseitalk = false;
            miketalk = false;
            tennatalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_54"), 25);
            typing_speed = 1;
            obj_susie_sio.sprite_index = sSusieWalkDown;
            break;
        case 55:
            susietalk = false;
            ralseitalk = true;
            miketalk = false;
            tennatalk = false;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 13;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_55"), 25);
            typing_speed = 1;
            obj_ralsei_sio.sprite_index = sRalseiWalkUp;
            break;
        case 56:
            susietalk = false;
            ralseitalk = true;
            miketalk = false;
            tennatalk = false;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 17;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_56"), 25);
            typing_speed = 1;
            break;
        case 57:
            miketalk = true;
            ralseitalk = false;
            dialogueiconchoice = mikedialoguesprite;
            dialogueicon = 5;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_57"), 25);
            typing_speed = 1;
            obj_mike_sio_aftermath.image_index = 0;
            obj_susie_sio.sprite_index = sSusieWalkRight;
            obj_ralsei_sio.sprite_index = sRalseiWalkRight;
            break;
        case 58:
            tennatalk = true;
            miketalk = false;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 9;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_58"), 25);
            typing_speed = 1;
            obj_tenna_sio_aftermath.image_index = 6;
            break;
        case 59:
            tennatalk = false;
            miketalk = true;
            dialogueiconchoice = mikedialoguesprite;
            dialogueicon = 0;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_59"), 25);
            typing_speed = 1;
            break;
        case 60:
            tennatalk = true;
            miketalk = false;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 4;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_60"), 25);
            typing_speed = 1;
            obj_tenna_sio_aftermath.sprite_index = spr_tenna_neutral;
            obj_tenna_sio_aftermath.image_index = 0;
            break;
        case 61:
            tennatalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 26;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_61"), 25);
            typing_speed = 1;
            break;
        case 62:
            tennatalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_62"), 25);
            typing_speed = 1;
            break;
        case 63:
            tennatalk = true;
            ralseitalk = false;
            dialogueiconchoice = sTennaDialogueSprite;
            dialogueicon = 1;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_63"), 25);
            typing_speed = 1;
            break;
        case 64:
            quip = true;
            quipstring = get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_64");
            quipicon = sSusieDialogueSprite;
            quipindex = 12;
            tennatalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 5;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_65"), 25);
            typing_speed = 1;
            break;
        case 65:
            quip = false;
            ralseitalk = false;
            miketalk = true;
            dialogueiconchoice = mikedialoguesprite;
            dialogueicon = 5;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_66"), 25);
            typing_speed = 1;
            obj_mike_sio_aftermath.image_index = 6;
            break;
        case 66:
            tennatalk = false;
            miketalk = true;
            dialogueiconchoice = mikedialoguesprite;
            dialogueicon = 0;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_67"), 25);
            typing_speed = 1;
            obj_mike_sio_aftermath.sprite_index = spr_mike_happiest;
            obj_mike_sio_aftermath.image_index = 6;
            obj_tenna_sio_aftermath.sprite_index = spr_tenna_wary;
            obj_tenna_sio_aftermath.image_index = 0;
            endcase1end = dialogue;
            break;
        case 67:
            susietalk = true;
            miketalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 3;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_68"), 25);
            typing_speed = 1;
            obj_mike_sio_aftermath.image_speed = 0;
            break;
        case 68:
            susietalk = false;
            miketalk = true;
            dialogueiconchoice = mikedialoguesprite;
            dialogueicon = 10;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_69"), 25);
            typing_speed = 1;
            obj_mike_sio_aftermath.sprite_index = spr_mike_spin;
            obj_mike_sio_aftermath.image_index = 0;
            endcase2end = dialogue;
            break;
        case 69:
            tennatalk = false;
            miketalk = true;
            charactertalking = false;
            dialogueiconchoice = mikedialoguesprite;
            dialogueicon = 3;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_70"), 31);
            typing_speed = 1;
            obj_mike_sio_aftermath.sprite_index = spr_mike_spin;
            obj_mike_sio_aftermath.image_index = 2;
            break;
        case 70:
            tennatalk = false;
            miketalk = true;
            dialogueiconchoice = mikedialoguesprite;
            dialogueicon = 3;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_71"), 31);
            typing_speed = 1;
            endcase3end = dialogue;
            break;
        case 71:
            tennatalk = false;
            miketalk = true;
            dialogueiconchoice = mikedialoguesprite;
            dialogueicon = 3;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_72"), 25);
            typing_speed = 1;
            break;
        case 72:
            tennatalk = false;
            miketalk = true;
            dialogueiconchoice = mikedialoguesprite;
            dialogueicon = 3;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_73"), 31);
            typing_speed = 1;
            break;
        case 73:
            tennatalk = false;
            miketalk = true;
            dialogueiconchoice = mikedialoguesprite;
            dialogueicon = 3;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_74"), 31);
            typing_speed = 1;
            break;
        case 74:
            tennatalk = false;
            miketalk = true;
            dialogueiconchoice = mikedialoguesprite;
            dialogueicon = 3;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_75"), 31);
            typing_speed = 1;
            break;
        case 75:
            tennatalk = false;
            miketalk = true;
            dialogueiconchoice = mikedialoguesprite;
            dialogueicon = 3;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_76"), 31);
            typing_speed = 1;
            break;
        case 76:
            tennatalk = false;
            miketalk = true;
            dialogueiconchoice = mikedialoguesprite;
            dialogueicon = 3;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_77"), 31);
            typing_speed = 1;
            break;
        case 77:
            tennatalk = false;
            miketalk = true;
            dialogueiconchoice = mikedialoguesprite;
            dialogueicon = 3;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_78"), 31);
            typing_speed = 1;
            break;
        case 78:
            tennatalk = false;
            miketalk = true;
            dialogueiconchoice = mikedialoguesprite;
            charactertalking = true;
            dialogueicon = 1;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_79"), 25);
            typing_speed = 1;
            mikeshake = true;
            obj_mike_sio_aftermath.sprite_index = spr_mike_happiest;
            obj_mike_sio_aftermath.image_index = 0;
            break;
        case 79:
            tennatalk = false;
            miketalk = true;
            dialogueiconchoice = mikedialoguesprite;
            dialogueicon = 5;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_80"), 25);
            typing_speed = 1;
            obj_mike_sio_aftermath.sprite_index = spr_mike_spin;
            obj_mike_sio_aftermath.image_index = 3;
            endcase4end = dialogue;
            break;
        default:
            current_dialogue = "";
            break;
    }
    
    if (destroy)
    {
        blockprogress = true;
        instance_destroy();
    }
    
    if (!text_complete && !pause_for_punctuation)
    {
        typing_timer += typing_speed;
        
        while (typing_timer >= 1)
        {
            typing_timer -= 1;
            
            if (letter_index < string_length(current_dialogue))
            {
                var next_char = string_char_at(current_dialogue, letter_index + 1);
                var following_char = ((letter_index + 2) <= string_length(current_dialogue)) ? string_char_at(current_dialogue, letter_index + 2) : "";
                
                if (next_char == " " && following_char == " ")
                {
                    displayed_text += "  ";
                    letter_index += 2;
                }
                else
                {
                    displayed_text += next_char;
                    
                    if ((next_char == "," || next_char == ":") || next_char == ".")
                    {
                        alarm[0] = 4;
                        pause_for_punctuation = true;
                        letter_index += 1;
                        break;
                    }
                    else if (next_char == "}" || next_char == "{" || next_char == "@")
                    {
                        alarm[0] = 10;
                        pause_for_punctuation = true;
                        letter_index += 1;
                        break;
                    }
                    else if (next_char != " " && next_char != "*" && next_char != "?" && displayed_text != "*" && next_char != ")" && next_char != "!")
                    {
                        if (susietalk)
                            audio_play_sound(snd_susie, 1, false);
                        else if (ralseitalk)
                            audio_play_sound(snd_ralsei, 1, false);
                        else if (texttalk)
                            audio_play_sound(snd_text, 1, false);
                        else if (tennatalk)
                            audio_play_sound(snd_tenna, 1, false);
                        else if (miketalk)
                            audio_play_sound(snd_mike, 1, false, 0.5);
                    }
                    
                    letter_index += 1;
                }
            }
            else
            {
                text_complete = true;
                break;
            }
        }
    }
    
    var endcase = [20, 24, 28, endcase1end, endcase2end, endcase3end, endcase4end];
    
    if ((advance_pressed && !blockprogress) || skiptimer == 3)
    {
        if (text_complete)
        {
            quippercent = 0;
            
            if (array_contains(endcase, dialogue))
            {
                if (dialogue == 20)
                    d20trigger = true;
                
                if (dialogue == 24)
                    d24trigger = true;
                
                if (dialogue == 28)
                    d28trigger = true;
                
                if (dialogue == endcase1end)
                    d51trigger = true;
                
                if (dialogue == endcase2end)
                    d53trigger = true;
                
                if (dialogue == endcase3end)
                    d55trigger = true;
                
                if (dialogue == endcase4end)
                    d64trigger = true;
                
                talking = false;
            }
            else
            {
                dialogue += 1;
                reset_dialogue_normal();
            }
        }
        
        skiptimer = -1;
    }
    else if (skip_pressed && !advance_pressed && !blockprogress)
    {
        displayed_text = current_dialogue;
        text_complete = true;
        audio_stop_sound(snd_ralsei);
        audio_stop_sound(snd_susie);
        audio_stop_sound(snd_text);
        audio_stop_sound(snd_tenna);
        audio_stop_sound(snd_mike);
    }
    
    if (keyboard_check(ord("C")) && !blockprogress)
        skiptext = true;
    
    if (keyboard_check_released(ord("C")) || blockprogress)
        skiptext = false;
    
    if (skiptext)
    {
        skiptimer++;
        
        if (skiptimer == 1)
        {
            displayed_text = current_dialogue;
            text_complete = true;
        }
    }
    
    if (charactertalking)
    {
        if (dialoguetop)
            draw_sprite_ext(dialogueiconchoice, dialogueicon, camera_get_view_x(view_camera[0]) + 112, camera_get_view_y(view_camera[0]) + 93, 1, 1, 0, c_white, 1);
        else
            draw_sprite_ext(dialogueiconchoice, dialogueicon, camera_get_view_x(view_camera[0]) + 112, camera_get_view_y(view_camera[0]) + 401, 1, 1, 0, c_white, 1);
    }
    
    if (text_complete && quip)
    {
        draw_set_alpha(quipalpha);
        draw_set_font(fDeterminationSans_quip);
        draw_set_color(c_white);
        draw_set_halign(fa_left);
        draw_text(cam_x + (quipx + 47) + quipxoffset, cam_y + 418 + quipyoffset, quipstring);
        draw_sprite_ext(quipicon, quipindex, cam_x + quipx + quipxoffset, cam_y + 434 + quipyoffset, 0.5, 0.5, 0, c_white, quipalpha);
        quippercent += 0.2;
        var position1 = animcurve_channel_evaluate(quiplinear, quippercent);
        var delta_quipoffset = -50;
        quipxoffset = 50 + (delta_quipoffset * position1);
        var delta_alpha = 1;
        quipalpha = 0 + (delta_alpha * position1);
        draw_set_alpha(1);
    }
    else
    {
        quippercent = 0;
        quipxoffset = 50;
    }
}

if (d20trigger)
{
    d20timer++;
    
    if (d20timer == 45)
    {
        window_set_caption("");
        audio_play_sound(snd_closet_impact, 1, false, 0.5, false, 0.8);
        audio_play_sound(snd_deep_noise, 1, true, 0.6);
        obj_maximike_battle.sprite_index = spr_maximike_off;
        obj_maximike_foreground.image_index = 2;
        obj_maximike_battle.off = true;
        obj_maximike_battle.shake = true;
    }
    
    if (d20timer == 108)
    {
        talking = true;
        dialogue = 21;
        reset_dialogue_normal();
    }
}

if (d24trigger)
{
    d24timer++;
    
    if (d24timer == 0)
    {
        audio_play_sound(snd_bell, 1, false);
        obj_maximike_battle.flicker = true;
    }
    
    if (d24timer == 60)
    {
        talking = true;
        dialogue = 25;
        reset_dialogue_normal();
    }
}

if (d28trigger)
{
    d28timer++;
    
    if (d28timer == 0)
    {
        audio_play_sound(snd_grab, 1, false);
        obj_maximike_battle.eject = true;
        window_set_caption(get_lang_string("gml_Object_obj_sio_text_postbattle_Draw_73_81"));
    }
    
    if (d28timer == 30)
        obj_maximike_battle.pandown = true;
    
    if (d28switch)
    {
        talking = true;
        dialogue = 29;
        reset_dialogue_normal();
        d28switch = false;
    }
}

if (d51trigger)
{
    d51timer++;
    
    if (d51timer == 0)
    {
        instance_create_depth(340, 20, -900, obj_ch3_fakecredits);
        obj_mike_sio_aftermath.sprite_index = spr_mike_happy;
        obj_mike_sio_aftermath.image_speed = 1;
    }
    
    if (d51switch)
    {
        obj_susie_sio.sprite_index = sSusieWalkRight;
        talking = true;
        dialogue = endcase1end + 1;
        reset_dialogue_normal();
        d51switch = false;
    }
}

if (d53trigger)
{
    d53timer++;
    
    if (d53timer >= 0)
    {
        obj_susie_sio.image_speed = 1;
        obj_susie_sio.speed = 4;
        obj_susie_sio.y += 2;
        obj_susie_sio.y = clamp(obj_susie_sio.y, 0, 308);
    }
    
    if (d53timer == 0)
    {
        obj_mike_sio_aftermath.sprite_index = spr_mike_spin;
        obj_mike_sio_aftermath.image_index = 5;
        obj_tenna_sio_aftermath.sleep = true;
    }
    
    if (d53timer == 15)
    {
        obj_kris_sio.sprite_index = sKrisWalkDown;
        obj_kris_sio.image_speed = 1;
    }
    
    if (d53timer >= 23)
    {
        obj_kris_sio.y += 4;
        obj_kris_sio.y = clamp(obj_kris_sio.y, 0, 308);
    }
    
    if (obj_kris_sio.y == 308)
    {
        d53timerextra++;
        
        if (d53timerextra == 0)
        {
            obj_kris_sio.speed = 4;
            obj_kris_sio.sprite_index = sKrisWalkRight;
        }
        
        if (d53timerextra == 64)
        {
            obj_mike_sio_aftermath.sprite_index = spr_mike_spin;
            obj_mike_sio_aftermath.image_index = 6;
        }
        
        if (d53timerextra == 104)
        {
            obj_kris_sio.speed = 0;
            obj_kris_sio.image_speed = 0;
            obj_kris_sio.image_index = 0;
            talking = true;
            dialogue = endcase2end + 1;
            reset_dialogue_normal();
            d53trigger = false;
        }
    }
    
    if (d53timer > 30)
    {
        obj_ralsei_sio.sprite_index = sRalseiWalkRight;
        obj_ralsei_sio.image_speed = 1;
        obj_ralsei_sio.speed = 4;
    }
}

if (d55trigger)
{
    d55timer++;
    
    if (d55timer < 30)
    {
        obj_kris_sio.sprite_index = sKrisWalkUp;
        obj_kris_sio.image_speed = 0.5;
        obj_kris_sio.y -= 2;
    }
    else
    {
        obj_kris_sio.image_speed = 0;
        obj_kris_sio.image_index = 0;
        talking = true;
        dialogue = endcase3end + 1;
        reset_dialogue_normal();
        d55trigger = false;
    }
}

if (d64trigger)
{
    d64timer++;
    
    if (d64timer == 0)
    {
        obj_kris_sio.sprite_index = sKrisWalkRight;
        obj_kris_sio.image_speed = 0.5;
        obj_kris_sio.speed = 2;
    }
    
    draw_sprite_ext(sBlackScreen, 0, obj_mike_sio_aftermath.x, obj_mike_sio_aftermath.y, 2, 2, 0, c_white, d64timer / 60);
    
    if (d64timer == 90)
        room_goto(rm_ch3_pathout);
}

if (mikeshake)
{
    mikeshaketimer++;
    
    switch (mikeshaketimer)
    {
        case 0:
            obj_mike_sio_aftermath.x += 4;
            break;
        case 2:
            obj_mike_sio_aftermath.x -= 8;
            break;
        case 4:
            obj_mike_sio_aftermath.x += 7;
            break;
        case 6:
            obj_mike_sio_aftermath.x -= 6;
            break;
        case 8:
            obj_mike_sio_aftermath.x += 5;
            break;
        case 10:
            obj_mike_sio_aftermath.x -= 4;
            break;
        case 12:
            obj_mike_sio_aftermath.x += 3;
            break;
        case 14:
            obj_mike_sio_aftermath.x -= 2;
            break;
        case 16:
            obj_mike_sio_aftermath.x += 1;
            break;
    }
}
