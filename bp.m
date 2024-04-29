
%a. Generate XOR gate data
X = [0 0; 0 1; 1 0; 1 1]; % Input features
y = [0; 1; 1; 0];% Output labels
% b. Plot the data
class0_indices = find (y == 0);
class1_indices = find (y == 1);
scatter (X(class0_indices, 1), X(class0_indices, 2), 'o', 'filled'); 
hold on;
scatter (X(class1_indices, 1), X(class1_indices, 2), 'x', 'LineWidth', 2); 
legend('Class 0', 'Class 1');
xlabel('Input 1');
ylabel('Input 2');
title('XOR Gate Data');
% c. Choose appropriate feed forward Neural Network architecture 
hidden_layer_size = 2; % Two neurons in the hidden layer
net = patternnet(hidden_layer_size);
%d. Use MATLAB inbuilt functions to train the data 
net.trainParam.showWindow= false; % Suppress training window 
[net, tr] = train(net, X', y');
%e. Plot Cost function vs No. of Iterations curve
figure;
plot(tr.epoch, tr.perf);
xlabel('Number of Iterations');
ylabel('Cost function');
title('Cost function vs No. of Iterations');
% e. Plot Decision Boundary
figure;
x1_range= linspace (min(X(:, 1)), max(x(:, 1)), 100); 
x2_range= linspace(min(X(:, 2)), max(x(:, 2)), 100); 
[X1, X2] = meshgrid(x1_range, x2_range);
X_test= [X1(:)'; X2(:)'];
Y_pred = net (X_test);
decision_boundary=reshape(Y_pred, length (x2_range), length(x1_range));
contourf(x1_range, x2_range, decision_boundary);
colorbar;
xlabel('Input 1');
ylabel('Input 2');
title('Decision Boundary');