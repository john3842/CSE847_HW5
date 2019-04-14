clear;

rng(4);
num_items = 10;
data = randi(num_items,num_items,2);

K = 3;

centroids = sortrows(data(1:K,:));
memberships = zeros(size(data,1), 1);


data
centroids

while 1
    total = 0;
    for i=1:size(data,1)
        k = 1;
        min = 2*num_items^2;
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

        new_centroids(i,:) = [(1/cj)*sum(xi(:,1)) (1/cj)*sum(xi(:,2));];
    end
    
    if (new_centroids == centroids)
        break;
    end
    
    centroids = new_centroids;
end

memberships
new_centroids