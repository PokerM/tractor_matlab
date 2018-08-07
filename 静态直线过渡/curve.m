clear all
clc
%%
%��������
theta_max = 15;                             %���ǰ��ת�ǣ��ȣ�
theta_max_rad = theta_max * pi / 180;       %���ǰ��ת�ǣ�rad��
v = 1;                                      %�����ٶ�
L = 1.06;                                   %������
fai_max = v * tan(theta_max_rad) / L;       %�������ٶ�
%%

k = 0.2;                                    %
d = 12;
syms x
y = k * (1 / (1 + exp(-x * d + 6)));
figure(1)
fplot(y,[0 1]);
dy = diff(y, x)
figure(2)
fplot(dy,[0 1]);
dy2 = diff(dy, x)
symadd(y,dy)
% fai = atan2(dy, 1)
% figure(3)
% fplot(fai);
% dfai = dy2 / ((dy * dy + 1)^(3.0 / 2))
% figure(4)
% fplot(dfai),grid on;
%%
% lb = 1;
% ub = 20;
% mid = (lb + ub) / 2.0;
% while lb < ub
%     d = mid;
% end
