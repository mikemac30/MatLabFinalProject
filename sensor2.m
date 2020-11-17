function [robo_obj] = sensor2(robo_obj, x2, y2)
%sensor2 Summary of this function goes here
%   Detailed explanation goes here
dTop = 90-y2
dRight = 90-x2

dBottom = 90+y2
dLeft = 90+x2

if(dTop <= 0 || dBottom <= 0 || dLeft <=0 || dRight <= 0)
    robo_obj.away = false;
    fprintf("Reached Limit!!!!");
else
    robo_obj.away = true;
end
end

