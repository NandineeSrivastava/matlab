% Generate dataset

X1= rand(10, 1); % First input feature, 10 samples
X2= rand(10, 1); % Second input feature, 10 samples

y=2*X1+3*X2 + 4; % Single output with some noise

% Initialize parameters

theta =rand(3, 1); % Slope coefficients and intercept of the line

% Combine input features into one matrix
X = [X1, X2];

% Add bias term to input features
X= [ones(size(X, 1), 1), X];

% Define hyperparameters

alpha=0.01; % Learning rate

num_iters = 1000; % Number of iterations

% Gradient Descent

cost_history= zeros(num_iters, 1);

for iter= 1:num_iters

% Calculate predictions

predictions = X*theta;

% Calculate error

error =predictions-y;

% Update parameters

theta= theta-alpha*(1/size(X, 1))*X'*error

% Calculate cost

cost=(1/(2*size(X, 1)))*sum (error.^2); 
cost_history(iter) = cost;

end

% Plot the dataset

scatter3(X1, X2, y, 'b');

hold on;

% Plot the optimized straight line

x_values = min(X1):0.1:max(X1);

y_values= min(X2):0.1:max(X2);

[X1_plot, X2_plot] = meshgrid(x_values, y_values);

Y_plot =theta(1) + theta (2)* X1_plot+ theta(3)*X2_plot;

xlabel('Input Feature 1');

ylabel('Input Feature 2');

zlabel('Output');

title('Gradient Descent Linear Regression');

% Plot the cost function value versus number of iterations

figure;

plot(1:num_iters, cost_history, 'b');

xlabel('Number of Iterations');

ylabel('Cost Function Value');

title('Post Function Value us Number of Iterations');