w = load('w.mat');
w = w.w;
dis_max = 0.05;
fai_max = 2 * pi / 180;
m = 4;
N = 1;
for dis = -dis_max : 0.001 : dis_max
    for fai = -fai_max : 0.001 : fai_max
        dis_d = get_degree(dis, dis_max);
        fai_d = get_degree(fai, fai_max);
        cmac(N) = 0;
        for j = 1 : m
            cmac(N) = cmac(N) + w(dis_d(j), fai_d(j), j);
        end
        stanford(N) = -fai + atan(1.3 * (-dis - 1.06 * sin(fai)));
        error(N) = cmac(N) - stanford(N);
        N = N + 1;
    end
end
plot(cmac);
hold on
plot (stanford);
figure(2)
plot(error);

    