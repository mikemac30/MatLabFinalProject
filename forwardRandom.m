function robo_obj = forwardRandom(robo_obj)
%forwardRandom This function moves forward in a random direction
%   Moves the robot forward in a random direction with direction = 1, and
%   random steps between 100 and 300
if(robo_obj.away)
    
    randDir = rand(1) * 360;%pick a random angle between 0 and 360

    randSteps = randi([100 300]);%pick random number of steps between 100 and 300

    robo_obj = turnStep(robo_obj, randDir);%turn the randDir

    robo_obj = forwardMove(robo_obj, 1, randSteps); % move forward the randSteps
end
end

