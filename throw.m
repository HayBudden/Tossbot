function [speed] = throw(pos)
%range - premeasured motor velocities for specific ranges = [distance release speed]

range = [1 5.9;
         1.25 6.35;
         1.5 6.7;
         1.75 7.05;
         2 7.4;
         2.25 7.8;
         2.5 8.15;
         2.75 8.5;
         3 8.9;
         3.25 9.4;
         3.5 9.9;
         3.75 10.4;
         4 10.9];
         
x = pos(1);
y = pos(2);
distance = sqrt(x^2 + y^2);

%formula for calculation throw speed - from premeasured throws in range
speed = -(1.622*distance+4.203)

end