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
            current_dialogue = format_text("A chocolate cake@ For sharing.", 25);
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
            current_dialogue = format_text("Well, this is my room.", 25);
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
            current_dialogue = format_text("It's not much, but I hope you like it!", 25);
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
            current_dialogue = format_text("Damn, this room is BIG@ Are you holding out on us?", 25);
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
            current_dialogue = format_text("What? No! I've just always stayed up here, and...", 25);
            typing_speed = 1;
            break;
        case 5:
            quip = true;
            quipstring = "(... Very empty for a bedroom\nthough.)";
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
            current_dialogue = format_text("Relax{ I'm just messing with you@ It looks nice.", 25);
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
            current_dialogue = format_text("My room was really dusty, and the walls were all scratched up...", 25);
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
            current_dialogue = format_text("But enough about that@ We have more important matters to attend to.", 25);
            typing_speed = 1;
            endcase1 = dialogue;
            break;
        case 8:
            quip = true;
            quipstring = "(Isn't it day right now??)";
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
            current_dialogue = format_text("Movie night!", 25);
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
            current_dialogue = format_text("Wait, is that...", 25);
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
            current_dialogue = format_text("...Okay, fine@ I'll leave some crumbs for you guys.", 25);
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
            current_dialogue = format_text("You've made so many friends from our adventures, Kris.", 25);
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
            current_dialogue = format_text("Because of that, we have plenty of guests now!", 25);
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
            current_dialogue = format_text("...", 25);
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
            current_dialogue = format_text("Y'know, I was expecting a dump, but this isn't half bad.", 25);
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
            current_dialogue = format_text("Could be improved with some ominous curtains and gun racks.", 25);
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
            current_dialogue = format_text("How about your room} I hope you liked it.", 25);
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
            current_dialogue = format_text("It's acceptable.", 25);
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
            current_dialogue = format_text("I decked it out with tons of badass and dangerous stuff@", 25);
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
            current_dialogue = format_text("Unfortunately, it's already full of holes.", 25);
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
            current_dialogue = format_text("Oh no, did Lancer get to it} I'll remind him to use the doors.", 25);
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
            current_dialogue = format_text("Nah@ Me and my crew had an awesome gang war in there.", 25);
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
            current_dialogue = format_text("Speaking of Lancer, shouldn't he be here too?", 25);
            typing_speed = 1;
            endcase5 = dialogue;
            break;
        case 23:
            quip = true;
            quipstring = "(Lancer...!)";
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
            current_dialogue = format_text("Ho ho ho!!{ I finally found the right room!", 25);
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
            current_dialogue = format_text("Don't worry about the hole, my bespectacled amigo@ It'll grow back!", 25);
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
            current_dialogue = format_text("My sniffer is sniffing a delicious smell@ A sweet and smelly smell.", 25);
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
            current_dialogue = format_text("That's the cake@ Want some?", 25);
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
            current_dialogue = format_text("No thanks@ Girldad says I can only eat that on my cake day!", 25);
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
            current_dialogue = format_text("Your... what?", 25);
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
            current_dialogue = format_text("I have no idea, but it sounds delicious!", 25);
            typing_speed = 1;
            endcase7 = dialogue;
            break;
        case 30:
            quip = true;
            quipstring = "(You too?)";
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
            current_dialogue = format_text("Phew That Digging Took Forever", 25);
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
            current_dialogue = format_text("I Was Lost Until My Clever Spawn Found Your Castle", 25);
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
            current_dialogue = format_text("This Castle Really Needs A Map LMAO", 25);
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
            current_dialogue = format_text("BTW Kris If Your Bed Is In A Sinkhole It", 25);
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
            current_dialogue = format_text("...", 25);
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
            current_dialogue = format_text("It Was Already Like That When I Tunneled Through OK", 25);
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
            current_dialogue = format_text("Anyway I Brought The Movies And Stuff", 25);
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
            current_dialogue = format_text("Didn't know you liked movies this much.", 25);
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
            current_dialogue = format_text("Oh I Never Watched These LOL", 25);
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
            current_dialogue = format_text("I Snatched These A While Ago From A Bunch Of Pirates", 25);
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
            current_dialogue = format_text("Are those DVDs... safe?", 25);
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
            current_dialogue = format_text("Oh Yes Totally 100% Nothing Safer", 25);
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
            current_dialogue = format_text("But If You Find A Wooden Horse In That Box You Should Probably Run", 25);
            typing_speed = 1;
            break;
        case 43:
            quip = true;
            quipstring = "What";
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
            current_dialogue = format_text("What?", 25);
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
            current_dialogue = format_text("Somebody order a screeeeeeen!?", 25);
            typing_speed = 1;
            break;
        case 45:
            quip = true;
            quipstring = "I'll give the TV to you later...";
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
            current_dialogue = format_text("You get the biggest room AND a huge TV??", 25);
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
            current_dialogue = format_text("Sorry for the delay, I had to skim the manual.", 25);
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
            current_dialogue = format_text("It's as good as new@ Any channels you want, this beauty's got it!", 25);
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
            current_dialogue = format_text("...", 25);
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
            current_dialogue = format_text("What@ Is@ That@", 25);
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
            current_dialogue = format_text("Just Some Movies I Stole", 25);
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
            current_dialogue = format_text("Torrented films... on MY screen??", 25);
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
            current_dialogue = format_text("You'd defile my beauties with that FILTH!?", 25);
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
            current_dialogue = format_text("Yea", 25);
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
            current_dialogue = format_text("Unbelievable... UNBELIEVABLE!!!", 25);
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
            current_dialogue = format_text("Dude... it's just some movies.", 25);
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
            current_dialogue = format_text("...Enjoy your new TV...", 25);
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
            current_dialogue = format_text("It's got a 12 month warranty... call us any time...", 25);
            typing_speed = 1;
            mikewalkout = true;
            endcase13 = dialogue;
            
            if (mikewtimer == 140)
                advance_pressed = true;
            
            break;
        case 58:
            quip = true;
            quipstring = "What A Geek LMAO";
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
            current_dialogue = format_text("@@.", 25);
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
            current_dialogue = format_text("He'll Get Over It In Like 2 Seconds Anyway My Work Here Is Done", 25);
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
            current_dialogue = format_text("As Much As I Like To Watch Stolen Movies On Voicechat...", 25);
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
            current_dialogue = format_text("I Am Super Super Busy With Queenly Matters (Getting Drunk)", 25);
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
            current_dialogue = format_text("Toodles", 25);
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
            current_dialogue = format_text("Damn, she has... like EVERY sequel to ICE-E The Movie in here.", 25);
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
            current_dialogue = format_text("\"The Butterfly and The Dragon\"... Sounds metal.", 25);
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
            current_dialogue = format_text("Are there lots and lots of explosions!?", 25);
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
            current_dialogue = format_text("I dunno. Never watched it.", 25);
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
            current_dialogue = format_text("Won't you guys get tired if you keep standing like that?", 25);
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
            current_dialogue = format_text("Well, that depends on the type of Darkner...", 25);
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
            current_dialogue = format_text("Lucky@ It's a pain having to stand all day in school.", 25);
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
            current_dialogue = format_text("Y-you don't have chairs for class?", 25);
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
            current_dialogue = format_text("We lost chair privileges after I threw one at my teacher@ Accidentally.", 25);
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
            current_dialogue = format_text("(With nothing better to do,)", 31);
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
            current_dialogue = format_text("(You decided to close your eyes and think about Castle Town...)", 31);
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
            current_dialogue = format_text("And... done{ It looks perfect!", 25);
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
            current_dialogue = format_text("Thanks for the help, you three!", 25);
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
            current_dialogue = format_text("Sis} What are you doing here} I thought you would be with Kris.", 25);
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
            current_dialogue = format_text("It's not my style@ Kris and their friends will do fine without me. ", 31);
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
            current_dialogue = format_text("...besides, that mad clown and heterochromatic swindler would drive me crazy all over again.", 31);
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
            current_dialogue = format_text("I see...", 25);
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
            current_dialogue = format_text("This looks nice@ What is it forforforforforfor?", 31);
            typing_speed = 1;
            foanes1 = dialogue;
            obj_foane_e3.sprite_index = spr_foane_up_anim;
            
            if (displayed_text >= format_text("This looks nice@ What is it forforforforforfor", 31))
            {
                var extradialogue = "\n                    ?";
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
            current_dialogue = format_text("I noticed this town's lack of televised entertainment.", 25);
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
            current_dialogue = format_text("This shop will aid the heroes AND serve as a studio for all my ideas!", 26);
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
            current_dialogue = format_text("Still living in the spotlight?", 31);
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
            current_dialogue = format_text("It's what I'm good at!", 25);
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
            current_dialogue = format_text("...It's what you're good at, too.", 25);
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
            current_dialogue = format_text("...", 25);
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
            current_dialogue = format_text("I'd love to have your help around here. Beats the mad clowns, right?", 25);
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
            current_dialogue = format_text("I suppose it doesdoesdoesdoesdoesdoes", 31);
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
            current_dialogue = format_text("I... really shouldn't though.", 31);
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
            current_dialogue = format_text("I failed as a star, and failed to accomplish anything else@ I'm out of dreams to pursue.", 31);
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
            current_dialogue = format_text("It's never too late to find new ones!", 25);
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
            current_dialogue = format_text("Kris says cheesy things like that too@ I can see where they get it from...", 31);
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
            current_dialogue = format_text("I'm sorry for leaving you behind, sis@ I won't ever do it again.", 25);
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
            current_dialogue = format_text("Please... stick around and help me?", 25);
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
            current_dialogue = format_text("...Okay.", 25);
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
            current_dialogue = format_text("HELL YEAH{ THE BEST DUO SINCE 1997 IS BACK!", 25);
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
            current_dialogue = format_text("Don't push it.", 25);
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
            current_dialogue = format_text("...", 25);
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
            current_dialogue = format_text("Mike?", 25);
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
            current_dialogue = format_text("What's up?", 25);
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
            current_dialogue = format_text("While I was... connected to the resonance, I heard her voice.", 31);
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
            current_dialogue = format_text("Loomi's voice.", 31);
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
            current_dialogue = format_text("...", 25);
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
            current_dialogue = format_text("Even while sealed away, she still thinks about you often.", 31);
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
            current_dialogue = format_text("I just thought you'd like to hear thatthatthatthatthatthat", 31);
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
            current_dialogue = format_text("...Thank you, Foane.", 25);
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
            current_dialogue = format_text("Maybe we can find a way to save her someday...?", 31);
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
            current_dialogue = format_text("Heh@ Maybe...", 31);
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
            current_dialogue = format_text("... What was all that red stuff?", 25);
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
            current_dialogue = format_text("Uh, blood} Lancer, you mentioned blood like two days ago??", 25);
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
            current_dialogue = format_text("Oho, so that's what that is!!", 25);
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
            current_dialogue = format_text("Next time, we should perhaps check the age rating first...?", 25);
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
            current_dialogue = format_text("Yeesh, my hand's still tingling after watching that... my bad, Lancer.", 25);
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
            current_dialogue = format_text("Even if the movie was rather aggressive... that was still fun.", 25);
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
            current_dialogue = format_text("I guess being with friends can make scary movies more enjoyable?", 25);
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
            current_dialogue = format_text("You're going to KILL me saying things like that. I'm out of here.", 25);
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
            current_dialogue = format_text("...", 25);
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
            current_dialogue = format_text("I think I like it here after all@ See you around, Kris.", 25);
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
            current_dialogue = format_text("This movie night    Pissed me off...", 31);
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
            current_dialogue = format_text("That's my cue@ Toodles!", 25);
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
            current_dialogue = format_text("...For the record, it WAS fun.", 25);
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
            current_dialogue = format_text("I'm glad you enjoyed it, Susie!", 25);
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
            current_dialogue = format_text("I'd like this week... to be as fun as possible.", 25);
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
            current_dialogue = format_text("Yeah{ We should do this again.", 25);
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
            current_dialogue = format_text("Same time next week?", 25);
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
            current_dialogue = format_text("...", 25);
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
            current_dialogue = format_text("...Are you like, super emotional, or...?", 25);
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
            current_dialogue = format_text("N-no! I mean, I didn't mean to come off that way!", 25);
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
            current_dialogue = format_text("Next week... sounds good@ I'd love to do something like this again...", 27);
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
            current_dialogue = format_text("...Anyway@ See ya later.", 25);
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
            current_dialogue = format_text("Kris, can you stay for a moment?", 25);
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
            current_dialogue = format_text("It's important.", 25);
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
            current_dialogue = format_text("Um, this may sound strange, but recently I've been thinking...", 25);
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
            current_dialogue = format_text("Thinking about... what I want.", 25);
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
            current_dialogue = format_text("I thought I already knew what that was, but then I met you and Susie.", 25);
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
            current_dialogue = format_text("This castle was empty for the longest time@ In fact...", 25);
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
            current_dialogue = format_text("... I don't even remember how I got here, or who came before me.", 25);
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
            current_dialogue = format_text("I didn't know the first thing about having friends... until now.", 27);
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
            current_dialogue = format_text("We've done so much, met so many people...", 25);
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
            current_dialogue = format_text("And thanks to you, I've realized how valuable friendship really is!", 25);
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
            current_dialogue = format_text("It means so much to me... so I...", 25);
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
            current_dialogue = format_text("I want to protect that, Kris... to do whatever I can for the best outcome.", 27);
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
            current_dialogue = format_text("...", 25);
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
            current_dialogue = format_text("So... what if...", 25);
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
            current_dialogue = format_text("What if there was a way... to prepare for what comes next?", 25);
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
            current_dialogue = format_text("What if we could figure out the Roaring Knight's next move, or identity}", 25);
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
            current_dialogue = format_text("Is that silly of me to think} Would such a thing even be possible?", 25);
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
            current_dialogue = format_text("If you'd like to try too, Kris, then...", 25);
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
            current_dialogue = format_text("Why don't we close our eyes...", 25);
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
            current_dialogue = format_text("...and think about what the Knight is doing?", 25);
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
        var text_parts = string_split(current_dialogue, "Pissed");
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
                var remaining = string_copy(current_displayed, 1, 6);
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
        var text_parts = string_split(current_dialogue, "for");
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
                var remaining = string_copy(current_displayed, 1, 3);
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
        var text_parts = string_split(current_dialogue, "does");
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
        var text_parts = string_split(current_dialogue, "that");
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
