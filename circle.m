x0=0; % x0 and y0 are center coordinates
y0=0;  
r=1;  % radius
angle=-pi:0.1:pi;
angl=angle(randi(numel(angle),100,1));
x=r*cos(angl)+x0;
y=r*sin(angl)+y0;
scatter(x,y);
xlim([-r r]+x0);
ylim([-r r]+y0);
axis square;

hold on;

x0=0; % x0 and y0 are center coordinates
y0=0;  
r=2;  % radius
angle=-pi:0.1:pi;
angl=angle(randi(numel(angle),100,1));
x=r*cos(angl)+x0;
y=r*sin(angl)+y0;

data = [x', y'];
%axis square;