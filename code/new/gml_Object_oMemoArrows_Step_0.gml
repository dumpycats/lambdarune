timer++;
presstimer++;
var left_pressed = keyboard_check(vk_left);
var right_pressed = keyboard_check(vk_right);

if (!oSOULChapter3Select.memoleave)
    image_alpha += 0.1;

if (image_alpha > 1)
    image_alpha = 1;

if (image_alpha < 0)
    image_alpha = 0;

if (image_alpha == 1)
{
    if (right_pressed && presstimer > 5)
    {
        memooptions++;
        presstimer = 0;
    }
    
    if (left_pressed && presstimer > 5)
    {
        memooptions--;
        presstimer = 0;
    }
}

if (memooptions < 0)
    memooptions = 0;

if (memooptions > 16)
    memooptions = 16;

if (memooptions == 0)
{
    obj_Chapter3Memo3.x = 960;
    image_index = 2;
    percent1 = 0;
    percent2 = 0;
    percent5 = 0;
    percent6 = 0;
    percent3 += (1/15);
    position3 = animcurve_channel_evaluate(curve3, percent3);
    var _start3 = oChapter3Memo1.x;
    var _end3 = 320;
    var _distance3 = _end3 - _start3;
    oChapter3Memo1.x = _start3 + (_distance3 * position3);
    percent4 += (1/15);
    position4 = animcurve_channel_evaluate(curve4, percent4);
    var _start4 = oChapter3Memo2.x;
    var _end4 = 960;
    var _distance4 = _end4 - _start4;
    oChapter3Memo2.x = _start4 + (_distance4 * position4);
}

if (memooptions == 1)
{
    obj_Chapter3Memo4.x = 960;
    image_index = 0;
    percent3 = 0;
    percent4 = 0;
    percent5 = 0;
    percent6 = 0;
    percent1 += (1/15);
    position = animcurve_channel_evaluate(curve1, percent1);
    var _start = oChapter3Memo1.x;
    var _end = -320;
    var _distance = _end - _start;
    oChapter3Memo1.x = _start + (_distance * position);
    percent2 += (1/15);
    position2 = animcurve_channel_evaluate(curve2, percent2);
    var _start2 = oChapter3Memo2.x;
    var _end2 = 320;
    var _distance2 = _end2 - _start2;
    oChapter3Memo2.x = _start2 + (_distance2 * position2);
    percent7 += (1/15);
    position7 = animcurve_channel_evaluate(curve7, percent7);
    var _start7 = obj_Chapter3Memo3.x;
    var _end7 = 960;
    var _distance7 = _end7 - _start7;
    obj_Chapter3Memo3.x = _start7 + (_distance7 * position7);
}

if (memooptions == 2)
{
    oChapter3Memo1.x = -320;
    obj_Chapter3Memo5.x = 960;
    image_index = 0;
    percent1 = 0;
    percent2 = 0;
    percent7 = 0;
    percent9 = 0;
    percent10 = 0;
    percent11 = 0;
    percent5 += (1/15);
    position5 = animcurve_channel_evaluate(curve, percent5);
    var _start5 = oChapter3Memo2.x;
    var _end5 = -320;
    var _distance5 = _end5 - _start5;
    oChapter3Memo2.x = _start5 + (_distance5 * position5);
    percent6 += (1/15);
    position6 = animcurve_channel_evaluate(curve, percent6);
    var _start6 = obj_Chapter3Memo3.x;
    var _end6 = 320;
    var _distance6 = _end6 - _start6;
    obj_Chapter3Memo3.x = _start6 + (_distance6 * position6);
    percent8 += (1/15);
    position8 = animcurve_channel_evaluate(curve, percent8);
    var _start8 = obj_Chapter3Memo4.x;
    var _end8 = 960;
    var _distance8 = _end8 - _start8;
    obj_Chapter3Memo4.x = _start8 + (_distance8 * position8);
}

