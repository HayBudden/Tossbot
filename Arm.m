% MATLAB controller for Webots
% File:          Arm.m
% Date: 13.12.2020
% Description: Basic arm control
% Author: Hanke/Bělohlávek
% Modifications:


TIME_STEP = 64;
base = wb_robot_get_device('base');
uarm = wb_robot_get_device('upperarm');
farm = wb_robot_get_device('forearm');
wrist = wb_robot_get_device('wrist');
rotwrist = wb_robot_get_device('rotational_wrist');
lgrip = wb_robot_get_device('left_gripper');
rgrip = wb_robot_get_device('right_gripper');
basesen = wb_robot_get_device('base_sensor');
uarmsen = wb_robot_get_device('upperarm_sensor');
farmsen = wb_robot_get_device('forearm_sensor');

wb_motor_set_position(base, inf);
wb_motor_set_position(uarm, inf);
wb_motor_set_position(farm, inf);
wb_motor_set_position(wrist, inf);
wb_motor_set_position(rotwrist, inf);
wb_motor_set_position(lgrip, inf);
wb_motor_set_position(rgrip, inf);

wb_motor_set_velocity(base,0);
wb_motor_set_velocity(uarm,0);
wb_motor_set_velocity(farm,0);
wb_motor_set_velocity(wrist,0);
wb_motor_set_velocity(rotwrist,0);
wb_motor_set_velocity(lgrip,0);
wb_motor_set_velocity(rgrip,0);

step = 0;

pos = [4 0;
       2.5 0;
       2 -1;
       3 -1.5;
       3 1;
       1 2;
       1.75 -2.5;
       3.25 -0.5;
       1.25 0.5;
       0.25 3;
       0.5 -1.5;
       1.25 -0.75;
       2.5 2;
       1.6 1.7;
       2.2 0.5;
       0.25 -3;
       0.75 1;
       1.75 -1.5;
       1 0;
       2.5 -2]
wb_position_sensor_enable(basesen,TIME_STEP);
wb_position_sensor_enable(uarmsen,TIME_STEP);
wb_position_sensor_enable(farmsen,TIME_STEP);


target1 = 10
target2 = randi([1 10]);
target3 = randi([1 10]);

stop = 0;
grip = 0;
for i = 1:6
    stepr(i) = 0;
end
%------------------------------------------------------
while wb_robot_step(TIME_STEP) ~= -1
%------------------------------------------------------
step = step + 1;
if step == 1
    wb_motor_set_velocity(base,-0.75);
    wb_motor_set_velocity(rotwrist,1.1);
end
if step == 4
    wb_motor_set_velocity(base,0);
    wb_motor_set_velocity(rotwrist,0); 
end

        stepr(1) = stepr(1) + 1;
        %první sebrání 
        if stepr(1) == 1
        wb_motor_set_velocity(uarm,1);
        wb_motor_set_velocity(farm,1);
        wb_motor_set_velocity(wrist,-1);
        wb_motor_set_velocity(lgrip,-1);
        wb_motor_set_velocity(rgrip,1);
        end
        if stepr(1) == 19
            wb_motor_set_velocity(uarm,0);
        end
        if stepr(1) == 20
            wb_motor_set_velocity(lgrip,0);
            wb_motor_set_velocity(rgrip,0);
        end
        if stepr(1) == 25
            wb_motor_set_velocity(wrist,0);
        end
        if stepr(1) == 34
            wb_motor_set_velocity(farm,0);
        end
        if stepr(1) == 36
            wb_motor_set_velocity(lgrip,1);
            wb_motor_set_velocity(rgrip,-1);
        end
        if stepr(1) == 50
            wb_motor_set_velocity(lgrip,0);
            wb_motor_set_velocity(rgrip,0);
        end
        if step == 55
            wb_motor_set_velocity(wrist,-1);
        end
        if step == 59
            wb_motor_set_velocity(wrist,0);
        end
              
        if stepr(1)== 70
            run = 2;
        end

        stepr(2) = stepr(2) + 1;
        %první hod
        baserot = aimbase(pos, target1);
        if stepr(2) == 1
            wb_motor_set_velocity(base,baserot);
        end
        if stepr(2) == 46
            wb_motor_set_velocity(base,0);
            [speed,grip] = fire(pos,target1);
        end 
        if stepr(2) == 50
            wb_motor_set_velocity(uarm,speed);
        end
        if stepr(2) == (50 + grip)
            wb_motor_set_velocity(lgrip,-2);
            wb_motor_set_velocity(rgrip,2);
        end
        if stepr(2) == (50 + grip + 1)
            wb_motor_set_velocity(uarm,0);
            wb_motor_set_velocity(lgrip,0);
            wb_motor_set_velocity(rgrip,0);
        end
        if stepr(2) == 60
            wb_motor_set_velocity(uarm,speed*(-1)/8);
            wb_motor_set_velocity(base,baserot*(-1));
            wb_motor_set_velocity(lgrip,2);
            wb_motor_set_velocity(rgrip,-2);
        end
        if stepr(2) == 61
            wb_motor_set_velocity(lgrip,0);
            wb_motor_set_velocity(rgrip,0);
        end
        if stepr(2) == (60 + 8 * (grip + 1))
           wb_motor_set_velocity(uarm,0); 
        end
        if stepr(2) == 105
            wb_motor_set_velocity(base,0);
        end
        if stepr(2) == 106
            run = 3;
        end


end
    

end
