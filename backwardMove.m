function [robo_obj] = backwardMove(robo_obj, dist, numSteps)
% initialize step counter
i=0;
while i<=numSteps
    % take one step at the time backwards
    robo_obj = forwardStep(robo_obj,-dist);
    i = i + 1;
end
robo_obj = sensor(robo_obj);%check the sensor
end

