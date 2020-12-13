function speed = aimbase(pos,target)
x = pos(target,1);
y = pos(target,2);
invert = 1;
if y < 0
    invert = -1;
end
angle = atand(y/x);
speed = angle/45;
speed = speed * invert;
end