if (sprite_index == sMScreen_Appear)
    sprite_index = sMScreen_TurnOn;
else if (sprite_index == sMScreen_TurnOn)
    sprite_index = sMScreen_Announcement;
else if (sprite_index == sMScreen_Announcement)
    sprite_index = sMScreen_AnnouncementMiddle;
else if (sprite_index == sMScreen_AnnouncementMiddle)
    sprite_index = sMScreen_AnnouncementEnd;
else if (sprite_index == sMScreen_AnnouncementEnd)
    sprite_index = sMScreen_Mike;
else if (sprite_index == sMScreen_Mike)
    sprite_index = sMScreen_Mike2;
else if (sprite_index == sMScreen_Mike2)
    sprite_index = sMScreen_Mike3;

if (global.dialogue == 28 && !(sprite_index == sMScreen_MikeMoveRight))
{
    image_index = 0;
    sprite_index = sMScreen_MikeMoveRight;
}
else if (global.dialogue == 28 && sprite_index == sMScreen_MikeMoveRight)
{
    sprite_index = sMScreen_Mike4Still;
    image_index = 0;
}

if (global.dialogue == 39 && !(sprite_index == sMScreen_MikeMoveLeft))
{
    image_index = 0;
    sprite_index = sMScreen_MikeMoveLeft;
}
else if (global.dialogue == 39 && sprite_index == sMScreen_MikeMoveLeft)
{
    sprite_index = sMScreen_Mike3;
}

if (global.dialogue == 45 && !(sprite_index == sMScreen_MikeLeave))
{
    image_index = 0;
    sprite_index = sMScreen_MikeLeave;
}
else if (global.dialogue == 45 && sprite_index == sMScreen_MikeLeave)
{
    global.aftermike = true;
    instance_destroy();
}
