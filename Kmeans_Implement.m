%%% Create Random Dataset
n1 = 20;
n2 = 30;
n3 = 40;
data = [normrnd(1,2,[2,n1]), normrnd(5,1,[2,n2]), normrnd(8,2,[2,n3])]';
true_labels = [repelem(1,n1),repelem(2,n2),repelem(3,n3)];


%%% Plot true clusters
myColors = zeros(size(data,1),3);

rowsToSetRed = true_labels == 1;
rowsToSetBlue = true_labels == 2;
rowsToSetYellow = true_labels == 3;

myColors(rowsToSetBlue, 1) = 0;
myColors(rowsToSetBlue, 2) = 0;
myColors(rowsToSetBlue, 3) = 1;

myColors(rowsToSetRed, 1) = 1;
myColors(rowsToSetRed, 2) = 0;
myColors(rowsToSetRed, 3) = 0;

myColors(rowsToSetYellow, 1) = 1;
myColors(rowsToSetYellow, 2) = 1;
myColors(rowsToSetYellow, 3) = 0;

scatter(data(:, 1), data(:, 2), (n1+n2+n3)*3, myColors, '+');
grid on;









%%% Run Kmeans clustering: 3 clusters
[cluster_labels, data_centroids, iter] = Kmean_Learner(data, 3, 10, 0.00001);


%%% Plot new clusters
myColors = zeros(size(data,1),3);

rowsToSetRed = cluster_labels == 1;
rowsToSetBlue = cluster_labels == 2;
rowsToSetYellow = cluster_labels == 3;

myColors(rowsToSetBlue, 1) = 0;
myColors(rowsToSetBlue, 2) = 0;
myColors(rowsToSetBlue, 3) = 1;

myColors(rowsToSetRed, 1) = 1;
myColors(rowsToSetRed, 2) = 0;
myColors(rowsToSetRed, 3) = 0;

myColors(rowsToSetYellow, 1) = 1;
myColors(rowsToSetYellow, 2) = 1;
myColors(rowsToSetYellow, 3) = 0;

scatter(data(:, 1), data(:, 2), (n1+n2+n3)*3, myColors, '+');
grid on;

