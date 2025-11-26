purplecolor = 14235093;
scaleoffset = 1;
randommultiplier = 1;
echoing = true;

if (sprite_index == spr_spike)
{
    image_xscale = 1;
    image_yscale = 0.6;
}
else
{
    image_xscale = 1.3;
    image_yscale = 1.3;
}

image_alpha = 0;
timer = -1;
image_speed = 0;
pingtimer = -1;
up = false;
pull = irandom_range(1, 1);
stop = false;
randomize();
SOUL = obj_SOUL_battle_sof;
hit = false;
tptimer = 0;
