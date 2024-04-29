% Define input range
x = -10:0.1:10;

% Logistic Function
logistic = 1 ./ (1 + exp(-x));

% Hyperbolic Tangent Function
tanh_func = tanh(x);

% Identity Function
identity = x;

% Hard Limit Function
hard_limit = x >= 0;

% Saturating Linear Function
saturating_linear = min(max(x, -1), 1);

% Plotting
figure;
hold on;
plot(x, logistic, 'r', 'LineWidth', 2);
plot(x, tanh_func, 'g', 'LineWidth', 2);
plot(x, identity, 'b', 'LineWidth', 2);
plot(x, hard_limit, 'm', 'LineWidth', 2);
plot(x, saturating_linear, 'c', 'LineWidth', 2);

% Add legend and labels
legend('Logistic', 'Tanh', 'Identity', 'Hard Limit', 'Saturating Linear');
xlabel('Input');
ylabel('Output');
title('Activation Functions');

% Adjust axis limits for better visualization
ylim([-1.2, 1.2]);

% Show grid
grid on;

% Hold off
hold off;