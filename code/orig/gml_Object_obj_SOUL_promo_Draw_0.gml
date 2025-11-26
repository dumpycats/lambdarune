var revert_pressed = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X"));
draw_self();
draw_sprite_ext(spr_promo_ch3, 1, 320, 240, 1, 1, 0, c_white, 1);
draw_sprite_ext(sBlackScreen, 0, 320, 240, 2, 2, 0, c_white, blackfadein);
blackfadein -= 0.1;

if (revert_pressed)
    global.accessible = false;

if (!global.accessible)
{
    blackfadeout += 0.1;
    
    if (blackfadeout >= 1.5)
        room_goto(rLambdaruneLogoToC3);
}
