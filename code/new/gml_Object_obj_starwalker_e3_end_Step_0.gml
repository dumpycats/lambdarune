depth = -y;
var endy = 260;

if (move)
{
    sprite_index = spr_starwalking;
    direction = 90;
    image_speed = 1;
    speed = 4;
    move = false;
}

if (y <= endy)
{
    y = endy;
    direction = 0;
}
