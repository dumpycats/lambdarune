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
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_0"), 31);
            typing_speed = 1;
            break;
        case 2:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_1"), 31);
            typing_speed = 1;
            break;
        case 3:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_2"), 31);
            typing_speed = 1;
            break;
        case 4:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_3"), 31);
            typing_speed = 1;
            break;
        case 5:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_4"), 31);
            typing_speed = 1;
            break;
        case 6:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_5"), 31);
            typing_speed = 1;
            endcase1 = dialogue;
            break;
        case 7:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_6"), 31);
            typing_speed = 1;
            break;
        case 8:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_7"), 31);
            typing_speed = 1;
            break;
        case 9:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_8"), 31);
            typing_speed = 1;
            break;
        case 10:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_9"), 31);
            typing_speed = 1;
            endcase3 = dialogue;
            break;
        case 11:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_10"), 31);
            typing_speed = 1;
            endcase15 = dialogue;
            break;
        case 12:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_11"), 31);
            typing_speed = 1;
            break;
        case 13:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_12"), 31);
            typing_speed = 1;
            break;
        case 14:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_13"), 31);
            typing_speed = 1;
            foanes1 = dialogue;
            
            if (displayed_text >= format_text("Only I can pull them, and only I can break themthemthemthemthemthem", 31))
            {
                var extradialogue = get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_14");
                draw_text_color(text_x + 1, text_y + 1, extradialogue, #320032, #320032, #320032, #320032, 1);
                draw_text_color(text_x, text_y, extradialogue, c_white, c_white, color6, color6, 1);
            }
            
            break;
        case 15:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_15"), 31);
            typing_speed = 1;
            break;
        case 16:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_16"), 31);
            typing_speed = 1;
            break;
        case 17:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_17"), 31);
            typing_speed = 1;
            endcase2 = dialogue;
            
            if (text_complete)
                advance_pressed = true;
            
            break;
        case 18:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_18"), 31);
            typing_speed = 1;
            break;
        case 19:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_19"), 31);
            typing_speed = 1;
            endcase4 = dialogue;
            foanes2 = dialogue;
            
            if (displayed_text >= format_text("My body's... giving upupupupupup?", 31))
            {
                var extradialogue = get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_20");
                draw_text_color(text_x + 1, text_y + 1, extradialogue, #320032, #320032, #320032, #320032, 1);
                draw_text_color(text_x, text_y, extradialogue, c_white, c_white, color6, color6, 1);
            }
            
            break;
        case 20:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_21"), 31);
            typing_speed = 1;
            break;
        case 21:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_22"), 31);
            typing_speed = 1;
            break;
        case 22:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_23"), 31);
            typing_speed = 1;
            endcase15 = dialogue;
            break;
        case 23:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_24"), 31);
            typing_speed = 1;
            d23timer++;
            
            if (d23timer == 0)
            {
                audio_sound_gain(mus_broadcast_error, 0, 0);
                audio_play_sound(mus_broadcast_error, 1, true, 0.5, false, 0.9);
            }
            
            if (d23timer == 1)
                audio_sound_gain(mus_broadcast_error, 1, 3000);
            
            break;
        case 24:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_25"), 31);
            typing_speed = 1;
            break;
        case 25:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_26"), 31);
            typing_speed = 1;
            foanes3 = dialogue;
            
            if (displayed_text >= format_text("Were any of them... truetruetruetruetruetrue?", 31))
            {
                var extradialogue = get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_27");
                draw_text_color(text_x + 1, text_y + 1, extradialogue, #320032, #320032, #320032, #320032, 1);
                draw_text_color(text_x, text_y, extradialogue, c_white, c_white, color6, color6, 1);
            }
            
            break;
        case 26:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_28"), 31);
            typing_speed = 1;
            break;
        case 27:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_29"), 31);
            typing_speed = 1;
            break;
        case 28:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_30"), 31);
            typing_speed = 1;
            endcase6 = dialogue;
            break;
        case 29:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_31"), 31);
            typing_speed = 1;
            obj_foane_ex_aftermath.image_index = 1;
            break;
        case 30:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_32"), 31);
            typing_speed = 1;
            break;
        case 31:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_33"), 31);
            typing_speed = 1;
            obj_foane_ex_aftermath.image_index = 0;
            break;
        case 32:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_34"), 31);
            obj_foane_ex_aftermath.image_index = 3;
            typing_speed = 1;
            break;
        case 33:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_35"), 31);
            typing_speed = 1;
            obj_foane_ex_aftermath.image_index = 2;
            break;
        case 34:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_36"), 31);
            typing_speed = 1;
            break;
        case 35:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_37"), 31);
            typing_speed = 1;
            obj_foane_ex_aftermath.image_index = 0;
            break;
        case 36:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_38"), 31);
            typing_speed = 1;
            break;
        case 37:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_39"), 31);
            typing_speed = 1;
            obj_foane_ex_aftermath.image_index = 2;
            break;
        case 38:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_40"), 31);
            typing_speed = 1;
            break;
        case 39:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_41"), 31);
            typing_speed = 1;
            foanes4 = dialogue;
            break;
        case 40:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_42"), 31);
            typing_speed = 1;
            break;
        case 41:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_43"), 31);
            typing_speed = 1;
            endcase8 = dialogue;
            break;
        case 42:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_44"), 31);
            typing_speed = 1;
            obj_foane_ex_aftermath.image_index = 1;
            break;
        case 43:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_45"), 31);
            typing_speed = 1;
            break;
        case 44:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_46"), 31);
            typing_speed = 1;
            break;
        case 45:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_47"), 31);
            typing_speed = 1;
            break;
        case 46:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_48"), 31);
            typing_speed = 1;
            obj_foane_ex_aftermath.image_index = 2;
            break;
        case 47:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_49"), 31);
            typing_speed = 1;
            break;
        case 48:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_50"), 31);
            typing_speed = 1;
            endcase8 = dialogue;
            foanes4 = dialogue;
            break;
        case 49:
            foanetalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_51"), 31);
            typing_speed = 1;
            endcase9 = dialogue;
            break;
        case 50:
            foanetalk = false;
            texttalk = true;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            
            if (!instance_exists(obj_foane_attackcheck))
                current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_52"), 31);
            else
                current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_53"), 31);
            
            typing_speed = 1;
            break;
        case 51:
            foanetalk = false;
            texttalk = true;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_54"), 31);
            typing_speed = 1;
            break;
        case 52:
            foanetalk = true;
            texttalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_55"), 31);
            typing_speed = 1;
            endcase10 = dialogue;
            obj_foane_ex_aftermath.image_index = 0;
            d52timer++;
            
            if (d52timer == 0)
                audio_sound_gain(mus_broadcast_error, 0, 1500);
            
            break;
        case 53:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_56"), 25);
            dialogueicon = 27;
            typing_speed = 1;
            obj_susie_sof_end.sprite_index = sSusieWalkDownUpset;
            break;
        case 54:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_57"), 25);
            dialogueicon = 4;
            typing_speed = 1;
            break;
        case 55:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_58"), 25);
            dialogueicon = 4;
            typing_speed = 1;
            obj_kris_sof_end.sprite_index = sKrisWalkLeft;
            break;
        case 56:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_59"), 25);
            dialogueicon = 37;
            typing_speed = 1;
            break;
        case 57:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_60"), 25);
            dialogueicon = 0;
            typing_speed = 1;
            obj_susie_sof_end.sprite_index = sSusieWalkRightUpset;
            endcase11 = dialogue;
            break;
        case 58:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_61"), 25);
            dialogueicon = 26;
            typing_speed = 1;
            obj_ralsei_sof_end.sprite_index = sRalseiWalkRight;
            
            if (text_complete)
                advance_pressed = true;
            
            break;
        case 59:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_62"), 25);
            dialogueicon = 19;
            typing_speed = 1;
            obj_ralsei_sof_end.sprite_index = sRalseiWalkRightUpset;
            d59trigger = true;
            
            if (!text_complete)
                blockprogress = true;
            else
                blockprogress = false;
            
            break;
        case 60:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_63"), 25);
            dialogueicon = 4;
            typing_speed = 1;
            break;
        case 61:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_64"), 25);
            dialogueicon = 35;
            typing_speed = 1;
            break;
        case 62:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_65"), 25);
            dialogueicon = 13;
            typing_speed = 1;
            obj_susie_sof_end.sprite_index = sSusieWalkDownUpset;
            break;
        case 63:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_66"), 25);
            dialogueicon = 30;
            typing_speed = 1;
            obj_susie_sof_end.sprite_index = sSusieWalkUp;
            endcase12 = dialogue;
            break;
        case 64:
            quip = false;
            charactertalking = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_67"), 31);
            dialogueicon = 0;
            typing_speed = 1;
            obj_ralsei_sof_end.sprite_index = sRalseiWalkUp;
            break;
        case 65:
            quip = false;
            charactertalking = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_68"), 31);
            dialogueicon = 0;
            typing_speed = 1;
            break;
        case 66:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            current_dialogue = format_text(get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_69"), 25);
            dialogueicon = 41;
            typing_speed = 1;
            endcase13 = dialogue;
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
                    
                    if (next_char == "," || next_char == ":" || next_char == ".")
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
                        else if (foanetalk)
                            audio_play_sound(snd_foane, 1, false);
                        else if (lancertalk)
                            audio_play_sound(snd_lancer, 1, false);
                        else if (queentalk)
                            audio_play_sound(snd_queen, 1, false);
                        else if (kreidtalk)
                            audio_play_sound(snd_kreid, 1, false);
                        else if (miketalk)
                            audio_play_sound(snd_mike, 1, false, 0.6);
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
    
    if (dialogue == foanes1)
    {
        var text_parts = string_split(current_dialogue, get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_70"));
        var x_offset = text_x;
        var y_offset = text_y;
        var current_displayed = displayed_text;
        
        for (var i = 0; i < array_length(text_parts); i++)
        {
            var part = text_parts[i];
            
            if (string_length(current_displayed) < string_length(part))
                part = string_copy(part, 1, string_length(current_displayed));
            
            var lines = string_split(part, "\n");
            
            for (var j = 0; j < array_length(lines); j++)
            {
                var line = lines[j];
                draw_set_color(c_white);
                x_offset += string_width(line);
                
                if (j < (array_length(lines) - 1))
                {
                    x_offset = text_x;
                    y_offset += string_height(line);
                }
            }
            
            current_displayed = string_delete(current_displayed, 1, string_length(part));
            
            if (i < (array_length(text_parts) - 1) && string_length(current_displayed) > 0)
            {
                var remaining = string_copy(current_displayed, 1, 4);
                var color;
                
                switch (i + 1)
                {
                    case 1:
                        color = color1;
                        audio_sound_pitch(snd_foane, 1);
                        break;
                    case 2:
                        color = color1;
                        audio_sound_pitch(snd_foane, 1);
                        break;
                    case 3:
                        color = color2;
                        audio_sound_pitch(snd_foane, 0.995);
                        break;
                    case 4:
                        color = color3;
                        audio_sound_pitch(snd_foane, 0.99);
                        break;
                    case 5:
                        color = color4;
                        audio_sound_pitch(snd_foane, 0.985);
                        break;
                    case 6:
                        color = color5;
                        audio_sound_pitch(snd_foane, 0.98);
                        break;
                    case 7:
                        color = color6;
                        audio_sound_pitch(snd_foane, 0.975);
                        break;
                }
                
                draw_set_color(#320032);
                draw_text(x_offset + 1, y_offset + 1, remaining);
                draw_set_color(color);
                draw_text_color(x_offset, y_offset, remaining, c_white, c_white, color, color, 1);
                x_offset += string_width(remaining);
                
                if (string_pos("\n", remaining) > 0)
                {
                    x_offset = text_x;
                    y_offset += string_height(remaining);
                }
                
                current_displayed = string_delete(current_displayed, 1, string_length(remaining));
            }
        }
    }
    
    if (dialogue == foanes2)
    {
        var text_parts = string_split(current_dialogue, get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_71"));
        var x_offset = text_x;
        var y_offset = text_y;
        var current_displayed = displayed_text;
        
        for (var i = 0; i < array_length(text_parts); i++)
        {
            var part = text_parts[i];
            
            if (string_length(current_displayed) < string_length(part))
                part = string_copy(part, 1, string_length(current_displayed));
            
            var lines = string_split(part, "\n");
            
            for (var j = 0; j < array_length(lines); j++)
            {
                var line = lines[j];
                draw_set_color(c_white);
                x_offset += string_width(line);
                
                if (j < (array_length(lines) - 1))
                {
                    x_offset = text_x;
                    y_offset += string_height(line);
                }
            }
            
            current_displayed = string_delete(current_displayed, 1, string_length(part));
            
            if (i < (array_length(text_parts) - 1) && string_length(current_displayed) > 0)
            {
                var remaining = string_copy(current_displayed, 1, 2);
                var color;
                
                switch (i + 1)
                {
                    case 1:
                        color = color1;
                        audio_sound_pitch(snd_foane, 1);
                        break;
                    case 2:
                        color = color2;
                        audio_sound_pitch(snd_foane, 0.995);
                        break;
                    case 3:
                        color = color3;
                        audio_sound_pitch(snd_foane, 0.99);
                        break;
                    case 4:
                        color = color4;
                        audio_sound_pitch(snd_foane, 0.985);
                        break;
                    case 5:
                        color = color5;
                        audio_sound_pitch(snd_foane, 0.98);
                        break;
                    case 6:
                        color = color6;
                        audio_sound_pitch(snd_foane, 0.975);
                        break;
                }
                
                draw_set_color(#320032);
                draw_text(x_offset + 1, y_offset + 1, remaining);
                draw_set_color(color);
                draw_text_color(x_offset, y_offset, remaining, c_white, c_white, color, color, 1);
                x_offset += string_width(remaining);
                
                if (string_pos("\n", remaining) > 0)
                {
                    x_offset = text_x;
                    y_offset += string_height(remaining);
                }
                
                current_displayed = string_delete(current_displayed, 1, string_length(remaining));
            }
        }
    }
    
    if (dialogue == foanes3)
    {
        var text_parts = string_split(current_dialogue, get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_72"));
        var x_offset = text_x;
        var y_offset = text_y;
        var current_displayed = displayed_text;
        
        for (var i = 0; i < array_length(text_parts); i++)
        {
            var part = text_parts[i];
            
            if (string_length(current_displayed) < string_length(part))
                part = string_copy(part, 1, string_length(current_displayed));
            
            var lines = string_split(part, "\n");
            
            for (var j = 0; j < array_length(lines); j++)
            {
                var line = lines[j];
                draw_set_color(c_white);
                x_offset += string_width(line);
                
                if (j < (array_length(lines) - 1))
                {
                    x_offset = text_x;
                    y_offset += string_height(line);
                }
            }
            
            current_displayed = string_delete(current_displayed, 1, string_length(part));
            
            if (i < (array_length(text_parts) - 1) && string_length(current_displayed) > 0)
            {
                var remaining = string_copy(current_displayed, 1, 4);
                var color;
                
                switch (i + 1)
                {
                    case 1:
                        color = color1;
                        audio_sound_pitch(snd_foane, 1);
                        break;
                    case 2:
                        color = color2;
                        audio_sound_pitch(snd_foane, 0.995);
                        break;
                    case 3:
                        color = color3;
                        audio_sound_pitch(snd_foane, 0.99);
                        break;
                    case 4:
                        color = color4;
                        audio_sound_pitch(snd_foane, 0.985);
                        break;
                    case 5:
                        color = color5;
                        audio_sound_pitch(snd_foane, 0.98);
                        break;
                    case 6:
                        color = color6;
                        audio_sound_pitch(snd_foane, 0.975);
                        break;
                }
                
                draw_set_color(#320032);
                draw_text(x_offset + 1, y_offset + 1, remaining);
                draw_set_color(color);
                draw_text_color(x_offset, y_offset, remaining, c_white, c_white, color, color, 1);
                x_offset += string_width(remaining);
                
                if (string_pos("\n", remaining) > 0)
                {
                    x_offset = text_x;
                    y_offset += string_height(remaining);
                }
                
                current_displayed = string_delete(current_displayed, 1, string_length(remaining));
            }
        }
    }
    
    if (dialogue == foanes4)
    {
        var text_parts = string_split(current_dialogue, get_lang_string("gml_Object_obj_ch3_foaneend_text_Draw_73_73"));
        var x_offset = text_x;
        var y_offset = text_y;
        var current_displayed = displayed_text;
        
        for (var i = 0; i < array_length(text_parts); i++)
        {
            var part = text_parts[i];
            
            if (string_length(current_displayed) < string_length(part))
                part = string_copy(part, 1, string_length(current_displayed));
            
            var lines = string_split(part, "\n");
            
            for (var j = 0; j < array_length(lines); j++)
            {
                var line = lines[j];
                draw_set_color(c_white);
                x_offset += string_width(line);
                
                if (j < (array_length(lines) - 1))
                {
                    x_offset = text_x;
                    y_offset += string_height(line);
                }
            }
            
            current_displayed = string_delete(current_displayed, 1, string_length(part));
            
            if (i < (array_length(text_parts) - 1) && string_length(current_displayed) > 0)
            {
                var remaining = string_copy(current_displayed, 1, 4);
                var color;
                
                switch (i + 1)
                {
                    case 1:
                        color = color1;
                        audio_sound_pitch(snd_foane, 1);
                        break;
                    case 2:
                        color = color2;
                        audio_sound_pitch(snd_foane, 0.995);
                        break;
                    case 3:
                        color = color3;
                        audio_sound_pitch(snd_foane, 0.99);
                        break;
                    case 4:
                        color = color4;
                        audio_sound_pitch(snd_foane, 0.985);
                        break;
                    case 5:
                        color = color5;
                        audio_sound_pitch(snd_foane, 0.98);
                        break;
                    case 6:
                        color = color6;
                        audio_sound_pitch(snd_foane, 0.975);
                        break;
                }
                
                draw_set_color(#320032);
                draw_text(x_offset + 1, y_offset + 1, remaining);
                draw_set_color(color);
                draw_text_color(x_offset, y_offset, remaining, c_white, c_white, color, color, 1);
                x_offset += string_width(remaining);
                
                if (string_pos("\n", remaining) > 0)
                {
                    x_offset = text_x;
                    y_offset += string_height(remaining);
                }
                
                current_displayed = string_delete(current_displayed, 1, string_length(remaining));
            }
        }
    }
    
    var endcase = [endcase1, endcase2, endcase3, endcase4, endcase5, endcase6, endcase7, endcase8, endcase9, endcase10, endcase11, endcase12, endcase13, endcase14, endcase15, endcase16, endcase17, endcase18, endcase19, endcase20];
    
    if ((advance_pressed && !blockprogress) || skiptimer == 2)
    {
        if (text_complete)
        {
            if (array_contains(endcase, dialogue))
            {
                talking = false;
                
                if (dialogue == endcase1)
                    e1trigger = true;
                
                if (dialogue == endcase2)
                    e2trigger = true;
                
                if (dialogue == endcase3)
                    e3trigger = true;
                
                if (dialogue == endcase4)
                    e4trigger = true;
                
                if (dialogue == endcase5)
                    e5trigger = true;
                
                if (dialogue == endcase6)
                    e6trigger = true;
                
                if (dialogue == endcase7)
                    e7trigger = true;
                
                if (dialogue == endcase8)
                    e8trigger = true;
                
                if (dialogue == endcase9)
                    e9trigger = true;
                
                if (dialogue == endcase10)
                    e10trigger = true;
                
                if (dialogue == endcase11)
                    e11trigger = true;
                
                if (dialogue == endcase12)
                    e12trigger = true;
                
                if (dialogue == endcase13)
                    e13trigger = true;
                
                if (dialogue == endcase14)
                    e14trigger = true;
                
                if (dialogue == endcase15)
                    e15trigger = true;
                
                if (dialogue == endcase16)
                    e16trigger = true;
                
                if (dialogue == endcase17)
                    e17trigger = true;
                
                if (dialogue == endcase18)
                    e18trigger = true;
                
                if (dialogue == endcase19)
                    e19trigger = true;
                
                if (dialogue == endcase20)
                    e20trigger = true;
            }
            else
            {
                quipalpha = 0;
                quippercent = 0;
                dialogue += 1;
                reset_dialogue_normal();
            }
        }
        
        audio_sound_pitch(snd_foane, 1);
        quipalpha = 0;
        quippercent = 0;
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
