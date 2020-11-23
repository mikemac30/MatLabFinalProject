function robo_obj = forwardRandom(robo_obj)
%forwardRandom This function moves forward in a random direction
%   Moves the robot forward in a random direction with direction = 1, and
%   random steps between 100 and 300
if(robo_obj.away)
    randDir = round(rand(1) * 360);

    randSteps = randi([100 300]);

    robo_obj = turnStep(robo_obj, randDir);%random turn

    robo_obj = forwardMove(robo_obj, 1, randSteps); % move forward 
end
end

