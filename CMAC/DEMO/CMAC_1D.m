clear
max = 50000;%%%%最大循环次数
c = 5;%%%%%重复覆盖的区域的内存个数
data = 360;%%%%需要输入的数据个数
error = 0.00001;%%%误差精确度
alpha = 0.3;%%%%调整步长
 A = uint8(zeros(data,c));%%%用于存储每个数据所激活的内存空间地址
w = rand(1,80);%%%%初始化权值
%%%%%%%%求出训练数据的预测值%%%%%%%%
x = zeros(1, data);
d = zeros(1, data);
for i = 1:data
   x(i) = i / 360 * pi;
   d(i) = sin(x(i));
end
%%%%%%%%%%%%%hash编码%%%%%%%%%%%%%%%%%%%%%%
for i = 1 : c
  for j = 1 : data
    temp = 0;
    for k = 1 : i-1
      temp = ceil(k / c + 1) + temp;
    end
    A(j,i) = temp + (j-i) / c + 1;
  end
end
for m = 1 : max
  for i = 1 : data
    out = 0;
    for j = 1 : c
        out = w(A(i,j)) + out;
    end
    y(i) = out;
    e(i) = d(i) - y(i);
    if(abs(e(i)) < 0.001)
        continue;
    else
        for k = 1 : c
            w(A(i,k)) = w(A(i,k)) + alpha / 3 * e(i);
        end
    end
  end
%   plot(x,y,'g-');
end
%%%%%%%%%%%%%%%%%%%%%% 显示%%%%%%%%%%%%%%%%%%%%%
figure
plot(x,d,'r-');
hold on
plot(x,y,'g-');
hold on
plot(x,e,'b-');
