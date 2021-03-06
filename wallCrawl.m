function [robo_obj] = wallCrawl(robo_obj)
%WALLCRAWL move parallel to the closest wall
%   Move the robo_obj parallel to the closest wall

lim = robo_obj.room_size(1) - robo_obj.room_limit(1); %boundry size

%------The distances from each boundry---------
dTop = lim-robo_obj.y;
dRight = lim-robo_obj.x;
dBottom = lim+robo_obj.y;
dLeft = lim+robo_obj.x;

%find the closest boundry
min_d = min([dTop dBottom dLeft dRight]);

%adjust the angle of the robot based on the closest boundry
if(min_d == dTop)
    robo_obj.heading = 0;
elseif(min_d == dBottom)
    robo_obj.heading = 180 ;
elseif(min_d == dRight)
    robo_obj.heading = 90;
elseif(min_d == dLeft)
    robo_obj.heading = 270;
end

%move forward
robo_obj = forwardMove(robo_obj, 1, randi([25 100]));
end

