var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
var debug1 = keyboard_check(ord("Q"));
var debug2 = keyboard_check(ord("W"));
var debug3 = keyboard_check(ord("E"));
var debug4 = keyboard_check(ord("L"));
var debug5 = keyboard_check_pressed(ord("L"));

if (debug1 && debug2 && debug3 && debug5)
{
    debugroom = true;
    triggered = true;
}
else
{
    debugroom = false;
}

var space_pressed = keyboard_check(vk_space);

if (space_pressed)
{
    spacepressedtimer++;
    
    if (spacepressedtimer == 0)
    {
        if (debugfps)
        {
            debugfps = false;
            spacepressedtimer = -1;
        }
    }
    else if (spacepressedtimer == 15)
    {
        if (!debugfps)
            debugfps = true;
    }
}
else
{
    spacepressedtimer = -1;
}

if (debugfps)
{
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(fDeterminationMW);
    draw_set_color(c_black);
    var fpscounter = lang("oESC_Draw_73_0") + string(round(fps_real));
    draw_text(cx + 6, cy + 4 + 2, fpscounter);
    draw_text(cx + 6, (cy + 4) - 2, fpscounter);
    draw_text(cx + 6 + 2, cy + 4, fpscounter);
    draw_text((cx + 6) - 2, cy + 4, fpscounter);
    draw_set_color(c_white);
    draw_set_alpha(0.8);
    draw_text(cx + 6, cy + 4, fpscounter);
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_alpha(1);
}

var advance_pressed, revert_pressed;

if (crttrigger)
{
    advance_pressed = keyboard_check_pressed(ord("T"));
    revert_pressed = keyboard_check_pressed(ord("V"));
}
else
{
    advance_pressed = 0;
    revert_pressed = 0;
}

depth = -5000;
draw_sprite_ext(sEsc, 0, cx + 6, cy + 6, 1, 1, 0, c_white, (timer + 20) / 20);

if (keyboard_check_pressed(ord("C")) && false)
{
}

if (keyboard_check_pressed(ord("T")))
    tpress = true;

if (keyboard_check_pressed(ord("V")))
{
    rpress = true;
    cpress = true;
}

if (cpress && rpress && tpress && !crttrigger)
{
    crttrigger = true;
}
else if (!cpress && !rpress && !tpress)
{
    crttimer = -1;
}
else if (!crttrigger)
{
    crttimer++;
    
    if (crttimer == 66)
    {
        crttimer = -1;
        cpress = false;
        rpress = false;
        tpress = false;
        crttrigger = false;
    }
}

if (crttrigger)
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(fDeterminationMW);
    draw_set_color(c_black);
    
    if (!instance_exists(oCRT))
    {
        var warning = lang("oESC_Draw_73_1");
        draw_text(cx + 320, cy + 48 + 2, warning);
        draw_text(cx + 320, (cy + 48) - 2, warning);
        draw_text(cx + 320 + 2, cy + 48, warning);
        draw_text((cx + 320) - 2, cy + 48, warning);
        draw_set_alpha(0.8);
        draw_text(cx + 320, cy + 48 + 4, warning);
        draw_set_alpha(0.6);
        draw_text(cx + 320, cy + 48 + 6, warning);
        draw_set_alpha(0.4);
        draw_text(cx + 320, cy + 48 + 8, warning);
        draw_set_alpha(0.2);
        draw_text(cx + 320, cy + 48 + 10, warning);
        draw_set_color(c_yellow);
        draw_set_alpha(1);
        draw_text(cx + 320, cy + 48, warning);
    }
    else if (instance_exists(oCRT))
    {
        var warning = lang("oESC_Draw_73_2");
        draw_text(cx + 320, cy + 48 + 2, warning);
        draw_text(cx + 320, (cy + 48) - 2, warning);
        draw_text(cx + 320 + 2, cy + 48, warning);
        draw_text((cx + 320) - 2, cy + 48, warning);
        draw_set_alpha(0.8);
        draw_text(cx + 320 + 4, cy + 48 + 4, warning);
        draw_set_alpha(0.6);
        draw_text(cx + 320 + 6, cy + 48 + 6, warning);
        draw_set_alpha(0.4);
        draw_text(cx + 320 + 8, cy + 48 + 8, warning);
        draw_set_alpha(0.2);
        draw_text(cx + 320 + 10, cy + 48 + 10, warning);
        draw_set_color(c_fuchsia);
        draw_set_alpha(1);
        draw_text(cx + 320, cy + 48, warning);
    }
    
    if (advance_pressed)
    {
        if ((createmod % 2) == 0)
        {
            instance_create_depth(cx + 320, cy + 240, -6666, oCRT);
            createmod++;
        }
        else if ((createmod % 1) == 0)
        {
            instance_destroy(oCRT);
            audio_play_sound(snd_scissorbell, 1, false);
            createmod++;
        }
        
        crttimer = -1;
        cpress = false;
        rpress = false;
        tpress = false;
        crttrigger = false;
    }
    else if (revert_pressed)
    {
        crttimer = -1;
        cpress = false;
        rpress = false;
        tpress = false;
        crttrigger = false;
    }
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_alpha(1);
}
