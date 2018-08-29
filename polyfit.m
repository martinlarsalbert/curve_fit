clear all;
clc;
close all;

N = 500;
x = linspace(0,1,N)'; %column vector
m = 10
A = 1
B = 2
y = m + A*x + B*x.^2.5; %This is the actual function
mu = 0;
sigma = 1;

noice = mu + sigma*(1 - 2*rand(N,1));

y_distorted = y + noice;

%%
%Regression:
form=[ones(size(x)), x, x.^2.5]; %This is the actual function without coefficients m,A,B in matrix form.
coeffs = form \ y_distorted; %Solve overdetermined equation system, with Gaus Elemenination and least square fit.

m_pred = coeffs(1)
A_pred = coeffs(2)
B_pred = coeffs(3)
y_pred = form*coeffs;

%%
figure()
plot(x,y,'r-');
hold on;
plot(x,y_distorted,'b.');
plot(x,y_pred,'g-');
legend('Function','Distorted','Predicted function');




