function [memberships,new_centroids] = customKmeans(data,centroids,memberships)
%KMEANS Summary of this function goes here
%   Detailed explanation goes here
K = size(centroids,1);

while 1
    total = 0;
    for i=1:size(data,1)
        k = 1;
        min = 2*size(data,1)^2;
        for j=1:K
             dist = (norm(data(i,:)-centroids(j,:)).^2);
             
             if (dist < min)
                min = dist;
                k = j;
             end
        end
        memberships(i)=k;
    end 
    
    new_centroids = centroids;
    for i=1:K
        xi = data(memberships==i,:);
        cj = size(xi,1);

        for j=1:size(data,2)
            new_centroids(i,j) = (1/cj)*sum(xi(:,j));
        end
    end
    
    if (new_centroids == centroids)
        break;
    end
    
    centroids = new_centroids;
end

end

