generaltimer++;
y += 1;
windoffset += extrawind;
x = xx + xoffset + windoffset;
image_angle = angle + angleoffset;
var offsetvalue = sin((generaltimer / 100) * (2 * pi)) * 4;
var offsetvalueslower = sin(((generaltimer - 24) / 100) * (2 * pi)) * 4;
xoffset = offsetvalue * -1;
angleoffset = offsetvalue * 8;

if (y > 700)
    instance_destroy();
