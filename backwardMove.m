function [robo_obj] = backwardMove(robo_obj, dist, numSteps)
% initialize step counter
i=0;
while i<=numSteps
    % take one step at the time
    robo_obj = forwardStep(robo_obj,-dist); 
    %fprintf("Moving Back!!\n");
    i = i + 1;
end
robo_obj = sensor(robo_obj);
end

