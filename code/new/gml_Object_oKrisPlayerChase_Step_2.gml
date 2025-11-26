if (oKrisPlayerC3.sprite_index == sKrisWalkUp)
    sprite_index = sKrisWalkUpChase;

if (oKrisPlayerC3.sprite_index == sKrisWalkLeft)
    sprite_index = sKrisWalkLeftChase;

if (oKrisPlayerC3.sprite_index == sKrisWalkRight)
    sprite_index = sKrisWalkRightChase;

if (oKrisPlayerC3.sprite_index == sKrisWalkDown)
    sprite_index = sKrisWalkDownChase;

x = oKrisPlayerC3.x;
y = oKrisPlayerC3.y;
image_speed = oKrisPlayerC3.image_speed;
image_index = oKrisPlayerC3.image_index;
depth = oKrisPlayerC3.depth - 1;

if (room == rChapter3Room3)
{
    if (global.dialogue == 7)
    {
        image_alpha += 0.06666;
        
        if (image_alpha >= 0.8)
            image_alpha = 0.8;
    }
}

if (room == rChapter3Room4)
    image_alpha = 0.8;
