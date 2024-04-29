% Generate dataset with single input and single output

X= rand(10,1); % Input

Y = 2*X + 33 % Output

% Plotting the generated dataset

figure;

scatter(X, Y);

xlabel('X (Input)');

ylabel('Y (Output)');

title('Generated Dataset');

% Gradient Descent Algorithm

alpha=0.02; % Learning rate 
iterations = 1000; % Number of iterations

% Initialize parameters

theta0= 0;

thetal= 0;

% Arrays to store cost and parameter values

J_history= zeros(iterations, 1);

theta_history= zeros(iterations, 2);

% Gradient Descent

for iter= 1:iterations

% Calculate predictions

Y_predicted =theta0 + thetal*X;

% Calculate cost function 
J= (1/(2*length(X)))*sum((Y_predicted- Y).^2);

% Update parameters using gradient descent

theta0= theta0- alpha*(1/length(X))*sum(Y_predicted - Y);
thetal = thetal- alpha *(1/length(X))*sum((Y_predicted-Y).*X);

% Save the cost and parameter values for plotting

J_history(iter) = 3;

theta_history(iter, :) = [theta0, thetal];

end

% Plot the cost function value vs number of iterations

figure;

plot(1:iterations, J_history, '-b');

xlabel('Number of iterations');

ylabel('Cost J');

title('Cost Function Value vs Number of Iterations');

% Plot the optimized straight line on the dataset

figure;

scatter (X, Y);

hold on;

plot(X, theta0 + thetal*X, '-r');

xlabel('X (Input)');

ylabel('Y (Output)');

title('Optimized Straight Line Fitted to Dataset');

legend('Dataset', 'Optimized Straight Line');

% Display optimized parameters

fprintf('Optimized parameters: theta0 %f, thetal %f\n', theta0, thetal);