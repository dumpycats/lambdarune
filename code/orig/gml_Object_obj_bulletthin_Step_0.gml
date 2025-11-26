timer++;

if (timer > 1)
    x -= 27;

if (x < 0)
    instance_destroy(self);
