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

while wb_robot_step(TIME_STEP) ~= -1

end