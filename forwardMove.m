function obj = forwardMove(obj,distance,numSteps)
% initialize step counter
i=1;
% check sensor1 to make sure the robot is away before the loop
obj = sensor(obj); % UNCOMMENT AFTER CREATING SENSOR1!
% loop and stop when done or after hitting wall limit
while i<=numSteps && obj.away
    % take one step at the time
    obj = forwardStep(obj,distance); 
    i = i + 1;
end
end