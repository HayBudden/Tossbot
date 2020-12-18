function [speed] = throw(pos)
     
x = pos(1);
y = pos(2);
distance = sqrt(x^2 + y^2);

%formula for calculation throw speed - from premeasured throws
speed = -(1.622*distance+4.203)

end