if (memooptions == 3)
{
    oChapter3Memo2.x = -320;
    obj_Chapter3Memo6.x = 960;
    image_index = 0;
    percent5 = 0;
    percent6 = 0;
    percent8 = 0;
    percent12 = 0;
    percent13 = 0;
    percent14 = 0;
    percent9 += (1/15);
    position9 = animcurve_channel_evaluate(curve, percent9);
    var _start9 = obj_Chapter3Memo3.x;
    var _end9 = -320;
    var _distance9 = _end9 - _start9;
    obj_Chapter3Memo3.x = _start9 + (_distance9 * position9);
    percent10 += (1/15);
    position10 = animcurve_channel_evaluate(curve, percent10);
    var _start10 = obj_Chapter3Memo4.x;
    var _end10 = 320;
    var _distance10 = _end10 - _start10;
    obj_Chapter3Memo4.x = _start10 + (_distance10 * position10);
    percent11 += (1/15);
    position11 = animcurve_channel_evaluate(curve, percent11);
    var _start11 = obj_Chapter3Memo5.x;
    var _end11 = 960;
    var _distance11 = _end11 - _start11;
    obj_Chapter3Memo5.x = _start11 + (_distance11 * position11);
}

if (memooptions == 4)
{
    obj_Chapter3Memo3.x = -320;
    obj_Chapter3Memo7.x = 960;
    image_index = 0;
    percent9 = 0;
    percent10 = 0;
    percent11 = 0;
    percent15 = 0;
    percent16 = 0;
    percent17 = 0;
    percent12 += (1/15);
    position12 = animcurve_channel_evaluate(curve, percent12);
    var _start12 = obj_Chapter3Memo4.x;
    var _end12 = -320;
    var _distance12 = _end12 - _start12;
    obj_Chapter3Memo4.x = _start12 + (_distance12 * position12);
    percent13 += (1/15);
    position13 = animcurve_channel_evaluate(curve, percent13);
    var _start13 = obj_Chapter3Memo5.x;
    var _end13 = 320;
    var _distance13 = _end13 - _start13;
    obj_Chapter3Memo5.x = _start13 + (_distance13 * position13);
    percent14 += (1/15);
    position14 = animcurve_channel_evaluate(curve, percent14);
    var _start14 = obj_Chapter3Memo6.x;
    var _end14 = 960;
    var _distance14 = _end14 - _start14;
    obj_Chapter3Memo6.x = _start14 + (_distance14 * position14);
}

if (memooptions == 5)
{
    obj_Chapter3Memo4.x = -320;
    obj_Chapter3Memo8.x = 960;
    image_index = 0;
    percent12 = 0;
    percent13 = 0;
    percent14 = 0;
    percent18 = 0;
    percent19 = 0;
    percent20 = 0;
    percent15 += (1/15);
    position15 = animcurve_channel_evaluate(curve, percent15);
    var _start15 = obj_Chapter3Memo5.x;
    var _end15 = -320;
    var _distance15 = _end15 - _start15;
    obj_Chapter3Memo5.x = _start15 + (_distance15 * position15);
    percent16 += (1/15);
    position16 = animcurve_channel_evaluate(curve, percent16);
    var _start16 = obj_Chapter3Memo6.x;
    var _end16 = 320;
    var _distance16 = _end16 - _start16;
    obj_Chapter3Memo6.x = _start16 + (_distance16 * position16);
    percent17 += (1/15);
    position17 = animcurve_channel_evaluate(curve, percent17);
    var _start17 = obj_Chapter3Memo7.x;
    var _end17 = 960;
    var _distance17 = _end17 - _start17;
    obj_Chapter3Memo7.x = _start17 + (_distance17 * position17);
}

if (memooptions == 6)
{
    obj_Chapter3Memo5.x = -320;
    obj_Chapter3Memo9.x = 960;
    image_index = 0;
    percent15 = 0;
    percent16 = 0;
    percent17 = 0;
    percent21 = 0;
    percent22 = 0;
    percent23 = 0;
    percent18 += (1/15);
    position18 = animcurve_channel_evaluate(curve, percent18);
    var _start18 = obj_Chapter3Memo6.x;
    var _end18 = -320;
    var _distance18 = _end18 - _start18;
    obj_Chapter3Memo6.x = _start18 + (_distance18 * position18);
    percent19 += (1/15);
    position19 = animcurve_channel_evaluate(curve, percent19);
    var _start19 = obj_Chapter3Memo7.x;
    var _end19 = 320;
    var _distance19 = _end19 - _start19;
    obj_Chapter3Memo7.x = _start19 + (_distance19 * position19);
    percent20 += (1/15);
    position20 = animcurve_channel_evaluate(curve, percent20);
    var _start20 = obj_Chapter3Memo8.x;
    var _end20 = 960;
    var _distance20 = _end20 - _start20;
    obj_Chapter3Memo8.x = _start20 + (_distance20 * position20);
}

