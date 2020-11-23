function [robo_obj] = spiralMove(robo_obj)
%spiralMove moves the robot in a spiral
%   takes robo_obj as input and preforms spiral move
i = 0;%index
vec = [-1 1];
dir = vec(randi([1 2]));%pick 1 or zero randomly, used for flipping the direction of the spiral
    while(robo_obj.away)
        
        robo_obj = turnStep(robo_obj,20*dir);%make a small turn
        robo_obj = forwardStep(robo_obj,i);%make a small move forward
        i = i + 0.08;%add to amount the robot moves forward each time
    end
    %keep spiraling until we hit a wall
    

end
