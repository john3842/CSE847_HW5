clear;

rng(4);
num_items = 100;
num_dimensions = 2;
data = randi(num_items,num_items,num_dimensions);

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

[sortedVals,indices] = sort(eigVals,'descend');

selectedIndices = indices(1:num_dimensions);

d_Vecs = eigVecs(:,selectedIndices);

centroids = sortrows(d_Vecs(1:K,:));

[memberships, new_centroids] = customKmeans(d_Vecs,centroids,memberships);

if num_dimensions == 2
    f = customPlotKmeans2D(new_centroids,d_Vecs,memberships,0);
    saveas(f,['./figures/kmeansSpecData.png']);
    f = customPlotKmeans2D(new_centroids,data,memberships,num_items);
    saveas(f,['./figures/kmeansSpecEigVecs.png']);
end