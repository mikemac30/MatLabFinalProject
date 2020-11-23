function [robo_obj] = sensor(robo_obj)
%sensor checks within the bounds
%   sensor checks if the robot is within the bounds
robo_obj = sensor2(robo_obj, robo_obj.x, robo_obj.y);%check the current position values
end

