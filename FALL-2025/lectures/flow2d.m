% MATLAB script:  flow2d.m  
% Dr. L's simple 2D flow script w/ streamlines 

%Problem 1 
e = 2; g = 1;

%Problem 2 
%e = 1; g = 1;
[x,y] = meshgrid(0:15,0:15);  % grid set-up

u = e*x-g*y;                  % u-component velocity probs 1 & 2 

%Problem 1
v = g*x-e*y;                  % v-component velocity problem 1

%Problem 2 
%v = g*x+e*y;                 % v-component velocity problem 2 

%Problem 3
xo = 7.5;
yo = 7.5;
d  = -2;
%u = 0.5*d*(x-xo);            % u-component velocity problem 3
%v = 0.5*d*(y-yo);            % v-component velocity problem 3

%Axis Labels
xlabel('X')
ylabel('Y')

%Problem 1 
title('PROB #1: 2D FLOW W/ STREAMLINES')
sx = [2.5,5,7.5,10,12.5,2.5,3.5,4.5,5.5,6.5,7.5,8.5,9.5,10.5,11.5,12.5];
sy = [5.5,1,1,1,1,16,16,16,16,16,16,16,16,16,16,16];

%Problem 2 
%title('PROB #2: 2D FLOW W/ STREAMLINES')
%sx = [1.5,3.5,5.5,7.5,9.5,11.5,13.5];
%sy = [1,1,1,1,1,1,1];

%Problem 3 
%title('PROB #3: 2D FLOW W/ STREAMLINES')
%sx = [1,1,16,16,8.5,8.5,1,16];
%sy = [1,16,16,1,1,16,8.5,8.5];

xy = stream2(u,v,sx,sy);
streamline(xy);
hold on
quiver(u,v,'r')                   % Now superimpose the velocity field
