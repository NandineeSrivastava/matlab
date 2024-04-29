
%Step 1: Dataset Generation
rng(1); % Set random seed for reproducibility
num_points = 100;
cluster1 = randn(num_points, 2) + repmat([2, 2], num_points, 1); 
cluster2 = randn(num_points, 2) + repmat([-2, -2], num_points, 1); 
toy_dataset= [cluster1 ; cluster2];
%% Step 2: Initialization
k = 2; % Number of clusters
centroids =toy_dataset (randperm(size (toy_dataset, 1), k), :);
%Step 3: K-Means Algorithm
while true
%% Assign points to nearest centroid
distances = pdist2(toy_dataset, centroids);
[~, cluster_assignment] = min(distances, [], 2);
%% Update centroids
new_centroids = zeros(k, size (toy_dataset, 2)); 
for i = 1:k
   new_centroids (i, :) = mean (toy_dataset (cluster_assignment == i, :));
end
% Check convergence
if isequal(centroids, new_centroids)
    break;
else
centroids = new_centroids;
end
end
%Step 4: Visualization
% Before Clustering
subplot(1, 2, 1)
scatter (toy_dataset (:, 1), toy_dataset(:, 2), 'filled');
title('Before Clustering');
xlabel('Feature 1'); ylabel('Feature 2');
%% After Clustering 
subplot(1, 2, 2)
scatter (toy_dataset (cluster_assignment== 1, 1), toy_dataset (cluster_assignment== 1, 2), 'filled', 'MarkerFaceColor', 'r'); hold on;
scatter (toy_dataset (cluster_assignment == 2, 1), toy_dataset (cluster_assignment == 2, 2), 'filled', 'MarkerFaceColor', 'b'); scatter (centroids (:, 1), centroids (:, 2), 100, 'k', 'filled');
title('After Clustering');
xlabel('Feature 1');
ylabel('Feature 2');
legend('Cluster 1', 'Cluster 2', 'Centroids');