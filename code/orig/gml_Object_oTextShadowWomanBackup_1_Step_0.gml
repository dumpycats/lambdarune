switch (global.shopdialogue)
{
    case 1:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Welcome to... the\n  Shadow Bar.";
        global.typing_speed = 1;
        break;
    case 2:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* ...";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 3:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "";
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
        global.current_dialogue = "* The bar is always... open.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 5:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "";
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
        global.current_dialogue = "* Buy a drink first...\n  then we'll talk.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = false;
        global.shoptalkmenu = false;
        break;
    case 7:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* I... don't need\n  anything.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 8:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Especially... from\n  the likes of you.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = false;
        global.shoptalkmenu = false;
        break;
    case 9:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* You're not from\n  around here... are\n  you?";
        global.typing_speed = 1;
        global.shadowwomanmonologue = false;
        global.shoptalkmenu = false;
        break;
    case 10:
        global.charactertalking = true;
        global.current_dialogue = "What can\nI... serve\nyou?";
        global.typing_speed = 1;
        global.shadowwomanmonologue = false;
        global.shoptalkmenu = true;
        break;
    case 11:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Leaving...\n  empty-handed?";
        global.typing_speed = 1;
        global.shadowwomanmonologue = false;
        global.shoptalkmenu = false;
        break;
    case 12:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "Your\nloss...";
        global.typing_speed = 1;
        global.shadowwomanmonologue = false;
        global.shoptalkmenu = true;
        break;
    case 13:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "Coming\nright up...";
        global.typing_speed = 1;
        global.shadowwomanmonologue = false;
        global.shoptalkmenu = true;
        break;
    case 14:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "We don't\ndo \"tabs\"\nhere.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = false;
        global.shoptalkmenu = true;
        break;
    case 15:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "You want...\nto talk?";
        global.typing_speed = 1;
        global.shadowwomanmonologue = false;
        global.shoptalkmenu = true;
        break;
    case 16:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Me...? Hm.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 17:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* I'm whatever the Midnight... needs\n  me to be.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 18:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* My name? ...A secret.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 19:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Call me Shadow Woman.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 20:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* I serve drinks... and chat.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 21:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Not much else to say... to you.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 22:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* You're not... one of us.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 23:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "";
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
        global.current_dialogue = "* The Midnight... my family.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 25:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* They got me... out of a bad spot.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 26:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* I'm grateful.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 27:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Now I help Kreid... and the\n  others...";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 28:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Control this... part of the Dark\n  World.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 29:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Plans to take over the rest are...\n  in the works.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 30:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* I would advise you to... not get\n  on bad terms with us.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 31:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* You'd gravely regret it.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 32:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "";
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
        global.current_dialogue = "...";
        global.typing_speed = 1;
        global.shadowwomanmonologue = false;
        global.shoptalkmenu = true;
        break;
    case 34:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* My Boss... and friend.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 35:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Charismatic... Cunning... Proud...";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 36:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* ...Fearsome.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 37:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* We all... respect Kreid.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 38:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* And yet... they're still lost.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 39:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Dwelling on the past... with you,\n  cyan.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 40:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* There's also that woman...\n  Chairiel.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 41:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* The Boss before Kreid.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 42:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* There's few that Kreid... respects\n  as much.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 43:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* And even fewer... they hold that\n  dearly, like a mother.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 44:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* To take control over the\n  Midnight... from someone like\n  that...";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 45:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* It must have... been difficult.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 46:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* I wish Kreid talked it out... with\n  us.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 47:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* ...";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 48:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Don't tell Kreid I said that,\n  capeesh?";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 49:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* I'd rather... keep my pay high.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 50:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "";
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
        global.current_dialogue = "* You and the Boss have history...";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 52:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Once... best friends.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 53:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Inseparable.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 54:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Everyday spent together... happy.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 55:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* One day you... abandoned them.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 56:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Was it... boredom?";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 57:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Did you... no longer like them?";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 58:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Maybe you just... forgot?";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 59:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* No matter.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 60:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* The boss suffered greatly...";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 61:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Rarely does that go... unpunished.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 62:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* This time will be no different.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 63:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* You have the whole Midnight's\n  attention... cyan.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 64:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Obviously... not the good kind.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 65:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "";
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
        global.current_dialogue = "...?";
        global.typing_speed = 1;
        global.shadowwomanmonologue = false;
        global.shoptalkmenu = true;
        break;
    case 70:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* My pride... my glory...";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 71:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* I built it from the ground up...\n  with nothing but simple planks.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 72:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* With my own... two hands.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 73:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* My dream was always having a bar.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 74:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* It prospered well... at first.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 75:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Then...";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 76:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Every month... started bringing\n  less and less profit.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 77:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* I was... at the brink of\n  bankruptcy.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 78:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Then... came Kreid.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 79:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Kreid saw potential in me... and\n  my bar.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 80:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* I was offered a deal...";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 81:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Financial aid... for joining the\n  Midnight.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 82:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* I took the deal.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 83:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* The money was nice... and helpful.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 84:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* I also... gained something more\n  valuable that day.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 85:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* For the first time... I felt a\n  sense of...";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 86:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Belonging.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 87:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* It was cosy.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 88:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "";
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
        global.current_dialogue = "";
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
        global.current_dialogue = "* The country...";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 91:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Too colorful... and too bright for\n  my tastes.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 92:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* It's split into channels... each\n  with a different theme.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 93:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Pretty... interesting places.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 94:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Their similarities come from...\n  the ones in charge.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 95:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Mike is... fine.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 96:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Entertaining... his shows are nice.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 97:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* But... Tenna and her Cathodes?";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 98:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* A joke of... a crew and ruler.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 99:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* ...";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 100:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* There was... a third ruler.";
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
        global.current_dialogue = "* Key word... \"was\".";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        thirdrulertimer = 0;
        global.shoptalkmenu = false;
        break;
    case 102:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Do not ask about her or I'll make\n  you leave...";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 103:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* In many more pieces than one.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 104:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "";
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
        global.current_dialogue = "* I... still don't\n  need anything.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        break;
    case 106:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* The Cathodes.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 107:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* ......";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 108:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Words cannot describe... my\n  disgust for them.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 109:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* They think... they're better than\n  us.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 110:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Just because they're a... \"legal\n  organization\"...";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 111:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* While we are... a crime syndicate.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 112:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Hypocrites...";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 113:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* The differences... between the\n  Midnight and Cathodes?";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 114:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* ...Name, looks and boss.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 115:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* They're just as rotten as us... or\n  even worse.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 116:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* They just hide it... behind a mask\n  of law.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 117:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Pathetic.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 118:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Soon... we'll show those Cathodes.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 119:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Show them... what the Midnight is\n  truly capable of.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 120:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* The country... will be ours...";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 121:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Tenna will finally be overthrown.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 122:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Mark my words.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 123:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* ...";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 124:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* We're still going to keep Mike...\n  as a mascot.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 125:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "* Nobody here really dislikes him.";
        global.typing_speed = 1;
        global.shadowwomanmonologue = true;
        global.shoptalkmenu = false;
        break;
    case 126:
        global.texttalk = true;
        global.charactertalking = true;
        global.current_dialogue = "";
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
        global.current_dialogue = "* Interesting times\n  we're living in...";
        global.typing_speed = 1;
        global.shadowwomanmonologue = false;
        global.shoptalkmenu = false;
        break;
    default:
        global.current_dialogue = "";
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
            var following_char = ((global.letter_index + 2) <= string_length(global.current_dialogue)) ? string_char_at(global.current_dialogue, global.letter_index + 2) : "";
            
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
