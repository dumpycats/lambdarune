switch (global.shopdialogue)
{
    case 1:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_0");
        global.typing_speed = 1;
        break;
    case 2:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_1");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 3:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_2");
        global.typing_speed = 1;
        global.fadeout = true;
        instance_create_depth(320, 240, -80, oBlackScreen);
        oBlackScreen.image_alpha = 0;
        instance_destroy();
        global.shadowwomanmonologue = false;
        global.shoptalkmenu = false;
        break;
    case 4:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_3");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 5:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_4");
        global.typing_speed = 1;
        global.fadeout = true;
        instance_create_depth(320, 240, -80, oBlackScreen);
        oBlackScreen.image_alpha = 0;
        instance_destroy();
        global.shadowwomanmonologue = false;
        global.shoptalkmenu = false;
        break;
    case 6:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_5");
        global.typing_speed = 1;
        global.shadowwomanmonologue = false;
        global.shoptalkmenu = false;
        break;
    case 7:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_6");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 8:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_7");
        global.typing_speed = 1;
        global.shadowwomanmonologue = false;
        global.shoptalkmenu = false;
        break;
    case 9:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_8");
        global.typing_speed = 1;
        global.shadowwomanmonologue = false;
        global.shoptalkmenu = false;
        break;
    case 10:
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_9");
        global.typing_speed = 1;
        global.shadowwomanmonologue = false;
        global.shoptalkmenu = true;
        break;
    case 11:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_10");
        global.typing_speed = 1;
        global.shadowwomanmonologue = false;
        global.shoptalkmenu = false;
        break;
    case 12:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_11");
        global.typing_speed = 1;
        global.shadowwomanmonologue = false;
        global.shoptalkmenu = true;
        break;
    case 13:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_12");
        global.typing_speed = 1;
        global.shadowwomanmonologue = false;
        global.shoptalkmenu = true;
        break;
    case 14:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_13");
        global.typing_speed = 1;
        global.shadowwomanmonologue = false;
        global.shoptalkmenu = true;
        break;
    case 15:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_14");
        global.typing_speed = 1;
        global.shadowwomanmonologue = false;
        global.shoptalkmenu = true;
        break;
    case 16:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_15");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 17:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_16");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 18:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_17");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 19:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_18");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 20:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_19");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 21:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_20");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 22:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_21");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 23:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_22");
        global.typing_speed = 1;
        global.shadowwomanmonologue = false;
        global.shoptalkmenu = true;
        global.shopbuymenu = false;
        global.shopmainmenu = false;
        global.midnightcrewoption = true;
        oSOUL.image_alpha = 1;
        oShopMenu.image_index = 0;
        global.soulmove = true;
        global.shadowtalking = false;
        break;
    case 24:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_23");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 25:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_24");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 26:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_25");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 27:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_26");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 28:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_27");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 29:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_28");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 30:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_29");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 31:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_30");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 32:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_31");
        global.typing_speed = 1;
        global.shadowwomanmonologue = false;
        global.shoptalkmenu = true;
        global.shopbuymenu = false;
        global.shopmainmenu = false;
        global.midnightcrewoptiondone = true;
        oSOUL.image_alpha = 1;
        oShopMenu.image_index = 0;
        global.soulmove = true;
        global.shadowtalking = false;
        break;
    case 33:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_32");
        global.typing_speed = 1;
        global.shadowwomanmonologue = false;
        global.shoptalkmenu = true;
        break;
    case 34:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_33");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 35:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_34");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 36:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_35");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 37:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_36");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 38:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_37");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 39:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_38");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 40:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_39");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 41:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_40");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 42:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_41");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 43:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_42");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 44:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_43");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 45:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_44");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 46:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_45");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 47:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_46");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 48:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_47");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 49:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_48");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 50:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_49");
        global.typing_speed = 1;
        global.shadowwomanmonologue = false;
        global.shoptalkmenu = true;
        global.shopbuymenu = false;
        global.shopmainmenu = false;
        global.revengeoption = true;
        oSOUL.image_alpha = 1;
        oShopMenu.image_index = 0;
        global.soulmove = true;
        global.shadowtalking = false;
        break;
    case 51:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_50");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 52:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_51");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 53:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_52");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 54:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_53");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 55:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_54");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 56:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_55");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 57:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_56");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 58:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_57");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 59:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_58");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 60:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_59");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 61:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_60");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 62:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_61");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 63:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_62");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 64:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_63");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 65:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_64");
        global.typing_speed = 1;
        global.shadowwomanmonologue = false;
        global.shoptalkmenu = true;
        global.shopbuymenu = false;
        global.shopmainmenu = false;
        global.revengeoptiondone = true;
        oSOUL.image_alpha = 1;
        oShopMenu.image_index = 0;
        global.soulmove = true;
        global.shadowtalking = false;
        break;
    case 66:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_65");
        global.typing_speed = 1;
        global.shadowwomanmonologue = false;
        global.shoptalkmenu = true;
        break;
    case 70:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_66");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 71:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_67");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 72:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_68");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 73:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_69");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 74:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_70");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 75:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_71");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 76:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_72");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 77:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_73");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 78:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_74");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 79:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_75");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 80:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_76");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 81:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_77");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 82:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_78");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 83:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_79");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 84:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_80");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 85:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_81");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 86:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_82");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 87:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_83");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 88:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_84");
        global.typing_speed = 1;
        global.shadowwomanmonologue = false;
        global.shoptalkmenu = true;
        global.shopbuymenu = false;
        global.shopmainmenu = false;
        global.shadowbardone = true;
        oSOUL.image_alpha = 1;
        oShopMenu.image_index = 0;
        global.soulmove = true;
        global.shadowtalking = false;
        break;
    case 89:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_85");
        global.typing_speed = 1;
        global.shadowwomanmonologue = false;
        global.shoptalkmenu = true;
        global.shopbuymenu = false;
        global.shopmainmenu = false;
        global.shadowbardone = true;
        oSOUL.image_alpha = 1;
        oShopMenu.image_index = 0;
        global.soulmove = true;
        global.shadowtalking = false;
        break;
    case 90:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_86");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 91:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_87");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 92:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_88");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 93:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_89");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 94:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_90");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 95:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_91");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 96:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_92");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 97:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_93");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 98:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_94");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 99:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_95");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 100:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_96");
        audio_sound_gain(mus_shadowshop, 0.33, 150);
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        
        if (keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X")))
        {
            instance_create_depth(368, 240, -50, oThirdRulerText);
            oThirdRulerText.image_index = 10;
        }
        
        thirdrulertimer += 1;
        
        if (thirdrulertimer == 27)
            instance_create_depth(368, 240, -50, oThirdRulerText);
        
        break;
    case 101:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_97");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        thirdrulertimer = 0;
        global.shoptalkmenu = false;
        break;
    case 102:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_98");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 103:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_99");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 104:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_100");
        global.typing_speed = 1;
        global.shadowwomanmonologue = false;
        global.shoptalkmenu = true;
        global.shopbuymenu = false;
        global.shopmainmenu = false;
        audio_sound_gain(mus_shadowshop, 1, 900);
        global.cathodecrewoption = true;
        oSOUL.image_alpha = 1;
        oShopMenu.image_index = 0;
        global.soulmove = true;
        global.shadowtalking = false;
        break;
    case 105:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_101");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        break;
    case 106:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_102");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 107:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_103");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 108:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_104");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 109:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_105");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 110:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_106");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 111:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_107");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 112:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_108");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 113:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_109");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 114:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_110");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 115:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_111");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 116:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_112");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 117:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_113");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 118:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_114");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 119:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_115");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 120:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_116");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 121:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_117");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 122:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_118");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 123:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_119");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 124:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_120");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 125:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_121");
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 126:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_122");
        global.typing_speed = 1;
        global.shadowwomanmonologue = false;
        global.shoptalkmenu = true;
        global.shopbuymenu = false;
        global.shopmainmenu = false;
        global.cathodecrewoptiondone = true;
        oSOUL.image_alpha = 1;
        oShopMenu.image_index = 0;
        global.soulmove = true;
        global.shadowtalking = false;
        break;
    case 127:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_123");
        global.typing_speed = 1;
        global.shadowwomanmonologue = false;
        global.shoptalkmenu = false;
        break;
    default:
        global.current_dialogue = translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_124");
        break;
}

