% MATLAB controller for Webots
% File:          Arm.m
% Date: 9.12.2020
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
run = 1;

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

target1 = randi([1 20]);
target2 = randi([1 20]);
target3 = randi([1 20]);

while wb_robot_step(TIME_STEP) ~= -1

step = step + 1;

end
