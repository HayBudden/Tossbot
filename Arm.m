% MATLAB controller for Webots
% File: Arm.m
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
node = wb_supervisor_node_get_from_def('target');
position = wb_supervisor_node_get_position(node);


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
phase = 1;
grip = 3;

pos = [position(1) position(3)]

if (pos(1)^2+pos(2)^2) < 1
  wb_console_print('Error: Distance lesser than 1', WB_STDOUT) 
  TIME_STEP = -1
end
if (pos(1)^2+pos(2)^2) > 4
  wb_console_print('Error: Distance greater than 4', WB_STDOUT) 
  TIME_STEP = -1
end

for i = 1:6
    stepr(i) = 0;
end

baserot = rotspeed(pos);

%------------------------------------
while wb_robot_step(TIME_STEP) ~= -1
%------------------------------------

step = step + 1;
if step == 1
    wb_motor_set_velocity(rotwrist,1.1);
end
if step == 4
    wb_motor_set_velocity(rotwrist,0); 
end

switch phase

%pick up
  case 1
        stepr(1) = stepr(1) + 1;

        if stepr(1) == 1
        wb_motor_set_velocity(uarm,1);
        wb_motor_set_velocity(farm,1);
        wb_motor_set_velocity(wrist,-1);
        wb_motor_set_velocity(lgrip,-1);
        wb_motor_set_velocity(rgrip,1);
        end
        if stepr(1) ==18
            wb_motor_set_velocity(uarm,0);
        end
        if stepr(1) == 20
            wb_motor_set_velocity(lgrip,0);
            wb_motor_set_velocity(rgrip,0);
        end
        if stepr(1) == 25
            wb_motor_set_velocity(wrist,0);
        end
        if stepr(1) == 35
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
            phase = 2;
        end
        
%throw        
  case 2
        stepr(2) = stepr(2) + 1;       
        if stepr(2) == 1
            wb_motor_set_velocity(base,baserot);
        end
        if stepr(2) == 45
            wb_motor_set_velocity(base,0);
            [speed] = throw(pos);
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
        end

end
end