function [robo_obj] = moveTowardsRandCorner(robo_obj, requiredDist)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    dist = 100; 
    vec = [-1 1];
    corner_pos = [vec(randi([1 2])) vec(randi([1 2]))];
    corner_pos = robo_obj.room_size .* corner_pos;
    robo_obj.heading = atand(corner_pos(2)-robo_obj.y / corner_pos(1) - robo_obj.x);
    
    fprintf("Moving towards (%f, %f) ", corner_pos);
    while dist > requiredDist
        dist = sqrt((robo_obj.x-corner_pos(1))^2  + (robo_obj.y-corner_pos(2))^2);
        robo_obj = forwardStep(robo_obj, 2);
    end
end

