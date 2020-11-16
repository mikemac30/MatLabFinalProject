function obj = turnStep(obj,angle)
% change direction according to input angle
obj.heading = mod(obj.heading + angle,360);
end