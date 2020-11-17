function [robo_obj] = spiralMoveOLD(robo_obj)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    cx = robo_obj.x;
    cy = robo_obj.y;

    
    %keep spiraling until we hit a wall
    while robo_obj.away
        t = toc;
        x2 = (25*t+cx)*cos(25*t);
        y2 = (25*t+cy)*sin(25*t);

        if robo_obj.pen_on_paper % draw if true

            % update line property with new position
            addpoints(robo_obj.line,x2,y2)
            % draw new line segment and move arrow
            set(robo_obj.arrow,'X',[robo_obj.pos(1)+(robo_obj.x+abs(robo_obj.xlim(1)))*robo_obj.pos(3)/diff(robo_obj.xlim)...
                               robo_obj.pos(1)+(x2   +abs(robo_obj.xlim(1)))*robo_obj.pos(3)/diff(robo_obj.xlim)],...
                          'Y',[robo_obj.pos(2)+(robo_obj.y+abs(robo_obj.ylim(1)))*robo_obj.pos(4)/diff(robo_obj.ylim)...
                               robo_obj.pos(2)+(y2   +abs(robo_obj.ylim(1)))*robo_obj.pos(4)/diff(robo_obj.ylim)]);
            set(robo_obj.image,'XData',[((x2-10)+(1*cosd(robo_obj.heading)-0.15*sind(robo_obj.heading))) ...
                                   ((x2+10)+(1*cosd(robo_obj.heading)-0.15*sind(robo_obj.heading)))],...
                          'YData',[((y2- 9)+(1*sind(robo_obj.heading)+0.15*cosd(robo_obj.heading))) ...
                                   ((y2+ 9)+(1*sind(robo_obj.heading)+0.15*cosd(robo_obj.heading)))],...
                          'CData',imrotate(robo_obj.robot_img,-robo_obj.heading,'crop'),...
                          'AlphaData',imrotate(robo_obj.alphachannel,-robo_obj.heading,'crop'))
            drawnow
        end

        robo_obj.x = x2;
        robo_obj.y = y2;
        robo_obj = sensor(robo_obj);
    end
end


