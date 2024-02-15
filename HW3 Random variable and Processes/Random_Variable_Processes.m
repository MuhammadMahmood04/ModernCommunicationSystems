% Draw 1000 samples from a uniform distribution with limits -pi to +pi
n = [1000, 1];

r = unifrnd(-pi, pi, n);

mean(r)

var(r)


figure;

histogram(r); 
title('Uniform Distribution');
xlabel('Values');
ylabel('Frequency');


% Draw 1000 samples from a Gaussian distribution with mean = 0 and variance = 1
gaussianex1 = randn(1000, 1);

mean(gaussianex1)

var(gaussianex1)


% Plot histogram
figure;
histogram(gaussianex1, 20); 
title('Gaussian Distribution with mean = 0, variance = 1');
xlabel('Values');
ylabel('Frequency');

 % Draw 1000 samples from a Gaussian distribution with mean = 10 and variance = 5
gaussianex2 = gaussianex1*sqrt(5) + 10;

mean(gaussianex2)

var(gaussianex2)

% Plot histogram
figure;
histogram(gaussianex2, 20); 
title('Gaussian Distribution with mean = 10, variance = 5');
xlabel('Values');
ylabel('Frequency'); 