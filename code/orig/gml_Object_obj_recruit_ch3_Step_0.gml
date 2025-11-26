timer++;

switch (timer)
{
    case 0:
        break;
    case 1:
        image_xscale = 3.4;
        image_yscale = 0.46;
        break;
    case 2:
        image_xscale = 2.83;
        image_yscale = 2/3;
        break;
    case 3:
        image_xscale = 2.25;
        image_yscale = 0.875;
        break;
    case 4:
        image_xscale = 1.667;
        image_yscale = 1.083;
        break;
    case 5:
        image_xscale = 1.083;
        image_yscale = 1.292;
        break;
    case 6:
        image_xscale = 0.5;
        image_yscale = 1.5;
        break;
    case 7:
        image_xscale = 0.75;
        image_yscale = 1.25;
        break;
    case 8:
        image_xscale = 1;
        image_yscale = 1;
        break;
}

if (timer >= 20)
{
    image_yscale += 0.014285714285714285;
    y -= (2 + ((timer - 20) / 6));
    image_alpha -= 0.05;
}
