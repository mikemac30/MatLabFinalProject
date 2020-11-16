function [robo_obj] = backwardMove(robo_obj, dist, numSteps)
% initialize step counter
i=0;
while i<=numSteps
    % take one step at the time
    robo_obj = backwardStep(robo_obj,dist); 
    %fprintf("Moving Back!!\n");
    i = i + 1;
end
end

