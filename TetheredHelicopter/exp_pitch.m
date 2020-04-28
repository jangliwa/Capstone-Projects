clear all;
close all; 

fi_0 = -0.63;
fi_max = 0.8099;
fi_min = -0.8084;
G = 9.81*0.027*0.25/sin(-fi_0);
x1 = 2.94;
x2 = 5.99;
T = x2 - x1;
y1 = 0.293;
y2 = 0.158;
wd = 2*pi/T;
ksi = 1/sqrt(1+(2*pi/log(y1/y2))^2);
wn = wd/sqrt(1-ksi^2);
J = G/wn^2;
D = 2*ksi*wn*J;
d = 0.235;