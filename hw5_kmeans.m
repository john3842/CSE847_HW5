clear;

rng(4);
num_items = 100;
num_dimensions = 2;

%cluster_1 = randi([0,10],num_items,num_dimensions);
%cluster_2 = randi([50,100],num_items,num_dimensions);
%cluster_3 = randi([150,300],num_items,num_dimensions);

% https://www.mathworks.com/matlabcentral/answers/83702-generate-random-coordinates-around-a-circle
x0=0; % x0 and y0 are center coordinates
y0=0;  
r=1;  % radius
angle=-pi:0.1:pi;
angl=angle(randi(numel(angle),100,1));
x=r*cos(angl)+x0;
y=r*sin(angl)+y0;
cluster_1 = [x', y'];

x0=0; % x0 and y0 are center coordinates
y0=0;  
r=5;  % radius
angle=-pi:0.1:pi;
angl=angle(randi(numel(angle),100,1));
x=r*cos(angl)+x0;
y=r*sin(angl)+y0;
cluster_2 = [x', y'];

x0=0; % x0 and y0 are center coordinates
y0=0;  
r=10;  % radius
angle=-pi:0.1:pi;
angl=angle(randi(numel(angle),100,1));
x=r*cos(angl)+x0;
y=r*sin(angl)+y0;
cluster_3 = [x', y'];

data = [cluster_1;cluster_2;cluster_3];
num_items = num_items * 3;

%data = randi(num_items,num_items,num_dimensions);

K = 3;

centroids = sortrows(data(1:K,:));
memberships = zeros(size(data,1), 1);


data
centroids

[memberships, new_centroids] = customKmeans(data,centroids,memberships);

new_centroids

if num_dimensions == 2
    f = customPlotKmeans2D(new_centroids,data,memberships,10);
    saveas(f,['./figures/kmeans1.png']);
end