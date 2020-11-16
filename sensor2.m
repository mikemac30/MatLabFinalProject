function [robo_obj] = sensor2(robo_obj, x2, y2)
%sensor2 Summary of this function goes here
%   Detailed explanation goes here
THRESHOLD = 1;
dTop = 90-y2
dRight = 90-x2

dBottom = 90+y2
dLeft = 90+x2

if(dTop < THRESHOLD || dBottom < THRESHOLD || dLeft <THRESHOLD || dRight < THRESHOLD)
    robo_obj.away = false;
    fprintf("Reached Limit!!!!");
end
end

