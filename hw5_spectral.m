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

K = 3;

memberships = zeros(size(data,1), 1);

% We need to turn our points into an adjacency matrix to get
% Laplacian Matrix

adjacencyMatrix = squareform(pdist(data,'euclidean'));
binaryAdjMatrix = adjacencyMatrix > 0;
degreeVector = sum(binaryAdjMatrix,1);

degreeMatrix = diag(degreeVector);

laplacianMatrix = degreeMatrix - adjacencyMatrix;

[eigVecs,eigVals] = eig(laplacianMatrix);

eigVals = diag(eigVals);

[sortedVals,indices] = sort(eigVals,'ascend');

selectedIndices = indices(1:num_dimensions);

d_Vecs = eigVecs(:,selectedIndices);

centroids = sortrows(d_Vecs(1:K,:));

[memberships, new_centroids] = customKmeans(d_Vecs,centroids,memberships);

if num_dimensions == 2
    f = customPlotKmeans2D(new_centroids,data,memberships,10);
    saveas(f,['./figures/kmeansSpecData.png']);
end