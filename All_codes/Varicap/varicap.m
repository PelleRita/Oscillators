
clear all ; close all;
%values extracted from the datasheet
vvec = [0.5 0.6 0.7 0.8 0.9 1.0 2.0 3. 4.   5. 6.  7.   8.   9.   10.   11.   12.];
cvec = [48  47  46  45  43  42  35  30 25   23 20  18   16   14   13   6 5];

%approximation on logarithmic scale
figure;
semilogx(vvec,cvec); %x axis has logarithmoc scale
title('Real model of the varicap diode on logarithmic x scale');
xlabel('log(U) [V]');
ylabel('C [pF]');

%plotting the same on real scale for the future approximation
figure;
plot(vvec,cvec);

%Approximating function
vtest = linspace(0,12,100);
ctest = 150.0./(vtest+2);

figure;
plot(vvec,cvec,vtest,ctest);
legend('real curve','fit');
title('Real model of the varicap diode and the approximate model');
xlabel('U [V]');
ylabel('C [pF]');
