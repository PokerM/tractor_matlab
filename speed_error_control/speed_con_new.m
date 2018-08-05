function [res,fval,err,comp] = speed_con_new(d, d_fai, c_theta, e_theta)
T = 0.1;
dnorth = -d_fai;
% e_theta = dnorth + atan(1.3 * (d + 1.06 * sin(dnorth))); 
if c_theta < e_theta
    v_theta = 0.2356;
else
    v_theta = -0.2356;
end
N = 10;
t = T / N;
L = 1.06;
dx = 0;
dy = 0;
dfai = 0;
syms v
theta = c_theta;
for i = 1 : N
    theta = theta + v_theta * t;
    if (v_theta > 0 && theta > e_theta) || (v_theta < 0 && theta < e_theta)
        theta = e_theta;
    end
    dfai = dfai + v / L * tan(theta) * t;
    dx = dx + v * cos(d_fai + dfai) * t;
    dy = dy + v * sin(d_fai + dfai) * t;
end
    err = (d + dy + atan(1.3 * (dy + 1.06 * sin(dfai + d_fai))))^2;
    J = 100 * err + (v+1) ^-1;
    [res,fval] = fmincon(matlabFunction(J), 0, [],[],[],[],0.4,1);
    err = 10 * double(subs(err, v , res));
    comp = 1.7 * c_theta + e_theta;
end
