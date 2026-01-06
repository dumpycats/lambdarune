uniTime = shader_get_uniform(shader_Distort, "time");
uniTexel = shader_get_uniform(shader_Distort, "texel");
image_xscale = 2;
image_yscale = 2;
currenttimefroze = current_time;
shaking = false;
breaking = false;
breakingtimer = -1;
breakingpercent = 0;
pos_bx = 340;
pos_by = 240;
randomize();
randomx = 0;
randomy = 0;
reattach = false;
reattachtimer = -1;
pos_rx = 680;
curvelinear = animcurve_get_channel(Curve, "acLinear");
curveease = animcurve_get_channel(Curve, "acEase");
curveslower = animcurve_get_channel(Curve, "acSlower");
curvefaster = animcurve_get_channel(Curve, "acFaster");
percent1 = 0;
alpha = 1;
fade_up = 0;
audio_frame = 0;
frame_accumulator = 0;
frequency_data = [];
current_frame = 0;
var file = file_text_open_read(get_lang_string("gml_Object_obj_maximike_background_Create_0_0"));
frequency_data = [];

while (!file_text_eof(file))
{
    var line = file_text_readln(file);
    var values = string_split(line, get_lang_string("gml_Object_obj_maximike_background_Create_0_1"));
    var row = [];
    
    for (var i = 0; i < array_length(values); i++)
        array_push(row, real(values[i]));
    
    array_push(frequency_data, row);
}

file_text_close(file);
