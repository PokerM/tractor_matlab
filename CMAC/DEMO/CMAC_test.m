%≤‚ ‘ºØ
clear;
max_ = 100;
M = 15;
w = load('w15.mat');
w = w.w;
var_num = 3;
m = 4;
theta = 0;
dis_max = 0.05;
fai_max = 2 * pi / 180;
theta_max = 10 * pi /180;
alpha = 0.3;

x(1) = 0;
y(1) = 0.2;
fai(1) = 0;
N = 1;
for j = -dis_max : 0.0004 : dis_max
    for k = -fai_max : 0.0004 : fai_max
        dis_d = get_degree(j, dis_max, -dis_max, M);
        fai_d = get_degree(k, fai_max, -fai_max, M);
        out = 0;
        for n = 1 : m
            out = out + w(dis_d(n), fai_d(n), n);
        end
        y(N) = -k + atan(1.3 * (j - 1.06 * sin(k)) / 0.69);
        d(N) = out;
        err(N) = d(N) - y(N);
%             for n = 1 : m
%                 w(dis_d(n), fai_d(n), n) = w(dis_d(n), fai_d(n), n) - alpha / 3 * err(i,N);
%             end
        N = N + 1;
    end
end
plot(y);
hold on
plot(d);
figure(2)
plot(err);