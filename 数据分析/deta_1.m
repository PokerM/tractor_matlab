clear all; 
clc;
theta = -10 : 0.01 : 10;
deta = 2.55;
deta_na = -2.55;
theta_1 = theta + deta;
theta_2 = theta + deta_na;
H = 1;
T = 0.1;
x = H * cos(theta * pi / 180) * T;
x_1 = H * cos(theta_1 * pi / 180) * T;
x_2 = H * cos(theta_2 * pi / 180) * T;
y = H * sin(theta * pi / 180) * T;
y_1 = H * sin(theta_1 * pi / 180) * T;
y_2 = H * sin(theta_2 * pi / 180) * T;
error_1 = y - y_1;
error_2 = y - y_2;
plot(x, y);
hold on 
plot(x_1, y_1);
hold on 
plot(x_2, y_2);
legend('ÎŞÎó²î','+Îó²î','-Îó²î');
title('y×ø±ê¹ÀËã');
% axis([-5 5 ])
figure(2)

plot(theta, error_1);
title('+0.8Îó²î');
figure(3)

plot(theta, error_2);
title('-0.8Îó²î');