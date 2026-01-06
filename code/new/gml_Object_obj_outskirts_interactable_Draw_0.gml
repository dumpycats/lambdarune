var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
draw_self();
draw_set_font(fDeterminationMW);
var text = get_lang_string("gml_Object_obj_outskirts_interactable_Draw_0_0") + string(value);
var text2 = get_lang_string("gml_Object_obj_outskirts_interactable_Draw_0_1") + string(destroyvalue);
