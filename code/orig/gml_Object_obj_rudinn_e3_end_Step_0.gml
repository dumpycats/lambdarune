depth = -y;
var endy = 256;

if (move)
{
    direction = -90;
    image_speed = 1;
    speed = 4;
    move = false;
    image_xscale = -2;
}

if (y >= endy)
{
    y = endy;
    direction = 0;
}
