function [res] = speed_con(c_v, c_fai, c_theta, e_theta)
T = 0.1;
v_theta = 0.2356;
N = 10;
t = T / N;
L = 1.06;
dx1 = 0;
dx2 = 0; 
dy1 = 0;
dy2 = 0; 
dfai1 = 0; 
dfai2 = 0;
syms v
theta = c_theta;
for i = 1 : N
    dfai1 = dfai1 + c_v / L * tan(e_theta) * i * t;
    dx1 = dx1 + c_v * cos(c_fai + dfai1);
    dy1 = dy1 + c_v * sin(c_fai + dfai1);

    theta = theta + v_theta * t;
    if theta < e_theta || theta > e_theta
        theta = e_theta;
    end
    dfai2 = dfai2 + v / L * tan(theta) * i * t;
    dx2 = dx2 + v * cos(c_fai + dfai2);
    dy2 = dy2 + v * sin(c_fai + dfai2);
end
err = 5 * (dx1 - dx2)^2 + 5 * (dy1 - dy2)^2 + (dfai1 - dfai2)^2;
J =  err + 1 * v ^ -2;
[res] = fmincon(matlabFunction(J), 0, [],[],[],[],0,2.4);
end