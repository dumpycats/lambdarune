if (instance_exists(obj_kris_c3))
{
    if (place_meeting(x, y + 2, obj_kris_c3))
        roomchange = true;
    
    if (place_meeting(x, y - 2, obj_kris_c3))
        roomchange = true;
    
    if (place_meeting(x - 2, y + 2, obj_kris_c3))
        roomchange = true;
    
    if (place_meeting(x + 2, y + 2, obj_kris_c3))
        roomchange = true;
    
    if (place_meeting(x - 2, y, obj_kris_c3))
        roomchange = true;
    
    if (place_meeting(x + 2, y, obj_kris_c3))
        roomchange = true;
    
    if (place_meeting(x - 2, y - 2, obj_kris_c3))
        roomchange = true;
    
    if (place_meeting(x + 2, y - 2, obj_kris_c3))
        roomchange = true;
}
