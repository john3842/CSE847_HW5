clear;

rng(4);
num_items = 100;
num_dimensions = 2;
data = randi(num_items,num_items,num_dimensions);

K = 3;

centroids = sortrows(data(1:K,:));
memberships = zeros(size(data,1), 1);

centroids

[memberships, new_centroids] = customKmeans(data,centroids,memberships);

new_centroids

if num_dimensions == 2
    f = customPlotKmeans2D(new_centroids,data,memberships,num_items);
    %saveas(f,['./figures/kmeansSpec.png']);
end