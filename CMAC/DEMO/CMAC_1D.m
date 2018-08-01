clear
max = 50000;%%%%���ѭ������
c = 5;%%%%%�ظ����ǵ�������ڴ����
data = 360;%%%%��Ҫ��������ݸ���
error = 0.00001;%%%��ȷ��
alpha = 0.3;%%%%��������
 A = uint8(zeros(data,c));%%%���ڴ洢ÿ��������������ڴ�ռ��ַ
w = rand(1,80);%%%%��ʼ��Ȩֵ
%%%%%%%%���ѵ�����ݵ�Ԥ��ֵ%%%%%%%%
x = zeros(1, data);
d = zeros(1, data);
for i = 1:data
   x(i) = i / 360 * pi;
   d(i) = sin(x(i));
end
%%%%%%%%%%%%%hash����%%%%%%%%%%%%%%%%%%%%%%
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
%%%%%%%%%%%%%%%%%%%%%% ��ʾ%%%%%%%%%%%%%%%%%%%%%
figure
plot(x,d,'r-');
hold on
plot(x,y,'g-');
hold on
plot(x,e,'b-');