if (memooptions == 7)
{
    obj_Chapter3Memo6.x = -320;
    obj_Chapter3Memo10.x = 960;
    image_index = 0;
    percent18 = 0;
    percent19 = 0;
    percent20 = 0;
    percent24 = 0;
    percent25 = 0;
    percent26 = 0;
    percent21 += (1/15);
    position21 = animcurve_channel_evaluate(curve, percent21);
    var _start21 = obj_Chapter3Memo7.x;
    var _end21 = -320;
    var _distance21 = _end21 - _start21;
    obj_Chapter3Memo7.x = _start21 + (_distance21 * position21);
    percent22 += (1/15);
    position22 = animcurve_channel_evaluate(curve, percent22);
    var _start22 = obj_Chapter3Memo8.x;
    var _end22 = 320;
    var _distance22 = _end22 - _start22;
    obj_Chapter3Memo8.x = _start22 + (_distance22 * position22);
    percent23 += (1/15);
    position23 = animcurve_channel_evaluate(curve, percent23);
    var _start23 = obj_Chapter3Memo9.x;
    var _end23 = 960;
    var _distance23 = _end23 - _start23;
    obj_Chapter3Memo9.x = _start23 + (_distance23 * position23);
}

if (memooptions == 8)
{
    obj_Chapter3Memo7.x = -320;
    obj_Chapter3Memo11.x = 960;
    image_index = 0;
    percent21 = 0;
    percent22 = 0;
    percent23 = 0;
    percent27 = 0;
    percent28 = 0;
    percent29 = 0;
    percent24 += (1/15);
    position24 = animcurve_channel_evaluate(curve, percent24);
    var _start24 = obj_Chapter3Memo8.x;
    var _end24 = -320;
    var _distance24 = _end24 - _start24;
    obj_Chapter3Memo8.x = _start24 + (_distance24 * position24);
    percent25 += (1/15);
    position25 = animcurve_channel_evaluate(curve, percent25);
    var _start25 = obj_Chapter3Memo9.x;
    var _end25 = 320;
    var _distance25 = _end25 - _start25;
    obj_Chapter3Memo9.x = _start25 + (_distance25 * position25);
    percent26 += (1/15);
    position26 = animcurve_channel_evaluate(curve, percent26);
    var _start26 = obj_Chapter3Memo10.x;
    var _end26 = 960;
    var _distance26 = _end26 - _start26;
    obj_Chapter3Memo10.x = _start26 + (_distance26 * position26);
}

if (memooptions == 9)
{
    obj_Chapter3Memo8.x = -320;
    obj_Chapter3Memo12.x = 960;
    image_index = 0;
    percent24 = 0;
    percent25 = 0;
    percent26 = 0;
    percent30 = 0;
    percent31 = 0;
    percent32 = 0;
    percent27 += (1/15);
    position27 = animcurve_channel_evaluate(curve, percent27);
    var _start27 = obj_Chapter3Memo9.x;
    var _end27 = -320;
    var _distance27 = _end27 - _start27;
    obj_Chapter3Memo9.x = _start27 + (_distance27 * position27);
    percent28 += (1/15);
    position28 = animcurve_channel_evaluate(curve, percent28);
    var _start28 = obj_Chapter3Memo10.x;
    var _end28 = 320;
    var _distance28 = _end28 - _start28;
    obj_Chapter3Memo10.x = _start28 + (_distance28 * position28);
    percent29 += (1/15);
    position29 = animcurve_channel_evaluate(curve, percent29);
    var _start29 = obj_Chapter3Memo11.x;
    var _end29 = 960;
    var _distance29 = _end29 - _start29;
    obj_Chapter3Memo11.x = _start29 + (_distance29 * position29);
}

