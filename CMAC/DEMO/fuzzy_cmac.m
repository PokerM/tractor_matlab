clearvars;
clc;
max_num = 10000;
w = rand(3,3,4);
m = 4;
theta = 0;
dis_max = 0.05;
fai_max = 2 * pi / 180;
theta_max = 10 * pi /180;
alpha = 1;

cij = rand(1, 24);
detaij = rand(1, 24);

x(1) = 0;
y(1) = 0.2;
fai(1) = 0;
% y = zeros(1, max_num);
% d = zeros(1, max_num);
% err = zeros(1, max_num);
for i = 1 : max_num
    N = 1;
    min_fuzzy = 2;
    for j = -0 : 0.001 : 0
        for k = -fai_max : 0.001 : fai_max
            dis_d = get_degree(j, dis_max);     %得到激活神经元
            fai_d = get_degree(k, fai_max);
            min_fuzzy = zeros(1, 4);
            min_para = zeros(1, 4);
            %取小
            for n = 1 : 4
                para1 = 3 * (n - 1) + dis_d(n);
                para2 = 3 * (n - 1) + fai_d(n) + 12;
                temp_1 = exp(-(j - cij(para1))^2 / (detaij(para1)^2));
                temp_2 = exp(-(k - cij(para2))^2 / (detaij(para2)^2));
                if temp_1 < temp_2
                    min_fuzzy(n) = temp_1;
                    min_para(n) = para1;
                else
                    min_fuzzy(n) = temp_2;
                    min_para(n) = para2;
                end
            end
            %归一化
            min_fuzzy_sum = sum(min_fuzzy);
            min_fuzzy_af = min_fuzzy / min_fuzzy_sum;
            
            out = 0;
            for n = 1 : m
                out = out + min_fuzzy_af(n) * w(dis_d(n), fai_d(n), n);
            end
%             y(i,N) = -k + atan(1.3 * (j - 1.06 * sin(k)) / 0.69);
            y(i, N) = j + k;
            d(i,N) = out;
            err(i,N) = y(i,N) - d(i, N);
            for n = 1 : m
                dEdw = - err(i, N) * min_fuzzy_af(n);
                if min_para(n) > 12
                    gauss = exp(-(k - cij(min_para(n)))^2 / (detaij(min_para(n))^2));
                    deta2 = err(i, N) * w(dis_d(n), fai_d(n), n) * gauss * (min_fuzzy(n) - min_fuzzy_sum) * (min_fuzzy_sum^2);
                    dcij =  - deta2 * 2 * (k - cij(min_para(n))) / (detaij(min_para(n))^2);
                    ddetaij = -deta2 * 2 * (k - cij(min_para(n)))^2 / (detaij(min_para(n))^3);
                else
                    gauss = exp(-(j - cij(min_para(n)))^2 / (detaij(min_para(n))^2));
                    deta2 = err(i, N) * w(dis_d(n), fai_d(n), n) * gauss * (min_fuzzy(n) - min_fuzzy_sum) * (min_fuzzy_sum^2);
                    dcij =  -deta2 * 2 * (j - cij(min_para(n))) / (detaij(min_para(n))^2);
                    ddetaij = -deta2 * 2 * (j - cij(min_para(n)))^2 / (detaij(min_para(n))^3);
                end
                cij(min_para(n)) = cij(min_para(n)) - alpha * dcij;                                        
                detaij(min_para(n)) = detaij(min_para(n)) - alpha * ddetaij;
                w(dis_d(n), fai_d(n), n) = w(dis_d(n), fai_d(n), n) - alpha * dEdw ;
            end 
            N = N + 1;
        end
    end
end
plot(y(max_num,:));
hold on
plot(d(max_num,:));
figure(2)
plot(err(max_num,:));