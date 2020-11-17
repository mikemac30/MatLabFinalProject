function [robo_obj] = spiralMove(robo_obj)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
i = 1;
    while(robo_obj.away)
        
        
        robo_obj = forwardStep(robo_obj,0.01*i);
        robo_obj = turnStep(robo_obj,6);
        i = i + 1;
    end
    %keep spiraling until we hit a wall
    

end
