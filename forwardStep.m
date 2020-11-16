function obj = forwardStep(obj,distance)
% update elapsed time display
set(obj.time,'String',['Elapsed time: ' num2str(toc,'%6.1f') ' s'])
% determine new position
x2 = obj.x + distance*cosd(obj.heading);
y2 = obj.y + distance*sind(obj.heading);
% check sensor2 to make sure the robot doesn't move beyond limit
obj = sensor2(obj,x2,y2); % UNCOMMENT AFTER CREATING SENSOR2!
if obj.away
    if obj.pen_on_paper % draw if true
        % update line property with new position
        addpoints(obj.line,x2,y2)
        % draw new line segment and move arrow
        set(obj.arrow,'X',[obj.pos(1)+(obj.x+abs(obj.xlim(1)))*obj.pos(3)/diff(obj.xlim)...
                           obj.pos(1)+(x2   +abs(obj.xlim(1)))*obj.pos(3)/diff(obj.xlim)],...
                      'Y',[obj.pos(2)+(obj.y+abs(obj.ylim(1)))*obj.pos(4)/diff(obj.ylim)...
                           obj.pos(2)+(y2   +abs(obj.ylim(1)))*obj.pos(4)/diff(obj.ylim)]);
        set(obj.image,'XData',[((x2-10)+(1*cosd(obj.heading)-0.15*sind(obj.heading))) ...
                               ((x2+10)+(1*cosd(obj.heading)-0.15*sind(obj.heading)))],...
                      'YData',[((y2- 9)+(1*sind(obj.heading)+0.15*cosd(obj.heading))) ...
                               ((y2+ 9)+(1*sind(obj.heading)+0.15*cosd(obj.heading)))],...
                      'CData',imrotate(obj.robot_img,-obj.heading,'crop'),...
                      'AlphaData',imrotate(obj.alphachannel,-obj.heading,'crop'))
        drawnow
    end
    % update location of the object
    obj.x = x2;
    obj.y = y2;
end
end
