if (!variable_instance_exists(id, translation_get_string("gml_Object_oSOULyesno_Step_0_0")))
    yesno = 1;

if (keyboard_check_pressed(vk_down))
    yesno += 1;

if (keyboard_check_pressed(vk_up))
    yesno -= 1;

x = 458;

if (yesno > 2)
    yesno = 1;
else if (yesno < 1)
    yesno = 2;

switch (yesno)
{
    case 1:
        y = 362;
        break;
    case 2:
        y = 392;
        break;
}

timer1 += 1;

if (timer1 > 1)
{
    if (global.itemhover && yesno == 2)
    {
        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")))
        {
            reset_dialogue();
            global.shopdialogue = 12;
            global.itemhover = false;
            global.soulmove = true;
            instance_destroy();
        }
    }
}

if (timer1 > 1)
{
    if ((global.itemhover && yesno == 1) && global.buyitems == 1)
    {
        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")))
        {
            if (global.money >= 200)
            {
                reset_dialogue();
                global.shopdialogue = 13;
                global.itemhover = false;
                global.soulmove = true;
                global.money -= 200;
                global.space -= 1;
                global.shopbought = true;
                audio_play_sound(snd_locker, 1, false);
                instance_destroy();
            }
        }
    }
}

if (timer1 > 1)
{
    if ((global.itemhover && yesno == 1) && global.buyitems == 2)
    {
        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")))
        {
            if (global.money >= 80)
            {
                reset_dialogue();
                global.shopdialogue = 13;
                global.itemhover = false;
                global.soulmove = true;
                global.money -= 80;
                global.space -= 1;
                global.shopbought = true;
                audio_play_sound(snd_locker, 1, false);
                instance_destroy();
            }
        }
    }
}

if (timer1 > 1)
{
    if ((global.itemhover && yesno == 1) && global.buyitems == 3)
    {
        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")))
        {
            if (global.money >= 100)
            {
                reset_dialogue();
                global.shopdialogue = 13;
                global.itemhover = false;
                global.soulmove = true;
                global.money -= 100;
                global.space -= 1;
                global.shopbought = true;
                audio_play_sound(snd_locker, 1, false);
                instance_destroy();
            }
        }
    }
}

if (timer1 > 1)
{
    if ((global.itemhover && yesno == 1) && global.buyitems == 4)
    {
        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")))
        {
            if (global.money >= 70)
            {
                reset_dialogue();
                global.shopdialogue = 13;
                global.itemhover = false;
                global.soulmove = true;
                global.money -= 70;
                global.space -= 1;
                global.shopbought = true;
                audio_play_sound(snd_locker, 1, false);
                instance_destroy();
            }
        }
    }
}

if (timer1 > 1)
{
    if (!(global.money >= 200))
    {
        if ((global.itemhover && yesno == 1) && global.buyitems == 1)
        {
            if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")))
            {
                reset_dialogue();
                global.shopdialogue = 14;
                global.itemhover = false;
                global.soulmove = true;
                instance_destroy();
            }
        }
    }
}

if (timer1 > 1)
{
    if (!(global.money >= 80))
    {
        if ((global.itemhover && yesno == 1) && global.buyitems == 2)
        {
            if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")))
            {
                reset_dialogue();
                global.shopdialogue = 14;
                global.itemhover = false;
                global.soulmove = true;
                instance_destroy();
            }
        }
    }
}

if (timer1 > 1)
{
    if (!(global.money >= 100))
    {
        if ((global.itemhover && yesno == 1) && global.buyitems == 3)
        {
            if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")))
            {
                reset_dialogue();
                global.shopdialogue = 14;
                global.itemhover = false;
                global.soulmove = true;
                instance_destroy();
            }
        }
    }
}

if (timer1 > 1)
{
    if (!(global.money >= 70))
    {
        if ((global.itemhover && yesno == 1) && global.buyitems == 4)
        {
            if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")))
            {
                reset_dialogue();
                global.shopdialogue = 14;
                global.itemhover = false;
                global.soulmove = true;
                instance_destroy();
            }
        }
    }
}
