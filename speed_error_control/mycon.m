function [c,ceq] = mycon(x,m)
N = 10;
dfai2 = 0;
dx2 = 0;
dy2 = 0;
for i = 1 : N    
    m(1) = m(1) + m(2) * m(4);
    if (m(2) > 0 && m(1) > m(7)) || (m(2) < 0 && m(1) < m(7))
        m(1) = m(7);
    end
    dfai2 = dfai2 + x / m(3) * tan(m(1)) * m(4);
    dx2 = dx2 + x * cos(m(5) + dfai2) * m(4);
    dy2 = dy2 + x * sin(m(5) + dfai2) * m(4);
end
c = (m(6) + dy2 + atan(1.3 * (dy2 + 1.06 * sin(dfai2 + m(5)))))^2 - 0.07;
ceq = [];
end

