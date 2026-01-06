if (!variable_instance_exists(id, "buyselltalkexit"))
    buyselltalkexit = 1;

if (global.shopmainmenu)
    global.buyitems = 1;

if (global.shopmainmenu)
{
    if (global.soulmove)
    {
        if (keyboard_check_pressed(vk_down))
            buyselltalkexit += 1;
    }
    
    if (global.soulmove)
    {
        if (keyboard_check_pressed(vk_up))
            buyselltalkexit -= 1;
    }
    
    if (buyselltalkexit > 4)
        buyselltalkexit = 1;
    else if (buyselltalkexit < 1)
        buyselltalkexit = 4;
    
    switch (buyselltalkexit)
    {
        case 1:
            y = 278;
            break;
        case 2:
            y = 318;
            break;
        case 3:
            y = 358;
            break;
        case 4:
            y = 398;
            break;
    }
    
    if (buyselltalkexit == 4)
    {
        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")))
        {
            if (global.shopexperiencedone)
            {
                reset_dialogue();
                global.shopdialogue = 4;
            }
            else
            {
                reset_dialogue();
                global.shopdialogue = 2;
            }
            
            global.shopend = true;
        }
    }
    
    if (buyselltalkexit == 3)
    {
        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")))
        {
            if (global.shopbought == false)
            {
                reset_dialogue();
                global.shopdialogue = 6;
            }
            
            if (global.shopbought == true)
            {
                global.shoptalkmenu = true;
                oSOUL.x = 38;
                reset_dialogue();
                global.shopdialogue = 15;
                global.shopmainmenu = false;
            }
        }
    }
    
    if (buyselltalkexit == 2)
    {
        if (!(global.shopdialogue == 7) && !global.shopexperiencedone)
        {
            if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")))
            {
                if (global.shadowwomanmonologue == false)
                {
                    global.soulmove = false;
                    reset_dialogue();
                    global.shopdialogue = 7;
                }
            }
        }
        
        if (!(global.shopdialogue == 7) && global.shopexperiencedone)
        {
            if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")))
            {
                reset_dialogue();
                global.shopdialogue = 105;
            }
        }
    }
    
    if (global.shopdialogue == 8)
        global.soulmove = true;
    
    if (global.shopend)
        instance_destroy(self);
    
    if (buyselltalkexit == 1)
    {
        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")))
        {
            reset_dialogue();
            global.shopdialogue = 10;
            global.soulmove = true;
            global.shopbuymenu = true;
            oShopMenu.image_index = 1;
            oSOUL.x = 38;
            instance_create_depth(520, 310, 30, oShopMenu2);
            timer1 = 0;
            global.texttalk = true;
            global.shopmainmenu = false;
        }
    }
}

if (global.shopbuymenu)
{
    if (global.soulmove)
    {
        if (keyboard_check_pressed(vk_down) && !keyboard_check_pressed(vk_up))
            global.buyitems += 1;
    }
    
    if (global.soulmove)
    {
        if (keyboard_check_pressed(vk_up) || (keyboard_check_pressed(vk_up) && keyboard_check_pressed(vk_down)))
            global.buyitems -= 1;
    }
    
    if (global.buyitems > 5)
        global.buyitems = 1;
    else if (global.buyitems < 1)
        global.buyitems = 5;
    
    switch (global.buyitems)
    {
        case 1:
            y = 278;
            break;
        case 2:
            y = 318;
            break;
        case 3:
            y = 358;
            break;
        case 4:
            y = 398;
            break;
        case 5:
            y = 438;
            break;
    }
    
    if (global.buyitems == 5)
    {
        timer2 = 0;
        timer1 += 1;
        
        if (timer1 > 2)
        {
            if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")))
            {
                reset_dialogue();
                
                if (global.shopbought && !global.shopexperiencedone)
                    global.shopdialogue = 9;
                else if (!global.shopexperiencedone)
                    global.shopdialogue = 11;
                else
                    global.shopdialogue = 127;
                
                global.soulmove = true;
                oShopMenu.image_index = 0;
                oSOUL.x = 458;
                global.buyitems = 1;
                instance_destroy(oShopMenu2);
                global.shopmainmenu = true;
                global.shopbuymenu = false;
                oSOUL.y = 1000;
            }
        }
    }
    
    if (global.soulmove)
    {
        timer2 += 1;
        
        if (timer2 > 2)
        {
            if (global.buyitems == 1 || global.buyitems == 2 || global.buyitems == 3 || global.buyitems == 4)
            {
                if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")))
                {
                    global.itemhover = true;
                    global.soulmove = false;
                    instance_create_depth(458, 362, -30, oSOULyesno);
                }
            }
        }
    }
    
    if (global.itemhover)
        image_alpha = 0;
    else
        image_alpha = 1;
}

