var spr_w = sprite_width;
var spr_h = sprite_height;
var wall = instance_create_layer(x, y, layer, oWall);
wall.image_xscale = spr_w / sprite_get_width(wall.sprite_index);
wall.image_yscale = spr_h / (sprite_get_height(wall.sprite_index) * 3);
wall.y += spr_h / 3;
wall.image_alpha = 0;