if (memooptions == 10)
{
    obj_Chapter3Memo9.x = -320;
    obj_Chapter3Memo13.x = 960;
    image_index = 0;
    percent27 = 0;
    percent28 = 0;
    percent29 = 0;
    percent33 = 0;
    percent34 = 0;
    percent35 = 0;
    percent30 += (1/15);
    position30 = animcurve_channel_evaluate(curve, percent30);
    var _start30 = obj_Chapter3Memo10.x;
    var _end30 = -320;
    var _distance30 = _end30 - _start30;
    obj_Chapter3Memo10.x = _start30 + (_distance30 * position30);
    percent31 += (1/15);
    position31 = animcurve_channel_evaluate(curve, percent31);
    var _start31 = obj_Chapter3Memo11.x;
    var _end31 = 320;
    var _distance31 = _end31 - _start31;
    obj_Chapter3Memo11.x = _start31 + (_distance31 * position31);
    percent32 += (1/15);
    position32 = animcurve_channel_evaluate(curve, percent32);
    var _start32 = obj_Chapter3Memo12.x;
    var _end32 = 960;
    var _distance32 = _end32 - _start32;
    obj_Chapter3Memo12.x = _start32 + (_distance32 * position32);
}

if (memooptions == 11)
{
    obj_Chapter3Memo10.x = -320;
    obj_Chapter3Memo14.x = 960;
    image_index = 0;
    percent30 = 0;
    percent31 = 0;
    percent32 = 0;
    percent36 = 0;
    percent37 = 0;
    percent38 = 0;
    percent33 += (1/15);
    position33 = animcurve_channel_evaluate(curve, percent33);
    var _start33 = obj_Chapter3Memo11.x;
    var _end33 = -320;
    var _distance33 = _end33 - _start33;
    obj_Chapter3Memo11.x = _start33 + (_distance33 * position33);
    percent34 += (1/15);
    position34 = animcurve_channel_evaluate(curve, percent34);
    var _start34 = obj_Chapter3Memo12.x;
    var _end34 = 320;
    var _distance34 = _end34 - _start34;
    obj_Chapter3Memo12.x = _start34 + (_distance34 * position34);
    percent35 += (1/15);
    position35 = animcurve_channel_evaluate(curve, percent35);
    var _start35 = obj_Chapter3Memo13.x;
    var _end35 = 960;
    var _distance35 = _end35 - _start35;
    obj_Chapter3Memo13.x = _start35 + (_distance35 * position35);
}

if (memooptions == 12)
{
    obj_Chapter3Memo11.x = -320;
    obj_Chapter3Memo15.x = 960;
    image_index = 0;
    percent33 = 0;
    percent34 = 0;
    percent35 = 0;
    percent39 = 0;
    percent40 = 0;
    percent41 = 0;
    percent36 += (1/15);
    position36 = animcurve_channel_evaluate(curve, percent36);
    var _start36 = obj_Chapter3Memo12.x;
    var _end36 = -320;
    var _distance36 = _end36 - _start36;
    obj_Chapter3Memo12.x = _start36 + (_distance36 * position36);
    percent37 += (1/15);
    position37 = animcurve_channel_evaluate(curve, percent37);
    var _start37 = obj_Chapter3Memo13.x;
    var _end37 = 320;
    var _distance37 = _end37 - _start37;
    obj_Chapter3Memo13.x = _start37 + (_distance37 * position37);
    percent38 += (1/15);
    position38 = animcurve_channel_evaluate(curve, percent38);
    var _start38 = obj_Chapter3Memo14.x;
    var _end38 = 960;
    var _distance38 = _end38 - _start38;
    obj_Chapter3Memo14.x = _start38 + (_distance38 * position38);
}

