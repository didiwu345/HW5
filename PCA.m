%%% Part1
data = [0,-1,-3,1,3;0,2,6,-2,-6]';
scatter(data(:,1),data(:,2))





%%% Part2
load USPS.mat
A2 = reshape(A(2,:),16,16);
imshow(A2')

% Apply PCA
coeff = pca(A'A);

% Reconstucted data 1: 10 pc
new1 = A * coeff(:,1:10) * coeff(:,1:10)';
newA2 = reshape(new1(2,:),16,16);
imshow(newA2')


% Reconstucted data 1: 50 pc
new2 = A * coeff(:,1:50) * coeff(:,1:50)';
newA2 = reshape(new2(2,:),16,16);
imshow(newA2')

% Reconstucted data 1: 10 pc
new3 = A * coeff(:,1:100) * coeff(:,1:100)';
newA2 = reshape(new3(2,:),16,16);
imshow(newA2')

% Reconstucted data 1: 10 pc
new4 = A * coeff(:,1:200) * coeff(:,1:200)';
newA2 = reshape(new4(2,:),16,16);
imshow(newA2')


