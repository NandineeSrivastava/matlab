% Logistic / Sigmoid :
clc
clear all 
x = -10:0.1:10;
for a=1:5;
    y=a*x;
    tmp=exp(-y);
    y1=1./(1+tmp);
    plot(x,y1)
    title('Sigmoid Function : ')
    hold on;
end

% Hyperbolic Tangnet Function
clc
clear all
x = -10:0.1:10
for a = 1:5
    y2 = tanh(x);
end
xlabel('x-axis : ');
ylabel('y-axis : ');
title('Hyperbolic Tangent Function : ');


% Identity Function
clc
clear all
x3 = -5:0.01:5
a = 1:5
y3=a * x3
plot (x3,y3);
xlabel('x3');
ylabel('y3');
title('Identity Function : ')

% Hard Limit Function : 
y4 = hardlim (x)
plot(x,y4)
xlabel('x')
ylabel('y')
title('Hardlimit Function : ')

% Saturating Linear Function 
x6 = -5:0.001:5;
y6 = 1./(1+exp(x6));
plot(x6,y6);
xlabel('x');
ylabel('y');
title('Sigmoid activation function :');


% Satlin function
y5 = satlin(x6);
plot(x,y5);
xlabel('x');
ylabel('y');
title('Satlin function');


%RElu Function
x7 = -5:0.1:5;
y7 = max(0,x7);
xlabel('x');
ylabel('y');
title('Relu activation function : ');