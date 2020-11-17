% ROBOVAC.m
% Driver script to define and control the Robo Vacuum project
clear;clc;

% Create a figure handle to set up the room (DO NOT MODIFY!)
f1 = figure;
x0=100; y0=100;
width=500; height=500;
set(f1,'units','pixels','position',[x0,y0,width,height])
f1.Resize = 'off';

% Define size and wall limits (DO NOT MODIFY!)
room_size = 100;
room_limit = 10;

% Draw wall limits (DO NOT MODIFY!)
hold on
line([-room_size+room_limit -room_size+room_limit],...
     [-room_size+room_limit  room_size-room_limit],'Color','red')
line([room_size-room_limit room_size-room_limit],...
     [-room_size+room_limit  room_size-room_limit],'Color','red')
line([room_size-room_limit -room_size+room_limit],...
     [room_size-room_limit  room_size-room_limit],'Color','red')
line([-room_size+room_limit room_size-room_limit],...
     [-room_size+room_limit  -room_size+room_limit],'Color','red')
 hold off

 % Create an axis handle and complete room set up (DO NOT MODIFY!)
ax = gca;
ax.XTick = [];
ax.YTick = [];
ax.XLim = [-room_size room_size];
ax.YLim = [-room_size room_size];
ax.Box = 'on';

% Create the Robo Vacum object as a structure
robo_obj.x = 0;                     % current x position
robo_obj.y = 0;                     % current y position
robo_obj.heading = 0;               % current direction wrt +x axis
robo_obj.pen_on_paper = true;       % draw path if true
robo_obj.pen.color = 'blue';        % path color (DO NOT MODIFY!)
robo_obj.pen.width = 3;             % path width (DO NOT MODIFY!)
robo_obj.wait = 0.0001;             % path time step (DO NOT MODIFY!)
robo_obj.room_size = room_size;     % room size info (DO NOT MODIFY!)
robo_obj.room_limit = room_limit;   % room limits info (DO NOT MODIFY!)
robo_obj.away = true;               % away from limits if true 
robo_obj.xlim = xlim;               % x limit of axis handle (DO NOT MODIFY!)               
robo_obj.ylim = ylim;               % y limit of axis handle (DO NOT MODIFY!) 
robo_obj.pos = get(gca,'position'); % position of axis handle (DO NOT MODIFY!) 

% Add line, arrow and image properties to Robo Vac (DO NOT MODIFY!)
robo_obj.line = animatedline([0 0],[0 0],'Color',robo_obj.pen.color,...
                             'LineWidth',robo_obj.pen.width);
robo_obj.arrow = annotation('arrow',[robo_obj.pos(1)+(robo_obj.x+abs(robo_obj.xlim(1)))*robo_obj.pos(3)/diff(robo_obj.xlim)...
                                     robo_obj.pos(1)+(1+abs(robo_obj.xlim(1)))*robo_obj.pos(3)/diff(robo_obj.xlim)],...
                                    [robo_obj.pos(2)+(robo_obj.y+abs(robo_obj.ylim(1)))*robo_obj.pos(4)/diff(robo_obj.ylim)...
                                     robo_obj.pos(2)+(0+abs(robo_obj.ylim(1)))*robo_obj.pos(4)/diff(robo_obj.ylim)]);
[robo_obj.robot_img,robo_obj.map,robo_obj.alphachannel] = imread('vacuum.png');
robo_obj.image = image('XData',[robo_obj.x-10 robo_obj.x+10],...
                       'YData',[robo_obj.y-9 robo_obj.y+9],...
                       'CData',imrotate(robo_obj.robot_img,robo_obj.heading,'crop'),...
                       'AlphaData',imrotate(robo_obj.alphachannel,robo_obj.heading,'crop'));
              
                   
                   
                   
      
% *** SELECT THIS BLOCK AND UNCOMMENT (Ctrl+T) WHEN READY ***
% start timing execution (DO NOT MODIFY!)
tic
% print elapsed time on figure title (DO NOT MODIFY!)
robo_obj.time = title(['Elapsed time: ' num2str(toc,'%6.1f') ' s']);
% initiate with spiral motion until hitting wall limit



select_move = 1;
% loop through moves until 5 min time limit is over
while toc < 300  % (DO NOT MODIFY!)    
    
    
    if select_move == 1
        %spiral until something is hit
        robo_obj = spiralMove(robo_obj);%
    elseif select_move == 2
        robo_obj = forwardRandom(robo_obj);
        
    else
        
    end
        % after hitting wall limit, move backwards before switching moves
    robo_obj = backwardMove(robo_obj,1,30); % UNCOMMENT WHEN AVAILABLE
    %select_move = 2;
    
    
    % update elapsed time display
    set(robo_obj.time,'String',['Elapsed time: ' num2str(toc,'%6.1f') ' s'])
end






















% % *** SELECT THIS BLOCK AND COMMENT (Ctrl+R) WHEN DONE WITH TESTING ***
% % Square path
% numSteps = 10;
% xside = 40;
% yside = 40;
% xdistance = xside/numSteps;
% ydistance = yside/numSteps;
% angle = 90;
% % initialize time
% tic
% robo_obj.time = title(['Elapsed time: ' num2str(toc,'%6.1f') ' s']);
% 
% 
% 
% % horizontal move to the right
% robo_obj = forwardMove(robo_obj,xdistance,numSteps);
% robo_obj = turnStep(robo_obj,angle);
% % vertical move up
% robo_obj = forwardMove(robo_obj,ydistance,numSteps);
% robo_obj = turnStep(robo_obj,angle);
% % horizontal move to the left
% robo_obj = forwardMove(robo_obj,xdistance,numSteps);
% robo_obj = turnStep(robo_obj,angle);
% % vertical move down
% robo_obj = forwardMove(robo_obj,ydistance,numSteps);