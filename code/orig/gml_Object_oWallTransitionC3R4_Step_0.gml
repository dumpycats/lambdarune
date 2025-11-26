if (place_meeting(x - 10, y, oKrisPlayerC3))
    endtimer = true;

if (endtimer)
    timer++;

if (timer == 1)
    instance_create_depth(oKrisPlayerC3.x, oKrisPlayerC3.y, -60, oBlackScreen1Room4);