if (memooptions == 13)
{
    obj_Chapter3Memo12.x = -320;
    obj_Chapter3Memo16.x = 960;
    image_index = 0;
    percent36 = 0;
    percent37 = 0;
    percent38 = 0;
    percent42 = 0;
    percent43 = 0;
    percent44 = 0;
    percent39 += (1/15);
    position39 = animcurve_channel_evaluate(curve, percent39);
    var _start39 = obj_Chapter3Memo13.x;
    var _end39 = -320;
    var _distance39 = _end39 - _start39;
    obj_Chapter3Memo13.x = _start39 + (_distance39 * position39);
    percent40 += (1/15);
    position40 = animcurve_channel_evaluate(curve, percent40);
    var _start40 = obj_Chapter3Memo14.x;
    var _end40 = 320;
    var _distance40 = _end40 - _start40;
    obj_Chapter3Memo14.x = _start40 + (_distance40 * position40);
    percent41 += (1/15);
    position41 = animcurve_channel_evaluate(curve, percent41);
    var _start41 = obj_Chapter3Memo15.x;
    var _end41 = 960;
    var _distance41 = _end41 - _start41;
    obj_Chapter3Memo15.x = _start41 + (_distance41 * position41);
}

if (memooptions == 14)
{
    obj_Chapter3Memo13.x = -320;
    obj_Chapter3Memo17.x = 960;
    image_index = 0;
    percent39 = 0;
    percent40 = 0;
    percent41 = 0;
    percent45 = 0;
    percent46 = 0;
    percent47 = 0;
    percent42 += (1/15);
    position42 = animcurve_channel_evaluate(curve, percent42);
    var _start42 = obj_Chapter3Memo14.x;
    var _end42 = -320;
    var _distance42 = _end42 - _start42;
    obj_Chapter3Memo14.x = _start42 + (_distance42 * position42);
    percent43 += (1/15);
    position43 = animcurve_channel_evaluate(curve, percent43);
    var _start43 = obj_Chapter3Memo15.x;
    var _end43 = 320;
    var _distance43 = _end43 - _start43;
    obj_Chapter3Memo15.x = _start43 + (_distance43 * position43);
    percent44 += (1/15);
    position44 = animcurve_channel_evaluate(curve, percent44);
    var _start44 = obj_Chapter3Memo16.x;
    var _end44 = 960;
    var _distance44 = _end44 - _start44;
    obj_Chapter3Memo16.x = _start44 + (_distance44 * position44);
}

if (memooptions == 15)
{
    obj_Chapter3Memo14.x = -320;
    image_index = 0;
    percent42 = 0;
    percent43 = 0;
    percent44 = 0;
    percent48 = 0;
    percent49 = 0;
    percent50 = 0;
    percent45 += (1/15);
    position45 = animcurve_channel_evaluate(curve, percent45);
    var _start45 = obj_Chapter3Memo15.x;
    var _end45 = -320;
    var _distance45 = _end45 - _start45;
    obj_Chapter3Memo15.x = _start45 + (_distance45 * position45);
    percent46 += (1/15);
    position46 = animcurve_channel_evaluate(curve, percent46);
    var _start46 = obj_Chapter3Memo16.x;
    var _end46 = 320;
    var _distance46 = _end46 - _start46;
    obj_Chapter3Memo16.x = _start46 + (_distance46 * position46);
    percent47 += (1/15);
    position47 = animcurve_channel_evaluate(curve, percent47);
    var _start47 = obj_Chapter3Memo17.x;
    var _end47 = 960;
    var _distance47 = _end47 - _start47;
    obj_Chapter3Memo17.x = _start47 + (_distance47 * position47);
}

if (memooptions == 16)
{
    obj_Chapter3Memo15.x = -320;
    image_index = 1;
    percent45 = 0;
    percent46 = 0;
    percent47 = 0;
    percent51 = 0;
    percent52 = 0;
    percent53 = 0;
    percent48 += (1/15);
    position48 = animcurve_channel_evaluate(curve, percent48);
    var _start48 = obj_Chapter3Memo16.x;
    var _end48 = -320;
    var _distance48 = _end48 - _start48;
    obj_Chapter3Memo16.x = _start48 + (_distance48 * position48);
    percent49 += (1/15);
    position49 = animcurve_channel_evaluate(curve, percent49);
    var _start49 = obj_Chapter3Memo17.x;
    var _end49 = 320;
    var _distance49 = _end49 - _start49;
    obj_Chapter3Memo17.x = _start49 + (_distance49 * position49);
}
