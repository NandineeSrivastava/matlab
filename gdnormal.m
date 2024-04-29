P=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
T = [0, 1, 2, 3, 4, 3, 2, 1, 2, 3, 4];
m= 0;
b = 0;
alpha = 0.01;
iterations= 1000;
W=[0,0]';
W1 = W(1,1);
W2 = W(2,1);
errors1=zeros(1, iterations);
errors2 = zeros(1, iterations);
for i= 1:iterations
Y_pred= m*P+b;
error= (T- Y_pred);
gradient_m =-2*sum(error.*P);
gradient_b =-2*sum(error);
W1= W1+ alpha*[-gradient_m^2, 0; 0, -gradient_b^2];
W2 =W2+ alpha*[gradient_m^2, 0; 0, gradient_b^2];
m=m-(alpha/ sqrt(W1(1, 1)))*gradient_m;
b=b-(alpha/ sqrt(W2(2, 2)))*gradient_b;
errors1(i)=mean(error.^2);
end
plot (1: iterations, errors1);
xlabel('Iterations');
ylabel('Square of Error');
title('Square of Error vs. Iterations');
disp(['Final slope (m): ', num2str(m)]);
disp(['Final y-intercept (b): ', num2str(b)]);
