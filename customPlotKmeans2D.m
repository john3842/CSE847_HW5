function [f] = customPlotKmeans2D(new_centroids,data,memberships,dimension)
%PLOTKMEANS2D Summary of this function goes here
%   Detailed explanation goes here
% Plot in 2D

K = size(new_centroids,1);

x = new_centroids(:,1);
y = new_centroids(:,2);

f = figure();
plot(x,y,'+');
axis([-1 dimension+1 -1 dimension+1]);
legend('centroids');
hold on;
shapes = ['o','*','x','d','s'];

for i=1:K
    idx = (memberships == i);

    x = data([idx],1);
    y = data([idx],2);

    plot(x,y,shapes(i));
    hold on;
end

end

