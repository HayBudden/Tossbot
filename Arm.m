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

while wb_robot_step(TIME_STEP) ~= -1

step = step + 1;
  if (1<step) && (step<4)
  wb_motor_set_velocity(base,-1);
  else
  wb_motor_set_velocity(base,0);
  end
  if (1<step) && (step<34)
  wb_motor_set_velocity(farm,1);
  else
  wb_motor_set_velocity(farm,0);
  end

  if (1<step) && (step<25)
  wb_motor_set_velocity(wrist,-1);
  else
  wb_motor_set_velocity(wrist,0);
  end
  if step == 1
  wb_motor_set_velocity(lgrip,-1);
  wb_motor_set_velocity(rgrip,1);
  end
  if step == 20
  wb_motor_set_velocity(lgrip,0);
  wb_motor_set_velocity(rgrip,0);
  end
  if step == 36
  wb_motor_set_velocity(lgrip,1);
  wb_motor_set_velocity(rgrip,-1);
  end
  if step == 53
  wb_motor_set_velocity(lgrip,0);
  wb_motor_set_velocity(rgrip,0);
  end
  if step == 1
  wb_motor_set_velocity(uarm,1);
  end
  if step == 20
  wb_motor_set_velocity(uarm,0);
  end
  if step == 70
  wb_motor_set_velocity(uarm,-10);
  end
  if step == 77
  wb_motor_set_velocity(uarm,0);
  end
  if step == 76
  wb_motor_set_velocity(lgrip,-2);
  wb_motor_set_velocity(rgrip,2); 
  end
end