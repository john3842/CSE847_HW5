clear;

rng(4);
num_items = 100;
num_dimensions = 2;

cluster_1 = randi([0,10],num_items,num_dimensions);
cluster_2 = randi([20,100],num_items,num_dimensions);
cluster_3 = randi([100,200],num_items,num_dimensions);
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
    f = customPlotKmeans2D(new_centroids,data,memberships,200);
    saveas(f,['./figures/kmeans1.png']);
end