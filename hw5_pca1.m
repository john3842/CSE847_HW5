clear;

data = [0,0; -1,2; -3,6; 1,-2; 3,-6];

f = figure(); 
plot(data(:,1), data(:,2), 'ko');
title('PCA - Part 1');
axis([-10 10 -10 10]);
saveas(f,'./figures/hw5_2_1a.png');

pca1x = [-6 6];
pca1y = [12 -12];

pca2x = [-12 12];
pca2y = [-6 6];

f = figure(); 
plot(data(:,1), data(:,2), 'ko');
hold on;
plot(pca1x, pca1y, 'r-');
plot(pca2x, pca2y, 'b-');
title('PCA - Part 1');
legend('Data', 'First PC','Second PC');
axis([-10 10 -10 10]);
saveas(f,'./figures/hw5_2_1b.png');
