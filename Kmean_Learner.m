function [group_label, centroids, iter] = Kmean_Learner(data, K, maxiter, threshold)

% data: Input dataset
% K: number clusters to be seperated
% maxiter: maximum number of iterations allowed
% threshold: Stopping criteria


% shape of data input
[nrows, ncols] = size(data);
% array of all row indexes
all_rows = 1:nrows;
% create initial labels: all belong to 1st class
data_labels = repelem(1,nrows) ;

% All labels available 
all_labels = 1:K ;

% Create Initial Centroids by randomly selecting from input dataset
initial_centroid_index = randsample(1:nrows, K) ;
centroid_new = zeros([K,ncols]);
for centroid_num  = 1:K
    centroid_new(centroid_num,1:end) = data(initial_centroid_index(centroid_num),1:end);
end

% Create new array to save updated centroids
centroid_old = vec2mat(repelem(0, K*ncols), ncols);

% Start the iterative centroid update procedure
iter = 0;
% stop criteria: reach maxiter OR centroids do not change much
while iter < maxiter || sqrt(sum((centroid_new(:) - centroid_old(:)).^2)) >= threshold
    centroid_old = centroid_new;
    
    % calculate distance from each data point to each centroid
    distances = repelem(0,K);
    for j=1:nrows
        for k=1:K
           distances(k) = sqrt(sum((data(j,1:end)-centroid_old(k,1:end)).^2)); 
        end
        % update labels to its nearest centroid
        data_labels(j) = all_labels(distances==min(distances));
    end
    
    % update centroids
    for xx = 1:K
       centroid_new(xx,1:end) = mean(data(all_rows(data_labels==xx),1:end)); 
    end
    % update iteration number
    iter = iter + 1;
end

% Output final labels and centroids
group_label = data_labels;
centroids = centroid_new;
end 





