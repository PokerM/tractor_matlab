clearvars;
clc;
xt = 0;
yt = 0;
fai = -10 : 1 : 10;
theta = (-20 : 1 : 20) * pi / 180;
dtheta = 2.55 * pi / 180;
N = 1;
for fait = fai
    for out = theta
        sim('tractor');
        len = length(simout.data(:,1));
        x(N) = simout.data(len, 1);
        c_fai(N) = simout.data(len, 2);
        y(N) = simout.data(len, 3);
        out = out + dtheta;
        sim('tractor');
        len = length(simout.data(:,1));
        ex(N) = simout.data(len, 1);
        ec_fai(N) = simout.data(len, 2);
        ey(N) = simout.data(len, 3);
        N = N + 1;
    end
end
        