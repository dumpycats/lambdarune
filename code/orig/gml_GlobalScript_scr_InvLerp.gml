function CRTParameters() constructor
{
    var windowheight = display_get_height();
    var wheight;
    
    if (windowheight > 1048)
        wheight = 1;
    else
        wheight = 2;
    
    var displaydynamic = 1200 / (display_get_height() / wheight);
    Params = [window_get_width(), window_get_height(), 2.8333333333333335 / displaydynamic, -8, -3, 80, 60, 0.5, 1.5, 1];
    ShaderOn = true;
    
    function Set(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
    {
        Params = [arg0, arg1, clamp(arg2, 2, 6), clamp(arg3, -4, -16), clamp(arg4, -2, -4), clamp(arg5, 0, 240), clamp(arg6, 0, 180), clamp(arg7, 0.2, 2), clamp(arg8, 0.2, 2), arg9];
    }
    
    function SetResolution(arg0, arg1)
    {
        Params[UnknownEnum.Value_0] = arg0;
        Params[UnknownEnum.Value_1] = arg1;
    }
}

function GameStateCreate() constructor
{
    Name = "CRT Shader";
    Version = "0.0.0.1";
    CRT = new CRTParameters();
}

function InvLerp(arg0, arg1, arg2)
{
    if (arg0 == arg1)
        return 0;
    
    return (arg2 - arg0) / (arg1 - arg0);
}

function Log()
{
    var _msg = "LOG: ";
    
    for (var _i = 0; _i < argument_count; _i++)
    {
        var _arg = argument[_i];
        
        if (is_string(_arg))
            _msg += (_arg + " ");
        else
            _msg += (string(_arg) + " ");
    }
    
    show_debug_message(_msg);
}

enum UnknownEnum
{
    Value_0,
    Value_1
}
