%cmac ÔÚÏßÑ§Ï°
clear;
max = 500;
w = load('w.mat');
w = w.w;
var_num = 3;
m = 4;
theta = 0;
dis_max = 0.05;
fai_max = 2 * pi / 180;
theta_max = 10 * pi /180;
alpha = 9;

x(1) = 0;
y(1) = 0.2;
fai(1) = 0;
for i = 1 : max
    xt = x(i);
    yt = y(i);
    fait = fai(i);
    CMAC = false;
    if abs(yt) < dis_max && abs(fait) < fai_max 
        dis_d = get_degree(y(i), dis_max);
        fai_d = get_degree(fai(i), fai_max);
        out = 0;
        for j = 1 : m
            out = out + w(dis_d(j), fai_d(j), j);
        end
        CMAC = true;
    else
        out = -fai(i) + atan(1.3 * (-y(i) - 1.06 * sin(fai(i))));
    end
    sim('tractor');
    len = length(simout.data(:,1));
    x(i + 1) = simout.data(len, 1);
    fai(i + 1) = simout.data(len, 2);
    y(i + 1) = simout.data(len,3);
    if CMAC 
        CMAC = false;
        d = y(i + 1) + 1 * sin(fai(i+1)) * 0.1 + fai(i + 1);
        dfai = -fai(i + 1);
        expect = -fai(i + 1) - atan(1 * (y(i + 1) + 0.1 * sin(fai(i + 1))));
%         expect = y(i + 1) + fai(i + 1);
        err =  - d;
        if abs(err) > 0
            for k = 1 : m
                w(dis_d(k), fai_d(k), k) = w(dis_d(k), fai_d(k), k) + alpha / 3 * err;
            end
        end
    end
end
plot(x,y);
