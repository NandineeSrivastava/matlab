% Define the input matrix X
X=randn(3, 1); % Example input with 3 rows and 1 column
% Define weights for the connections from input to the first layer
W1_sigmoid= randn(3, 3); % Weights for the connections from input to the first layer
% Define weights for the connections from the first layer to the output
W2_sigmoid= randn (3, 1); % Weights for the connections from the first layer to the output
% Define the sigmoid activation function
sigmoid= @(x) 1./(1 + exp(-x));
% Compute output of the first layer
hidden_layer_input_sigmoid=X'* W1_sigmoid; % Compute the input to the hidden layer
hidden_layer_output_sigmoid= sigmoid(hidden_layer_input_sigmoid); % Apply sigmoid activation
% Compute output of the network
output_sigmoid=hidden_layer_output_sigmoid * W2_sigmoid; % Compute the final output
disp("Output using sigmoid activation: ");
disp(output_sigmoid);
% Define weights for the connections from input to the first layer
W1_relu=randn(3, 3); % Weights for the connections from input to the first layer
% Define weights for the connections from the first layer to the output
W2_relu=randn(3, 1); % Weights for the connections from the first layer to the output
% Define the ReLU activation function
ReLU =@(x) max(0, x);
% Compute output of the first layer
hidden_layer_input_relu=X'*W1_relu; % Compute the input to the hidden layer
hidden_layer_output_relu=ReLU(hidden_layer_input_relu); % Apply ReLU activation
% Compute output of the network
output_relu =hidden_layer_output_relu * W2_relu; % Compute the final output
disp("Output using ReLU activation: ");
disp(output_relu);