function [robo_obj] = moveTowardsCenter(robo_obj, requiredDist)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    dist = 100;
    robo_obj.heading = atand(robo_obj.y / robo_obj.x);
    if(robo_obj.x > 0)
        robo_obj.heading = robo_obj.heading -180
    end
    fprintf("Moving towards the center!");
    while dist > requiredDist && robo_obj.away
        dist = sqrt(robo_obj.x^2 + robo_obj.y^2);
        robo_obj = forwardStep(robo_obj, 2);
    end

end