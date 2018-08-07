%‘§—µ¡∑£¨”√cmac±∆Ω¸ÀπÃπ∏£À„∑®
clear;
max_ = 100;
w = rand(10,10,4);
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
for i = 1 : max_
    N = 1;
    for j = -dis_max : 0.001 : dis_max
        for k = -fai_max : 0.001 : fai_max
            dis_d = get_degree(j, dis_max);
            fai_d = get_degree(k, fai_max);
            out = 0;
            for n = 1 : m
                out = out + w(dis_d(n), fai_d(n), n);
            end
            y(i,N) = -k + atan(1.3 * (j - 1.06 * sin(k)) / 0.69);
            d(i,N) = out;
            err(i,N) = d(i,N) - y(i,N);
            for n = 1 : m
                w(dis_d(n), fai_d(n), n) = w(dis_d(n), fai_d(n), n) - alpha / 3 * err(i,N);
            end
            N = N + 1;
        end
    end
end
plot(y(max_,:));
hold on
plot(d(max_,:));
figure(2)
plot(err(max_,:));
