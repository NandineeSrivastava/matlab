%Given input data
P=[0 1 2 3 4 5 6 7 8 9 10];

% Given output data 
T=[0 1 2 3 4 3 2 1 2 3 4];

% Create a neural network

net= feedforwardnet(10); % You can adjust the number of hidden neurons (10 in this case)

% Set up the network

net = configure(net, P, T);

% Train the neural network

net.trainParam.epochs = 1000; % You can adjust the number of epochs

net = train(net, P, T);

%Simulate the network

Y = net(P);

%Plot the output

plot(P, T, 'o', P, Y, 'x');

legend('Target', 'Output');

title('Neural Network Output');

xlabel('Input');

ylabel('Output');

% Plot the square of error

error = T - Y;

error_squared = error.^2;

figure;

plot(P, error_squared, 'o-');

title('Square of Error');

xlabel('Input');

ylabel('Squared Error');