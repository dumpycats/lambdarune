timer++;
image_xscale = 2;
image_yscale = scale * (obj_rudebuster.image_yscale / 2);
image_alpha = alpha * obj_rudebuster.image_alpha;
scale -= 0.125;
alpha -= 0.05;

if (image_alpha <= 0)
    instance_destroy();
