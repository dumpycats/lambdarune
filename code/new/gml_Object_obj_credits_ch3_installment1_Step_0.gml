percent1 += (0.00022222222222222223 * boost);
var position1 = animcurve_channel_evaluate(curve1, percent1);
var _start1 = 500;
var _end1 = -7770;
var _distance1 = _end1 - _start1;
y = _start1 + (_distance1 * position1);

if (percent1 == 0.00022222222222222223)
{
}

var advance_held = keyboard_check_direct(vk_enter) || keyboard_check_direct(ord("Z")) || (keyboard_check_direct(vk_shift) || keyboard_check_direct(ord(get_lang_string("obj_credits_ch3_installment1_Step_0_0"))));

if (percent1 < 0.9333333333333333)
{
    if (advance_held && boost < 10)
    {
        if (boost < 10)
            boost += 0.1;
        
        if (boost2 < 1.2)
            boost2 += 0.002;
        
        if (whitealpha < 0.35)
            whitealpha += 0.01;
    }
    else
    {
        if (boost > 1)
        {
            boost -= 0.3;
            boost2 -= 0.003;
        }
        
        if (whitealpha > 0 && !advance_held)
            whitealpha -= 0.01;
    }
}

if (boost <= 1)
{
    boost = 1;
    boost2 = 1;
}

if (whitealpha >= 0.35)
    whitealpha = 0.35;

if (whitealpha <= 0)
    whitealpha = 0;

audio_sound_pitch(mus_revolution, 1 * boost2);

if (percent1 > 0.9333333333333333)
{
    audio_sound_gain(mus_revolution, 0, 1000);
    
    if (boost > 1)
    {
        boost -= 0.3;
        boost2 -= 0.003;
    }
    
    whitealpha -= 0.005;
}

if (percent1 > 1.0066666666666666)
    room_goto(rLambdaruneLogoToC3);