if (global.shoptalkmenu && !global.shopmainmenu && !global.shopbuymenu)
{
    if (global.soulmove)
    {
        if (keyboard_check_pressed(vk_down))
            talkoptions += 1;
    }
    
    if (global.soulmove)
    {
        if (keyboard_check_pressed(vk_up))
            talkoptions -= 1;
    }
    
    if (talkoptions > 5)
        talkoptions = 1;
    else if (talkoptions < 1)
        talkoptions = 5;
    
    switch (talkoptions)
    {
        case 1:
            y = 278;
            break;
        case 2:
            y = 318;
            break;
        case 3:
            y = 358;
            break;
        case 4:
            y = 398;
            break;
        case 5:
            y = 438;
            break;
    }
    
    if (talkoptions == 1)
    {
        timer3 += 1;
        
        if (timer3 > 2)
        {
            if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")))
            {
                global.soulmove = false;
                image_alpha = 0;
                
                if (!global.midnightcrewoption)
                {
                    reset_dialogue();
                    global.shopdialogue = 16;
                }
                else
                {
                    reset_dialogue();
                    global.shopdialogue = 24;
                }
                
                global.shadowtalking = true;
                oShopMenu.image_index = 2;
                timer3 = 0;
            }
        }
    }
    
    if (talkoptions == 2)
    {
        timer3 += 1;
        
        if (timer3 > 2)
        {
            if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")))
            {
                global.soulmove = false;
                image_alpha = 0;
                
                if (!global.revengeoption)
                {
                    reset_dialogue();
                    global.shopdialogue = 34;
                }
                else
                {
                    reset_dialogue();
                    global.shopdialogue = 51;
                }
                
                global.shadowtalking = true;
                oShopMenu.image_index = 2;
                timer3 = 0;
            }
        }
    }
    
    if (talkoptions == 3)
    {
        timer3 += 1;
        
        if (timer3 > 2)
        {
            if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")))
            {
                global.soulmove = false;
                image_alpha = 0;
                reset_dialogue();
                global.shopdialogue = 70;
                global.shadowtalking = true;
                oShopMenu.image_index = 2;
                timer3 = 0;
            }
        }
    }
    
    if (talkoptions == 4)
    {
        timer3 += 1;
        
        if (timer3 > 2)
        {
            if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")))
            {
                global.soulmove = false;
                image_alpha = 0;
                
                if (!global.cathodecrewoption)
                {
                    reset_dialogue();
                    global.shopdialogue = 90;
                }
                else
                {
                    reset_dialogue();
                    global.shopdialogue = 106;
                }
                
                global.shadowtalking = true;
                oShopMenu.image_index = 2;
                timer3 = 0;
            }
        }
    }
    
    if (global.shopdialogue == 23)
    {
        reset_dialogue();
        global.shopdialogue = 15;
    }
    
    if (global.shopdialogue == 32 || global.shopdialogue == 50 || global.shopdialogue == 65 || global.shopdialogue == 88 || global.shopdialogue == 104 || global.shopdialogue == 126)
    {
        if (global.midnightcrewoptiondone && global.revengeoptiondone)
        {
            reset_dialogue();
            global.shopdialogue = 66;
        }
        else
        {
            reset_dialogue();
            global.shopdialogue = 33;
        }
    }
    
    if (talkoptions == 5)
    {
        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")))
        {
            global.shopbuymenu = false;
            global.shopmainmenu = true;
            global.shoptalkmenu = false;
            oSOUL.x = 458;
            
            if (!global.shopexperiencedone)
            {
                reset_dialogue();
                global.shopdialogue = 9;
            }
            else
            {
                reset_dialogue();
                global.shopdialogue = 127;
            }
            
            talkoptions = 1;
            timer3 = 0;
            oSOUL.y = 1000;
        }
    }
}
