CRT = global.GameState.CRT;
GameState = global.GameState;
alpha = 1.1;
generaltimer = -1;
depth = -1000;
surface_resize(application_surface, 640, 480);
windowheight = display_get_height();
var _cam_w = camera_get_view_width(view_camera[0]);
var _cam_h = camera_get_view_height(view_camera[0]);
x = camera_get_view_x(view_camera[0]) + (_cam_w / 2);
y = camera_get_view_y(view_camera[0]) + (_cam_h / 2);
Zoom = 2;
ZoomTarget = 2;
Ratio = _cam_h / _cam_w;

if (window_get_fullscreen())
    surface_resize(application_surface, (windowheight / 3) * 4, windowheight);
else if (windowheight > 1048)
    surface_resize(application_surface, 1280, 960);
else
    surface_resize(application_surface, 640, 480);

var guide_layer_id = layer_get_id(lang("oCRT_Create_0_0"));

if (guide_layer_id != -1)
    layer_set_visible(guide_layer_id, false);

UCRTParams = shader_get_uniform(SHD_CRT, "params");

if (UCRTParams == -1)
    show_error(lang("oCRT_Create_0_1"), true);

CRT = GameState.CRT;
application_surface_draw_enable(false);
GUIDrag = -4;

function MoveSlider()
{
    if (instance_exists(GUIDrag))
        return GUIDrag.Drag(device_mouse_x_to_gui(0));
    
    GUIDrag = instance_position(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), GUI_GraphicalUserInterface);
}

function ClickToggle()
{
    var _toggle = instance_position(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), GUI_GraphicalUserInterface);
    
    if (_toggle == -4)
        exit;
    
    return _toggle.Click();
}
