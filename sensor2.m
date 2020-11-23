function [robo_obj] = sensor2(robo_obj, x2, y2)
%sensor2 check position to check if it is within bounds
%   check if x and y cordinate is with room limits

lim = robo_obj.room_size(1) - robo_obj.room_limit(1);%boundry size

%------The distances from each boundry---------
dTop = lim-y2;
dRight = lim-x2;
dBottom = lim+y2;
dLeft = lim+x2;

%threshold between boundry
THRESHOLD = 0.1;

%check if each distance is less than threshold
if(dTop <= THRESHOLD || dBottom <= THRESHOLD || dLeft <=THRESHOLD || dRight <= THRESHOLD)
    robo_obj.away = false;%the robot is going to hit something at these points
else
    robo_obj.away = true;%the robot is not going to hit something at these points
end
end

