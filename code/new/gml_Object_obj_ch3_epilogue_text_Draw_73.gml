var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
generaltimer++;

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
        case -1:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 26;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_0"), 25);
            typing_speed = 1;
            endcase2 = dialogue;
            obj_ralsei_e3.sprite_index = sRalseiWalkRight;
            break;
        case 1:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 26;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_1"), 25);
            typing_speed = 1;
            break;
        case 2:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 25;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_2"), 25);
            typing_speed = 1;
            obj_ralsei_e3.sprite_index = sRalseiWalkRight;
            break;
        case 3:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 6;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_3"), 25);
            typing_speed = 1;
            break;
        case 4:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 30;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_4"), 25);
            typing_speed = 1;
            break;
        case 5:
            quip = true;
            quipstring = translation_get_string("obj_ch3_epilogue_text_Draw_73_5");
            quipicon = sSusieDialogueSprite;
            quipindex = 20;
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 9;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_6"), 25);
            typing_speed = 1;
            break;
        case 6:
            quip = false;
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 1;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_7"), 25);
            typing_speed = 1;
            break;
        case 7:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 9;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_8"), 25);
            typing_speed = 1;
            endcase1 = dialogue;
            break;
        case 8:
            quip = true;
            quipstring = translation_get_string("obj_ch3_epilogue_text_Draw_73_9");
            quipicon = sSusieDialogueSprite;
            quipindex = 23;
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 17;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_10"), 25);
            typing_speed = 1;
            break;
        case 9:
            quip = false;
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 30;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_11"), 25);
            typing_speed = 1;
            break;
        case 10:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_12"), 25);
            typing_speed = 1;
            endcase3 = dialogue;
            break;
        case 11:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 3;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_13"), 25);
            typing_speed = 1;
            break;
        case 12:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_14"), 25);
            typing_speed = 1;
            endcase4 = dialogue;
            break;
        case 13:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = true;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_15"), 25);
            typing_speed = 1;
            obj_kreid_e3.sprite_index = spr_kreid_walkdown;
            break;
        case 14:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = true;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            dialogueicon = 5;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_16"), 25);
            typing_speed = 1;
            break;
        case 15:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = true;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            dialogueicon = 11;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_17"), 25);
            typing_speed = 1;
            break;
        case 16:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 26;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_18"), 25);
            typing_speed = 1;
            obj_kreid_e3.sprite_index = spr_kreid_peanuts;
            break;
        case 17:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = true;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            dialogueicon = 4;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_19"), 25);
            typing_speed = 1;
            break;
        case 18:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = true;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            dialogueicon = 12;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_20"), 25);
            typing_speed = 1;
            break;
        case 19:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = true;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            dialogueicon = 8;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_21"), 25);
            typing_speed = 1;
            break;
        case 20:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 21;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_22"), 25);
            typing_speed = 1;
            break;
        case 21:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = true;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            dialogueicon = 13;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_23"), 25);
            typing_speed = 1;
            break;
        case 22:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 20;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_24"), 25);
            typing_speed = 1;
            endcase5 = dialogue;
            break;
        case 23:
            quip = true;
            quipstring = translation_get_string("obj_ch3_epilogue_text_Draw_73_25");
            quipicon = sRalseiDialogueSprite;
            quipindex = 21;
            queentalk = false;
            foanetalk = false;
            lancertalk = true;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sLancerDialogueSprite;
            dialogueicon = 1;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_26"), 25);
            typing_speed = 1;
            break;
        case 24:
            quip = false;
            queentalk = false;
            foanetalk = false;
            lancertalk = true;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sLancerDialogueSprite;
            dialogueicon = 3;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_27"), 25);
            typing_speed = 1;
            endcase6 = dialogue;
            break;
        case 25:
            queentalk = false;
            foanetalk = false;
            lancertalk = true;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sLancerDialogueSprite;
            dialogueicon = 0;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_28"), 25);
            typing_speed = 1;
            obj_lancer_e3.image_index = 3;
            obj_lancer_e3.triggerright = true;
            break;
        case 26:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 33;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_29"), 25);
            typing_speed = 1;
            break;
        case 27:
            queentalk = false;
            foanetalk = false;
            lancertalk = true;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sLancerDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_30"), 25);
            typing_speed = 1;
            break;
        case 28:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 12;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_31"), 25);
            typing_speed = 1;
            break;
        case 29:
            queentalk = false;
            foanetalk = false;
            lancertalk = true;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sLancerDialogueSprite;
            dialogueicon = 3;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_32"), 25);
            typing_speed = 1;
            endcase7 = dialogue;
            break;
        case 30:
            quip = true;
            quipstring = translation_get_string("obj_ch3_epilogue_text_Draw_73_33");
            quipicon = sRalseiDialogueSprite;
            quipindex = 30;
            queentalk = true;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sQueenDialogueSprite;
            dialogueicon = 8;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_34"), 25);
            typing_speed = 1;
            break;
        case 31:
            quip = false;
            queentalk = true;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sQueenDialogueSprite;
            dialogueicon = 10;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_35"), 25);
            typing_speed = 1;
            endcase8 = dialogue;
            break;
        case 32:
            queentalk = true;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sQueenDialogueSprite;
            dialogueicon = 21;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_36"), 25);
            typing_speed = 1;
            break;
        case 33:
            queentalk = true;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sQueenDialogueSprite;
            dialogueicon = 8;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_37"), 25);
            typing_speed = 1;
            obj_queen_e3.image_index = 3;
            break;
        case 34:
            queentalk = true;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sQueenDialogueSprite;
            dialogueicon = 3;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_38"), 25);
            typing_speed = 1;
            
            if (text_complete)
                advance_pressed = true;
            
            break;
        case 35:
            queentalk = true;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sQueenDialogueSprite;
            dialogueicon = 7;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_39"), 25);
            typing_speed = 1;
            break;
        case 36:
            queentalk = true;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sQueenDialogueSprite;
            dialogueicon = 11;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_40"), 25);
            typing_speed = 1;
            obj_queen_e3.image_index = 0;
            endcase9 = dialogue;
            break;
        case 37:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 20;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_41"), 25);
            typing_speed = 1;
            break;
        case 38:
            queentalk = true;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sQueenDialogueSprite;
            dialogueicon = 24;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_42"), 25);
            typing_speed = 1;
            break;
        case 39:
            queentalk = true;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sQueenDialogueSprite;
            dialogueicon = 0;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_43"), 25);
            typing_speed = 1;
            break;
        case 40:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = true;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_44"), 25);
            typing_speed = 1;
            obj_kreid_e3.sprite_index = spr_kreid_peanutsspin;
            obj_kreid_e3.image_index = 1;
            break;
        case 41:
            queentalk = true;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sQueenDialogueSprite;
            dialogueicon = 8;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_45"), 25);
            typing_speed = 1;
            break;
        case 42:
            queentalk = true;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sQueenDialogueSprite;
            dialogueicon = 14;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_46"), 25);
            typing_speed = 1;
            break;
        case 43:
            quip = true;
            quipstring = translation_get_string("obj_ch3_epilogue_text_Draw_73_47");
            quipicon = sQueenDialogueSprite;
            quipindex = 12;
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = true;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            dialogueicon = 22;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_48"), 25);
            typing_speed = 1;
            endcase10 = dialogue;
            break;
        case 44:
            quip = false;
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 1;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_49"), 25);
            typing_speed = 1;
            break;
        case 45:
            quip = true;
            quipstring = translation_get_string("obj_ch3_epilogue_text_Draw_73_50");
            quipicon = sRalseiDialogueSprite;
            quipindex = 26;
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 20;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_51"), 25);
            typing_speed = 1;
            obj_susie_e3.sprite_index = sSusieWalkLeft;
            break;
        case 46:
            quip = false;
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 5;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_52"), 25);
            typing_speed = 1;
            obj_susie_e3.sprite_index = sSusieWalkUp;
            obj_mike_e3.sprite_index = spr_mike_spin_rollerblades;
            obj_mike_e3.image_index = 5;
            break;
        case 47:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 0;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_53"), 25);
            typing_speed = 1;
            break;
        case 48:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_54"), 25);
            typing_speed = 1;
            obj_mike_e3.image_index = 1;
            endcase11 = dialogue;
            break;
        case 49:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 4;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_55"), 25);
            typing_speed = 1;
            obj_ralsei_e3.sprite_index = sRalseiWalkLeft;
            obj_susie_e3.sprite_index = sSusieWalkLeft;
            obj_kris_e3.sprite_index = sKrisWalkLeft;
            obj_kreid_e3.image_index = 1;
            break;
        case 50:
            queentalk = true;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sQueenDialogueSprite;
            dialogueicon = 1;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_56"), 25);
            typing_speed = 1;
            break;
        case 51:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 9;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_57"), 25);
            typing_speed = 1;
            break;
        case 52:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 11;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_58"), 25);
            typing_speed = 1;
            break;
        case 53:
            queentalk = true;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sQueenDialogueSprite;
            dialogueicon = 21;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_59"), 25);
            typing_speed = 1;
            break;
        case 54:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 11;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_60"), 25);
            typing_speed = 1;
            break;
        case 55:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 1;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_61"), 25);
            typing_speed = 1;
            endcase12 = dialogue;
            obj_mike_e3.image_index = 7;
            break;
        case 56:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 8;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_62"), 25);
            typing_speed = 1;
            obj_mike_e3.image_index = 2;
            break;
        case 57:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 16;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_63"), 25);
            typing_speed = 1;
            mikewalkout = true;
            endcase13 = dialogue;
            
            if (mikewtimer == 140)
                advance_pressed = true;
            
            break;
        case 58:
            quip = true;
            quipstring = translation_get_string("obj_ch3_epilogue_text_Draw_73_64");
            quipicon = sQueenDialogueSprite;
            quipindex = 24;
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 22;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_65"), 25);
            typing_speed = 1;
            break;
        case 59:
            quip = false;
            queentalk = true;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sQueenDialogueSprite;
            dialogueicon = 9;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_66"), 25);
            typing_speed = 1;
            obj_lancer_e3.image_index = 1;
            obj_kreid_e3.image_index = 1;
            obj_susie_e3.sprite_index = sSusieWalkLeft;
            obj_ralsei_e3.sprite_index = sRalseiWalkLeft;
            obj_kris_e3.sprite_index = sKrisWalkLeft;
            break;
        case 60:
            queentalk = true;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sQueenDialogueSprite;
            dialogueicon = 6;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_67"), 25);
            typing_speed = 1;
            break;
        case 61:
            queentalk = true;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sQueenDialogueSprite;
            dialogueicon = 11;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_68"), 25);
            typing_speed = 1;
            break;
        case 62:
            queentalk = true;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sQueenDialogueSprite;
            dialogueicon = 10;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_69"), 25);
            typing_speed = 1;
            obj_queen_e3.image_index = 0;
            endcase14 = dialogue;
            break;
        case 63:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 14;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_70"), 25);
            typing_speed = 1;
            endcase15 = dialogue;
            break;
        case 64:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 26;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_71"), 25);
            typing_speed = 1;
            
            if (obj_susie_e3.image_index == 0)
            {
                obj_susie_e3.image_index = 1;
                audio_play_sound(snd_noise, 1, false, 0.6);
            }
            
            break;
        case 65:
            queentalk = false;
            foanetalk = false;
            lancertalk = true;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sLancerDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_72"), 25);
            typing_speed = 1;
            break;
        case 66:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 1;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_73"), 25);
            typing_speed = 1;
            obj_susie_e3.image_index = 2;
            endcase16 = dialogue;
            break;
        case 67:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 20;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_74"), 25);
            typing_speed = 1;
            dialoguetop = true;
            dialoguebottom = false;
            break;
        case 68:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 5;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_75"), 25);
            typing_speed = 1;
            break;
        case 69:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 10;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_76"), 25);
            typing_speed = 1;
            break;
        case 70:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 21;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_77"), 25);
            typing_speed = 1;
            obj_ralsei_e3.sprite_index = sRalseiWalkRight;
            endcase17 = dialogue;
            break;
        case 71:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 20;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_78"), 25);
            typing_speed = 1;
            endcase17 = dialogue;
            break;
        case 72:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = true;
            susietalk = false;
            ralseitalk = false;
            charactertalking = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_79"), 31);
            typing_speed = 1;
            dialoguetop = true;
            dialoguebottom = false;
            obj_susie_e3.image_index = 0;
            break;
        case 73:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = true;
            susietalk = false;
            ralseitalk = false;
            charactertalking = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_80"), 31);
            typing_speed = 1;
            endcase18 = dialogue;
            break;
        case 74:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 0;
            charactertalking = true;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_81"), 25);
            typing_speed = 1;
            break;
        case 75:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 10;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_82"), 25);
            typing_speed = 1;
            endcase1 = dialogue;
            obj_mike_castle_e3.image_index = 3;
            break;
        case 76:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 2;
            charactertalking = true;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_83"), 25);
            typing_speed = 1;
            obj_mike_castle_e3.image_index = 10;
            break;
        case 77:
            queentalk = false;
            foanetalk = true;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            charactertalking = false;
            dialogueicon = 2;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_84"), 31);
            typing_speed = 1;
            break;
        case 78:
            queentalk = false;
            foanetalk = true;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_85"), 31);
            typing_speed = 1;
            obj_foane_e3.sprite_index = spr_foane_down;
            break;
        case 79:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 2;
            charactertalking = true;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_86"), 25);
            typing_speed = 1;
            obj_mike_castle_e3.image_index = 6;
            break;
        case 80:
            queentalk = false;
            foanetalk = true;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            charactertalking = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_87"), 31);
            typing_speed = 1;
            foanes1 = dialogue;
            obj_foane_e3.sprite_index = spr_foane_up_anim;
            
            if (displayed_text >= format_text("This looks nice@ What is it forforforforforfor", 31))
            {
                var extradialogue = translation_get_string("obj_ch3_epilogue_text_Draw_73_88");
                draw_text_color(text_x + 1, text_y + 1, extradialogue, #320032, #320032, #320032, #320032, 1);
                draw_text_color(text_x, text_y, extradialogue, color6, color6, color6, color6, 1);
            }
            
            break;
        case 81:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 0;
            charactertalking = true;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_89"), 25);
            typing_speed = 1;
            obj_mike_castle_e3.image_index = 2;
            break;
        case 82:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 0;
            charactertalking = true;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_90"), 26);
            typing_speed = 1;
            break;
        case 83:
            queentalk = false;
            foanetalk = true;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            charactertalking = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_91"), 31);
            typing_speed = 1;
            obj_foane_e3.sprite_index = spr_foane_right;
            break;
        case 84:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 5;
            charactertalking = true;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_92"), 25);
            typing_speed = 1;
            obj_mike_castle_e3.image_index = 0;
            break;
        case 85:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 10;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_93"), 25);
            typing_speed = 1;
            obj_mike_castle_e3.image_index = 1;
            break;
        case 86:
            queentalk = false;
            foanetalk = true;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            charactertalking = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_94"), 25);
            typing_speed = 1;
            break;
        case 87:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 13;
            charactertalking = true;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_95"), 25);
            typing_speed = 1;
            obj_mike_castle_e3.image_index = 0;
            break;
        case 88:
            queentalk = false;
            foanetalk = true;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            charactertalking = false;
            dialogueicon = 2;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_96"), 31);
            typing_speed = 1;
            foanes2 = dialogue;
            obj_foane_e3.sprite_index = spr_foane_down;
            break;
        case 89:
            queentalk = false;
            foanetalk = true;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_97"), 31);
            typing_speed = 1;
            obj_mike_castle_e3.image_index = 1;
            break;
        case 90:
            queentalk = false;
            foanetalk = true;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_98"), 31);
            typing_speed = 1;
            break;
        case 91:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 0;
            charactertalking = true;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_99"), 25);
            typing_speed = 1;
            obj_mike_castle_e3.image_index = 0;
            break;
        case 92:
            queentalk = false;
            foanetalk = true;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            charactertalking = false;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_100"), 31);
            typing_speed = 1;
            obj_foane_e3.sprite_index = spr_foane_right;
            break;
        case 93:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 12;
            charactertalking = true;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_101"), 25);
            typing_speed = 1;
            obj_mike_castle_e3.image_index = 10;
            break;
        case 94:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 2;
            charactertalking = true;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_102"), 25);
            typing_speed = 1;
            obj_mike_castle_e3.image_index = 1;
            break;
        case 95:
            queentalk = false;
            foanetalk = true;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            charactertalking = false;
            dialogueicon = 2;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_103"), 25);
            typing_speed = 1;
            break;
        case 96:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 1;
            charactertalking = true;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_104"), 25);
            typing_speed = 1;
            obj_mike_castle_e3.sprite_index = spr_mike_land_alt;
            obj_mike_castle_e3.image_index = 4;
            obj_mike_castle_e3.image_speed = 0;
            
            if (mikejiggle)
            {
                obj_mike_castle_e3.jiggle = true;
                mikejiggle = false;
            }
            
            break;
        case 97:
            queentalk = false;
            foanetalk = true;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            charactertalking = false;
            dialogueicon = 2;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_105"), 25);
            typing_speed = 1;
            obj_foane_e3.sprite_index = spr_foane_down;
            break;
        case 98:
            queentalk = false;
            foanetalk = true;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            charactertalking = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_106"), 25);
            typing_speed = 1;
            break;
        case 99:
            queentalk = false;
            foanetalk = true;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_107"), 25);
            typing_speed = 1;
            obj_foane_e3.sprite_index = spr_foane_right;
            obj_mike_castle_e3.sprite_index = spr_mike_spin_rollerblades;
            obj_mike_castle_e3.image_index = 0;
            break;
        case 100:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 14;
            charactertalking = true;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_108"), 25);
            typing_speed = 1;
            break;
        case 101:
            queentalk = false;
            foanetalk = true;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            charactertalking = false;
            dialogueicon = 2;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_109"), 31);
            typing_speed = 1;
            break;
        case 102:
            queentalk = false;
            foanetalk = true;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_110"), 31);
            typing_speed = 1;
            obj_mike_castle_e3.image_index = 10;
            break;
        case 103:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 2;
            charactertalking = true;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_111"), 25);
            typing_speed = 1;
            break;
        case 104:
            queentalk = false;
            foanetalk = true;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            charactertalking = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_112"), 31);
            typing_speed = 1;
            break;
        case 105:
            queentalk = false;
            foanetalk = true;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_113"), 31);
            typing_speed = 1;
            foanes3 = dialogue;
            break;
        case 106:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 2;
            charactertalking = true;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_114"), 25);
            typing_speed = 1;
            obj_mike_castle_e3.image_index = 1;
            break;
        case 107:
            queentalk = false;
            foanetalk = true;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            charactertalking = false;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 15;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_115"), 31);
            typing_speed = 1;
            obj_foane_e3.sprite_index = spr_foane_up_anim;
            break;
        case 108:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            charactertalking = true;
            dialogueiconchoice = sMikeDialogueSprite;
            dialogueicon = 15;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_116"), 31);
            typing_speed = 1;
            endcase18 = dialogue;
            obj_mike_castle_e3.image_index = 6;
            break;
        case 109:
            queentalk = false;
            foanetalk = false;
            lancertalk = true;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sLancerDialogueSprite;
            dialogueicon = 4;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_117"), 25);
            typing_speed = 1;
            audio_sound_gain(mus_castletown, 0, 3000);
            dialoguebottom = false;
            dialoguetop = true;
            break;
        case 110:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 20;
            charactertalking = true;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_118"), 25);
            typing_speed = 1;
            obj_susie_e3_end.image_index = 1;
            break;
        case 111:
            queentalk = false;
            foanetalk = false;
            lancertalk = true;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sLancerDialogueSprite;
            dialogueicon = 1;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_119"), 25);
            typing_speed = 1;
            break;
        case 112:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 26;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_120"), 25);
            typing_speed = 1;
            break;
        case 113:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 23;
            charactertalking = true;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_121"), 25);
            typing_speed = 1;
            obj_susie_e3_end.image_index = 3;
            audio_stop_sound(mus_castletown);
            break;
        case 114:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 5;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_122"), 25);
            typing_speed = 1;
            obj_susie_e3_end.image_index = 1;
            obj_ralsei_e3_end.sprite_index = sRalseiWalkRight;
            break;
        case 115:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 19;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_123"), 25);
            typing_speed = 1;
            break;
        case 116:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = true;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            dialogueicon = 8;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_124"), 25);
            typing_speed = 1;
            endcase1 = dialogue;
            obj_susie_e3_end.image_index = 4;
            break;
        case 117:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = true;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            dialogueicon = 18;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_125"), 25);
            typing_speed = 1;
            break;
        case 118:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = true;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sKreidDialogueSprite;
            dialogueicon = 11;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_126"), 25);
            typing_speed = 1;
            endcase2 = dialogue;
            break;
        case 119:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = true;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            charactertalking = false;
            dialogueicon = 2;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_127"), 31);
            typing_speed = 1;
            endcase3 = dialogue;
            piss1 = dialogue;
            break;
        case 120:
            queentalk = false;
            foanetalk = false;
            lancertalk = true;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = false;
            dialogueiconchoice = sLancerDialogueSprite;
            dialogueicon = 1;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_128"), 25);
            typing_speed = 1;
            charactertalking = true;
            endcase4 = dialogue;
            obj_susie_e3_end.image_index = 1;
            obj_ralsei_e3_end.sprite_index = sRalseiWalkLeft;
            break;
        case 121:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            charactertalking = true;
            dialogueicon = 26;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_129"), 25);
            typing_speed = 1;
            obj_susie_e3_end.image_index = 6;
            obj_ralsei_e3_end.sprite_index = sRalseiWalkRight;
            obj_kris_e3_end.sprite_index = sKrisWalkLeft;
            break;
        case 122:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 17;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_130"), 25);
            typing_speed = 1;
            break;
        case 123:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 5;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_131"), 25);
            typing_speed = 1;
            break;
        case 124:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 10;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_132"), 25);
            typing_speed = 1;
            obj_susie_e3_end.image_index = 0;
            obj_susie_e3_end.sprite_index = sSusieWalkLeft;
            break;
        case 125:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_133"), 25);
            typing_speed = 1;
            obj_ralsei_e3_end.sprite_index = sRalseiWalkRightUpset;
            endcase5 = dialogue;
            break;
        case 126:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 37;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_134"), 25);
            typing_speed = 1;
            obj_susie_e3_end.sprite_index = sSusieWalkLeftUpset;
            obj_susie_e3_end.image_index = 0;
            break;
        case 127:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 12;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_135"), 25);
            typing_speed = 1;
            break;
        case 128:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 30;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_136"), 25);
            typing_speed = 1;
            obj_ralsei_e3_end.sprite_index = sRalseiWalkRight;
            break;
        case 129:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 38;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_137"), 27);
            typing_speed = 1;
            break;
        case 130:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = true;
            ralseitalk = false;
            dialogueiconchoice = sSusieDialogueSprite;
            dialogueicon = 3;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_138"), 25);
            typing_speed = 1;
            obj_susie_e3_end.sprite_index = sSusieWalkRight;
            endcase6 = dialogue;
            break;
        case 131:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            charactertalking = false;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_139"), 25);
            typing_speed = 1;
            break;
        case 132:
            queentalk = false;
            foanetalk = false;
            lancertalk = false;
            kreidtalk = false;
            tennatalk = false;
            miketalk = false;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            charactertalking = false;
            dialogueiconchoice = sRalseiDialogueSprite;
            dialogueicon = 2;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_140"), 25);
            typing_speed = 1;
            endcase7 = dialogue;
            break;
        case 133:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_141"), 25);
            dialogueicon = 18;
            typing_speed = 1;
            break;
        case 134:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_142"), 25);
            dialogueicon = 5;
            typing_speed = 1;
            obj_ralsei_e3_end.image_index = 2;
            break;
        case 135:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_143"), 25);
            dialogueicon = 1;
            typing_speed = 1;
            break;
        case 136:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_144"), 25);
            dialogueicon = 4;
            typing_speed = 1;
            break;
        case 137:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_145"), 25);
            dialogueicon = 39;
            typing_speed = 1;
            obj_ralsei_e3_end.image_index = 1;
            break;
        case 138:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_146"), 27);
            dialogueicon = 18;
            typing_speed = 1;
            break;
        case 139:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_147"), 25);
            dialogueicon = 11;
            typing_speed = 1;
            obj_ralsei_e3_end.image_index = 2;
            break;
        case 140:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_148"), 25);
            dialogueicon = 2;
            typing_speed = 1;
            break;
        case 141:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_149"), 25);
            dialogueicon = 38;
            typing_speed = 1;
            break;
        case 142:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_150"), 27);
            dialogueicon = 40;
            typing_speed = 1;
            break;
        case 143:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_151"), 25);
            dialogueicon = 40;
            typing_speed = 1;
            obj_ralsei_e3_end.image_index = 1;
            break;
        case 144:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_152"), 25);
            dialogueicon = 4;
            typing_speed = 1;
            break;
        case 145:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_153"), 25);
            dialogueicon = 26;
            typing_speed = 1;
            obj_ralsei_e3_end.image_index = 0;
            break;
        case 146:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_154"), 25);
            dialogueicon = 39;
            typing_speed = 1;
            break;
        case 147:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_155"), 25);
            dialogueicon = 41;
            typing_speed = 1;
            obj_ralsei_e3_end.image_index = 2;
            break;
        case 148:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_156"), 25);
            dialogueicon = 38;
            typing_speed = 1;
            break;
        case 149:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_157"), 25);
            dialogueicon = 27;
            typing_speed = 1;
            break;
        case 150:
            quip = false;
            charactertalking = true;
            texttalk = false;
            susietalk = false;
            ralseitalk = true;
            dialogueiconchoice = sRalseiDialogueSprite;
            current_dialogue = format_text(translation_get_string("obj_ch3_epilogue_text_Draw_73_158"), 25);
            dialogueicon = 26;
            typing_speed = 1;
            image_index = 8;
            endcase20 = dialogue;
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
                        {
                            audio_play_sound(snd_susie, 1, false);
                        }
                        else if (ralseitalk)
                        {
                            audio_play_sound(snd_ralsei, 1, false);
                        }
                        else if (texttalk)
                        {
                            audio_play_sound(snd_text, 1, false);
                        }
                        else if (tennatalk)
                        {
                            audio_play_sound(snd_tenna, 1, false);
                        }
                        else if (foanetalk)
                        {
                            audio_play_sound(snd_foane, 1, false);
                        }
                        else if (lancertalk)
                        {
                            audio_play_sound(snd_lancer, 1, false);
                        }
                        else if (queentalk)
                        {
                            randomize();
                            var randomoff = irandom_range(0, 7);
                            var randomqueenpitch = random_range(0.95, 1.05);
                            
                            if (!(randomoff == 0))
                                audio_play_sound(snd_queen, 1, false, 1, false, randomqueenpitch);
                        }
                        else if (kreidtalk)
                        {
                            audio_play_sound(snd_kreid, 1, false);
                        }
                        else if (miketalk)
                        {
                            audio_play_sound(snd_mike, 1, false, 0.6);
                        }
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
    
    if (dialogue == piss1)
    {
        var separator = translation_get_string("obj_ch3_epilogue_text_Draw_73_159");
        var text_parts = string_split(current_dialogue, separator);
        var gradient_len = string_length(separator);
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
                var remaining = string_copy(current_displayed, 1, gradient_len);
                var color;
                
                switch (i + 1)
                {
                    case 1:
                        color = 65535;
                        break;
                }
                
                draw_set_color(#4C4C00);
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
    
    if (dialogue == foanes1)
    {
        var separator = translation_get_string("obj_ch3_epilogue_text_Draw_73_160");
        var text_parts = string_split(current_dialogue, separator);
        var gradient_len = string_length(separator);
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
                var remaining = string_copy(current_displayed, 1, gradient_len);
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
                draw_text_color(x_offset, y_offset, remaining, color, color, color, color, 1);
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
        var separator = translation_get_string("obj_ch3_epilogue_text_Draw_73_161");
        var text_parts = string_split(current_dialogue, separator);
        var gradient_len = string_length(separator);
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
                var remaining = string_copy(current_displayed, 1, gradient_len);
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
                draw_text_color(x_offset, y_offset, remaining, color, color, color, color, 1);
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
        var separator = translation_get_string("obj_ch3_epilogue_text_Draw_73_162");
        var text_parts = string_split(current_dialogue, separator);
        var gradient_len = string_length(separator);
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
                var remaining = string_copy(current_displayed, 1, gradient_len);
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
                draw_text_color(x_offset, y_offset, remaining, color, color, color, color, 1);
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
    
    if ((advance_pressed && !blockprogress) || (skiptimer == 2 && !blockprogress))
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
                
                if (!(dialogue == 9))
                    dialogue += 1;
                else
                    dialogue = -1;
                
                reset_dialogue_normal();
            }
        }
        
        audio_sound_pitch(snd_foane, 1);
        quipalpha = 0;
        quippercent = 0;
        skiptimer = -1;
    }
    else if ((skip_pressed && !advance_pressed && !blockprogress) || (skiptimer == 1 && !blockprogress))
    {
        displayed_text = current_dialogue;
        text_complete = true;
        
        if (!(skiptimer == 1 && !blockprogress))
        {
            audio_stop_sound(snd_ralsei);
            audio_stop_sound(snd_susie);
            audio_stop_sound(snd_text);
            audio_stop_sound(snd_tenna);
            audio_stop_sound(snd_mike);
        }
    }
    
    if (keyboard_check(ord("C")) && !blockprogress)
        skiptext = true;
    
    if (keyboard_check_released(ord("C")) || blockprogress)
    {
        skiptext = false;
        skiptimer = 0;
    }
    
    if (skiptext && !blockprogress)
    {
        skiptimer++;
        
        if (skiptimer == 1)
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

if (triggerout)
{
    triggertimer++;
    draw_sprite_ext(sBlackScreen, 0, 320, 240, 2, 2, 0, c_white, triggertimer / 60);
    
    if (triggertimer == 100)
        room_goto(rm_ch3_fountain);
}