if (!global.text_complete && !global.pause_for_punctuation)
{
    global.typing_timer += global.typing_speed;
    
    while (global.typing_timer >= 1)
    {
        global.typing_timer -= 1;
        
        if (global.letter_index < string_length(global.current_dialogue))
        {
            var next_char = string_char_at(global.current_dialogue, global.letter_index + 1);
            var following_char = ((global.letter_index + 2) <= string_length(global.current_dialogue)) ? string_char_at(global.current_dialogue, global.letter_index + 2) : translation_get_string("gml_Object_oTextShadowWomanBackup_Step_0_125");
            
            if (next_char == " " && following_char == " ")
            {
                global.displayed_text += "  ";
                global.letter_index += 2;
            }
            else
            {
                global.displayed_text += next_char;
                
                if ((next_char == "," || next_char == ":") || next_char == ".")
                {
                    alarm[0] = 4;
                    global.pause_for_punctuation = true;
                    global.letter_index += 1;
                    break;
                }
                else if (next_char == "?")
                {
                    alarm[0] = 10;
                    global.pause_for_punctuation = true;
                    global.letter_index += 1;
                    break;
                }
                else if (next_char != " " || next_char != "*")
                {
                    if (global.susietalk)
                        audio_play_sound(snd_susie, 1, false);
                    else if (global.ralseitalk)
                        audio_play_sound(snd_ralsei, 1, false);
                    else if (global.texttalk)
                        audio_play_sound(snd_text, 1, false);
                }
                
                global.letter_index += 1;
            }
        }
        else
        {
            global.text_complete = true;
            break;
        }
    }
}

var advance_pressed = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
var skip_pressed = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X"));

if (!global.pause_for_punctuation && global.shadowwomanmonologue && advance_pressed)
{
    if (global.text_complete)
    {
        global.shopdialogue += 1;
        reset_dialogue();
        
        if (instance_exists(oThirdRulerText))
            instance_destroy(oThirdRulerText);
    }
}
else if (!global.pause_for_punctuation && skip_pressed && !advance_pressed)
{
    global.displayed_text = global.current_dialogue;
    global.text_complete = true;
    audio_stop_sound(snd_ralsei);
    audio_stop_sound(snd_susie);
    audio_stop_sound(snd_text);
}
