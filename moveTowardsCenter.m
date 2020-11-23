function [robo_obj] = moveTowardsCenter(robo_obj, requiredDist)
%moveTowardsCenter moves robot toward center
%   moves robot toward center until specified distance from center is
%   reached
    dist = 100;%initialize distance with 100 so the loop starts
    
    robo_obj.heading = atand(robo_obj.y / robo_obj.x);%calculate angle to be facing the center
    
    %fix angle if it is a positive x value
    if(robo_obj.x > 0)
        robo_obj.heading = robo_obj.heading -180;
    end
    %move towards center and calculate distance each step
    while dist > requiredDist && robo_obj.away
        robo_obj = forwardStep(robo_obj, 2);
        dist = sqrt(robo_obj.x^2 + robo_obj.y^2);
    end

end