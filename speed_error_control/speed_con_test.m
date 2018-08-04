clearvars;
clc;
degree2rad = pi / 180;
N = 1;
for d = 0 : 0.02 : 0.2
    for dnorth = -8 : 2 : 8
        for dtheta = -18 : 2 : 18
            dnorth_rad = dnorth * degree2rad;
            dtheta_rad = dtheta * degree2rad;
            [v(N), ~, err(N), comp(N)] = speed_con_new(dnorth_rad, dtheta_rad, d);
            N = N + 1;
        end
    end
end
plot(comp, v);