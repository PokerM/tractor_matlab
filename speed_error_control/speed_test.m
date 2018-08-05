clearvars;
clc;
y = 0.002;
N = 100;
xt1 = zeros(1, N + 1);
yt1 = zeros(1, N + 1);
fait1 = zeros(1, N + 1);
theta1 = zeros(1, N + 1);
int1 = 0;
int2 = 0;
speed = 0.8;
for i = 1 : N
    d = y - yt1(i);
    dnorth = -fait1(i);
    if d < 0.15
        int1 = int1 + d;
    end
    if int1 < -200
        int1 = -200;
    else
        if int1 > 200
            int1 = 200;
        end
    end
    xt = xt1(i);
    yt = yt1(i);
    fait = fait1(i);
    thetat = theta1(i);
    etheta = dnorth + atan(1.3 * (d + 1.06*sin(dnorth)) / 1) + 0.03 * int1;
    if etheta > thetat
        vtheta = 0.2356;
    else
        vtheta = -0.2356;
    end
    etheta = abs(etheta);
    sim('tractor');
    len = length(simout.data(:,1));
    xt1(i + 1) = simout.data(len, 1);
    fait1(i + 1) = simout.data(len, 2);
    yt1(i + 1) = simout.data(len, 3);
    theta1(i + 1) = simout.data(len, 4);
end
plot(xt1,yt1);