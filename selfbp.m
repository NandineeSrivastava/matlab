% XOR gate data
x= [0 0; 0 1; 1 0; 1 1];
y = [0; 1; 1; 0];
% Neural network architecture
input_size = 2;
hidden_size = 2;
output_size = 1;
%Initialize weights and biases randomly
W1 = randn(input_size, hidden_size);
b1= randn(1, hidden_size);
W2 = randn(hidden_size, output_size);
b2 =randn(1, output_size);
% Hyperparameters
learning_rate = 0.1;
epochs = 10000;
% Training loop
cost_history= zeros(epochs, 1);
for epoch =1:epochs
% Forward pass
hidden_input = x * W1 + b1;
hidden_output= sigmoid (hidden_input);
output= sigmoid (hidden_output * W2 + b2);
% Compute loss
loss =sum((y-output).^2)/ size (x, 1);
cost_history(epoch) = loss;
% Backpropagation
delta_output= (output - y).*output.* (1- output);
delta_hidden=delta_output* W2'.* hidden_output.* (1-hidden_output);
%Update weights and biases
W2 = W2 - learning_rate*(hidden_output'*delta_output);
b2=b2-learning_rate*sum(delta_output);
W1 = W1 - learning_rate*(x' * delta_hidden);
b1=b1- learning_rate*sum(delta_hidden);
end
%Plot cost function vs number of iterations curve
figure;
plot(1:epochs, cost_history);
xlabel('Number of Iterations');
ylabel('Cost Function');
title('Cost Function vs Number of Iterations');
% Plot decision boundary
figure;
x1_range=linspace (min (x(:, 1)), max(x(:, 1)), 100);
x2_range=linspace (min (x(:, 2)), max(x(:, 2)), 100); 
[X1, X2] = meshgrid(x1_range, x2_range);
X_test = [X1(:)'; X2(:)'];
Y_pred = sigmoid(sigmoid (X_test' *W1+b1)*W2 +b2); 
decision_boundary=reshape (Y_pred, length (x2_range), length (x1_range)); contourf(x1_range, x2_range, decision_boundary);
colorbar;
xlabel('Input 1');
ylabel('Input 2');
title('Decision Boundary');
% Sigmoid activation function
function output = sigmoid(x) 
output = 1./(1+ exp(-x));
end