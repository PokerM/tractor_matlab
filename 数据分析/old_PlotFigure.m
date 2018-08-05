%%������Բ�����·�������⣬ֱ�Ӵ�m�ļ���������
close all;
clear all;
clc;
path = mfilename('fullpath'); %%��ȡ��ǰm�ļ��ľ���·��
datapath = strrep(path,'old_PlotFigure','data\');%%��ȡdata1�ļ��еľ���Ŀ¼
Files = dir(fullfile(datapath,'68gps.txt'));%%��ȡ�ļ����ڵ������ļ�
lengthfiles = length(Files); 
m=1;
NUM = 48; %ÿ�����ݸ���
num2=1;
num5=1;
num6=1;
num7=1;
% k=2;

%parameter
wheel_spd = 55;         %������ת�٣�r/min
l = 1.06;               %�����ȣ� m
initTheta = 199.9;      %���ֳ�ʼת�ǵ��෴��

vmax = 0.4043;          %�����������õ��ĳ����ٶ�
vmid = 0.3402;
vmin = 0.2695;

wheel_spd_rad_s = wheel_spd / 60 * 360 * pi /180;     %������ת�٣�rad/s
front_wheel_angle_spd = wheel_spd_rad_s / 1.7;
%%--------------------��ȡdata1�ڵ�����-------------------------------------
for k=1:lengthfiles   %%��ȡ��K���ļ��ڵ�����
    fid=strcat(datapath,Files(k).name);                  %%��λҪ�򿪵��ļ�
    [data]=textread(fid,'%s');
    L=length(data);
    j=1;
    for n=1:L 
        if mod(n,NUM)==1
            str=char(data(n));
            str2=str(6:end);
            time=str2double(str2);                         %%�õ�ʱ������
            hour=fix(time/10000);
            minute=fix((time-hour*10000)/100);
            TIME(k,j)=time-hour*10000-minute*100+hour*60*60+minute*60;
            Time(k,j) = str2double(str2);
        end
        if mod(n,NUM)==2
            str=char(data(n));
            str2=str(3:end);
            x(k,j)=str2double(str2);                         %%�õ�����ͳһ����ϵ����������
        end
        if mod(n,NUM)==3
            str=char(data(n));
            str2=str(3:end);
            y(k,j)=str2double(str2);                         %%�õ�����ͳһ����ϵ����������
            s(k,j)=((x(k,j)-x(k,1))^2+(y(k,j)-y(k,1))^2)^0.5;
        end 
        if mod(n,NUM)==4
            str=char(data(n));
            str2=str(7:end);
            theta(k,j)=str2double(str2);                     %%�õ�ͳһ����ϵ���������
        end    
        if mod(n,NUM)==5
            str=char(data(n));
            str2=str(10:end);
            v(k,j)=str2double(str2);                         %%�����ٶ�
        end   
        if mod(n,NUM)==6
            str=char(data(n));
            str2=str(10:end);
            d(k,j)=str2double(str2);                         %%�õ�����ƫ������
        end
        if mod(n,NUM)==7
            str=char(data(n));
            str2=str(15:end);
            faiC(k,j)=str2double(str2);                      %%���۳���ת��
        end
         if mod(n,NUM)==8
            str=char(data(n));
            str2=str(4:end);
            AX(k,j)=str2double(str2);                      %%A��x����
         end
         if mod(n,NUM)==9
            str=char(data(n));
            str2=str(4:end);
            AY(k,j)=str2double(str2);                      %%A��y����
         end
         if mod(n,NUM)==10
            str=char(data(n));
            str2=str(4:end);
            BX(k,j)=str2double(str2);                      %%B��x����
         end
         if mod(n,NUM)==11
            str=char(data(n));
            str2=str(4:end);
            BY(k,j)=str2double(str2);                      %%B��y����
         end
        if mod(n,NUM)==12
            str=char(data(n));
            str2=str(7:end);
            north(k,j)=str2double(str2);                      %%���������
        end
         if mod(n,NUM)==13
            str=char(data(n));
            str2=str(8:end);
            inValue(k,j)=str2double(str2);                      %%
         end
         if mod(n,NUM)==14
            str=char(data(n));
            str2=str(7:end);
            x_mid(k,j)=str2double(str2);                      %%��������x����
         end
         if mod(n,NUM)==15
            str=char(data(n));
            str2=str(7:end);
            y_mid(k,j)=str2double(str2);                      %%��������y����
         end
        if mod(n,NUM)==16
            str=char(data(n));
            str2=str(8:end);
            AX_mid(k,j)=str2double(str2);                      %%������A��x����
        end
        if mod(n,NUM)==17
            str=char(data(n));
            str2=str(8:end);
            AY_mid(k,j)=str2double(str2);                      %%������A��y����
        end
        if mod(n,NUM)==18
            str=char(data(n));
            str2=str(8:end);
            BX_mid(k,j)=str2double(str2);                      %%������B��x����
         end
        if mod(n,NUM)==19
            str=char(data(n));
            str2=str(8:end);
            BY_mid(k,j)=str2double(str2);                      %%������B��y����
        end
        if mod(n,NUM)==20
            str=char(data(n));
            str2=str(14:end);
            d_mid(k,j)=str2double(str2);                      %%���������ƫ��
        end
        if mod(n,NUM)==21
            str=char(data(n));
            str2=str(10:end);
            velValue(k,j)=str2double(str2);                      %%���۳���ת��
        end
        if mod(n,NUM)==22
            str=char(data(n));
            str2=str(8:end);
            dnorth(k,j)=str2double(str2);                      %%�����ƫ��
        end
        if mod(n,NUM)==23
            str=char(data(n));
            str2=str(4:end);
            kp(k,j)=str2double(str2);                      %%
        end
        if mod(n,NUM)==24
            str=char(data(n));
            str2=str(4:end);
            ki(k,j)=str2double(str2);                      %%
        end
        if mod(n,NUM)==25
            str=char(data(n));
            str2=str(4:end);
            kd(k,j)=str2double(str2);                      %%
         end
        if mod(n,NUM)==26
            str=char(data(n));
            str2=str(7:end);
            chose(k,j)=str2double(str2);                      %%�����㷨
        end
        if mod(n,NUM)==27
            str=char(data(n));
            str2=str(12:end);
            rolldegree(k,j)=str2double(str2);                      %%���۳���ת��
        end
        if mod(n,NUM)==28
            str=char(data(n));
            str2=str(11:end);
            diffTheta(k,j)=str2double(str2);                   %%�����ƫ��
        end
        if mod(n,NUM)==29
            str=char(data(n));
            str2=str(16:end);
            expectendCircle(k,j)=str2double(str2);              
        end
        if mod(n,NUM)==30
            str=char(data(n));
            str2=str(9:end);
            slopeAB(k,j)=str2double(str2);
        end
        if mod(n,NUM)==31
            str=char(data(n));
            str2=str(12:end);
            xaMid_coor(k,j)=str2double(str2);
        end
        if mod(n,NUM)==32
            str=char(data(n));
            str2=str(12:end);
            yaMid_coor(k,j)=str2double(str2);
        end
        if mod(n,NUM)==33
            str=char(data(n));
            str2=str(12:end);
            udiffTheta(k,j)=str2double(str2);
        end
        if mod(n,NUM)==34
            str=char(data(n));
            str2=str(15:end);
            udistancesMid(k,j)=str2double(str2);
        end
        if mod(n,NUM)==35
            str=char(data(n));
            str2=str(15:end);
            xcirclecenter(k,j)=str2double(str2);
        end
        if mod(n,NUM)==36
            str=char(data(n));
            str2=str(15:end);
            ycirclecenter(k,j)=str2double(str2);
        end
        if mod(n,NUM)==37
            str=char(data(n));
            str2=str(11:end);
            kp_circle(k,j)=str2double(str2);
        end
        if mod(n,NUM)==38
            str=char(data(n));
            str2=str(11:end);
            kd_circle(k,j)=str2double(str2);
        end
        if mod(n,NUM)==39
            str=char(data(n));
            str2=str(18:end);
            circleoutput(k,j)=str2double(str2);
        end
        if mod(n,NUM)==40
            str=char(data(n));
            str2=str(10:end);
            latitude(k,j)=str2double(str2);
        end
        if mod(n,NUM)==41
            str=char(data(n));
            str2=str(11:end);
            longitude(k,j)=str2double(str2);
        end
        if mod(n,NUM)==42
            str=char(data(n));
            str2=str(11:end);
            rollAngle(k,j)=str2double(str2);            %�����
        end
        if mod(n,NUM)==43
            str=char(data(n));
            str2=str(12:end);
            pitchAngle(k,j)=str2double(str2);           %������
        end

        if mod(n,NUM)==46
            str=char(data(n));
            str2=str(13:end);
            x_mid_after(k,j)=str2double(str2);
        end
        if mod(n,NUM)==47
            str=char(data(n));
            str2=str(13:end);
            y_mid_after(k,j)=str2double(str2);
        end
        if mod(n,NUM)==0
            str=char(data(n));
            str2=str(10:end);
            turnflag(k,j)=str2double(str2);
            j=j+1;
        end
    end
        
    limit(k)=fix(L/NUM);
    dx_mat = load('dx_sim.mat');
    dy_mat = load('dy_sim.mat');

    dx_data = dx_mat.dx_sim;
    dy_data = dy_mat.dy_sim;
    d_sim = zeros(1, length(x_mid));
    x_data = zeros(1, length(x_mid));
    y_data = zeros(1, length(x_mid));
    N = 10;                             %���沽��
    data_num = fix(length(dx_data) / N) * N;
    
%     for n = 1:fix(length(dx_data) / N)
%         for j = 1 : N
%             num = (n - 1) * N + j;
%             if(j == 1)
%                 x_data(num) = x_mid(k, num);
%                 y_data(num) = y_mid(k, num);
%             else
%                 x_data(num) = x_data(num - 1) + dy_data(num - 1);
%                 y_data(num) = y_data(num - 1) + dx_data(num - 1);
%             end
%         end
%         if n == 1
%             x_data(1) = x_mid(k, 1);
%             y_data(1) = y_mid(k, 1);
%         else
%             x_data(n) = x_data(n - 1) + dy_data(n - 1);
%             y_data(n) = y_data(n - 1) + dx_data(n - 1);
%         end
%     end

%     for n = 1 : length(x_mid) - data_num
%         num = data_num + n;
%         x_data(num) = x_data(num - 1) + dy_data(num - 1);
%         y_data(num) = y_data(num - 1) + dx_data(num - 1);
%     end
%     tanAB = tan(6.27925);
%     for n = 1 : length(x_data)
%         d_sim(n) = (tanAB * (x_data(n) - x_data(1)) - 0.0421 - (y_data(n) - y_data(1))) / sqrt(1 + tanAB * tanAB);
%     end 
%     if(chose(k,1)==0)
%         legend(strcat('kp=',num2str(kp(k,1)),',ki=',num2str(ki(k,1)),',kd=',num2str(kd(k,1))));
%         title(strrep(Files(k).name,'gps.txt','PID'));
%     end
%     if (chose(k,1)==1)
%         legend(strcat('Ld=',num2str(ki(k,1)),',ki=',num2str(ki(k,1))));
%         title(strrep(Files(k).name,'gps.txt','��׷��ģ��'));
%     end
%     if (chose(k,1)==2)
%         legend(strcat('kp=',num2str(kp(k,1)),',ki=',num2str(ki(k,1)),',kd=',num2str(kd(k,1))));
%         title(strrep(Files(k).name,'gps.txt','��PDʵ�ʹ켣'));
%         min2(num2)=min(d_mid(k,1:limit(k)));
%         max2(num2)=max(d_mid(k,1:limit(k)));
%         mean2(num2)=mean(d_mid(k,1:limit(k)));
%         meanabs2(num2)=mean(abs(d_mid(k,1:limit(k))));
%         var2(num2)=var(d_mid(k,1:limit(k)));
%         num2=num2+1;
%     end
%     if (chose(k,1)==5)
%         legend(strcat('kp=',num2str(kp(k,1)),',ki=',num2str(ki(k,1)),',kd=',num2str(kd(k,1))));
%         title(strrep(Files(k).name,'gps.txt','ǰ���������㷨'));
%         min5(num5)=min(d_mid(k,1:limit(k)));
%         max5(num5)=max(d_mid(k,1:limit(k)));
%         mean5(num5)=mean(d_mid(k,1:limit(k)));
%         meanabs5(num5)=mean(abs(d_mid(k,1:limit(k))));
%         var5(num5)=var(d_mid(k,1:limit(k)));
%         num5=num5+1;
%     end
%     if (chose(k,1)==6)
%         legend(strcat('kp=',num2str(kp(k,1)),',ki=',num2str(ki(k,1)),',kd=',num2str(kd(k,1))));
%         title(strrep(Files(k).name,'gps.txt','˹̹���Ľ��㷨'));
%         min6(num6)=min(d_mid(k,1:limit(k)));
%         max6(num6)=max(d_mid(k,1:limit(k)));
%         mean6(num6)=mean(d_mid(k,1:limit(k)));
%         meanabs6(num6)=mean(abs(d_mid(k,1:limit(k))));
%         var6(num6)=var(d_mid(k,1:limit(k)));
%         num6=num6+1;
%     end
%     if (chose(k,1)==7)
%         legend(strcat('kp=',num2str(kp(k,1)),',ki=',num2str(ki(k,1)),',kd=',num2str(kd(k,1))));
%         title(strrep(Files(k).name,'gps.txt','�����㷨'));
%         min7(num7)=min(d_mid(k,1:limit(k)));
%         max7(num7)=max(d_mid(k,1:limit(k)));
%         mean7(num7)=mean(d_mid(k,1:limit(k)));
%         meanabs7(num7)=mean(abs(d_mid(k,1:limit(k))));
%         var7(num7)=var(d_mid(k,1:limit(k)));
%         num7=num7+1;
%     end
%     subplot(2,1,2)
%     plot(s(k,1:limit(k)),d_mid(k,1:limit(k)));
%     xlabel('�н�����/m');
%     ylabel('����ƫ��/m');
%     m=m+1;    

    
%     figure(m)
% %     plot(x_mid(k,1:limit(k))-x_mid(k,1),y_mid(k,1:limit(k))-y_mid(k,1),'-*');
% %     hold on;
%     plot(x_mid_after(k,1:limit(k))-x_mid_after(k,1),y_mid_after(k,1:limit(k))-y_mid_after(k,1),'-');
%    
%     for n=2:limit(k)
%         if((xcirclecenter(k,n-1)==0) && (xcirclecenter(k,n)~=0))
%             hold on;
%             x_circlecenter = xcirclecenter(k,n)-x_mid(k,1);
%             y_circlecenter = ycirclecenter(k,n)-y_mid(k,1);
%             t=0:0.01:2*pi;
%             x_matlab=x_circlecenter+1.3*cos(t);
%             y_matlab=y_circlecenter+1.3*sin(t);
%             plot(x_matlab,y_matlab);
%         end
%     end
%     
%     axis equal;
%     axis([-45 15 -20 1]);
%     xlabel('������/m');
%     ylabel('������/m');
%     legend(['chose=',num2str(chose(k,1))]);
%     m=m+1;
%     figure(m)
%     plot(d_mid(k,1:limit(k)),'-');
%     xlabel('���ݵ�');
%     ylabel('����ƫ��/m');
%     legend(['chose=',num2str(chose(k,1))]);
%     m=m+1;

%     time_all = Time(limit(k)) - Time(1);
%     x_diff = x_mid(k, limit(k)) - x_mid(k, 1);
%     y_diff = y_mid(k, limit(k)) - y_mid(k, 1);
%     v = sqrt(x_diff * x_diff + y_diff * y_diff) / time_all;
    
    numline=1;
    for n=1:limit(k)
        if (turnflag(k,n)==0)
%             &&(abs(d_mid(k,n)) < 0.5)
            d_mid_line(numline)=d_mid(k,n);
            pitch(numline) = pitchAngle(k, n);
            mroll(numline) = rollAngle(k, n);
            sin_roll(numline) = sin(mroll(numline) * pi / 180);
            yaw(numline) = north(k, n);
            d_north(numline) = dnorth(k, n);
            calculFai(numline) = faiC(k, n);    %faic,rad
            x_mid_1(numline) = x_mid(k, n);
            y_mid_1(numline) = y_mid(k, n);
            d_theta(numline) = theta(k, n) + initTheta;
            if(n ~= limit(k))
                time_val(numline) = Time(k, n + 1) - Time(k, n);             
            end
            numline=numline+1;
        end
    end
    
    for n = 1 : numline - 1
        comp(n) = calculFai(n) - 1.7 * d_theta(n);
    end
    if(0)
        figure(m)
        plot(comp)
        m = m + 1;
    end
    dis(1) = 0;
    for n = 1 : (length(x_mid_1) - 1)
        dx(n) = x_mid_1(n + 1) - x_mid_1(n);
        dy(n) = y_mid_1(n + 1) - y_mid_1(n);
        dis(n + 1) = dis(n) + sqrt(dx(n) * dx(n) + dy(n) * dy(n));
    end
    
    %����ʱ����
    if(0)
        figure(m)
        plot(time_val, 'ro');
        title('����ʱ����');
        xlabel('���ݵ�');
        ylabel('ʱ����(s)');
        m = m + 1;
    end
    %����ת����ʵ��ת�ǶԱ�
    if(0)
        figure(m)
        plot(calculFai * 180 / pi);
        hold on
        plot(d_theta);
        title('����ת����ʵ��ת��ֵ');
        legend('����ת��', 'ʵ��ת��ֵ');
        m = m + 1;
    end
    
    %����������ϵ
    if(0)
       figure(m) 
       plot(dis, d_mid_line);
       hold on
       plot([0 20],[0.05 0.05]);
       hold on 
       plot([0 20],[-0.05 -0.05]);
       m = m + 1;
       title('����-���');
       xlabel('�ƶ�����(m)');
       ylabel('�������(m)');
    end
    
    %�����ƫ��
    if(1)
        figure(m)
        plot(d_theta);
        m = m + 1;
    end
    
    %����ת��������
    if(0)
        figure(m)
        yyaxis left 
        plot(calculFai);
        yyaxis right
        plot(mroll);
        m = m + 1;
    end
    
    for n = 1 : length(x_mid(k,1:limit(k)))
        x_r(n) = (x_mid(k, n) - 21.3) * cos(-6.27925) - (y_mid(k, n) + 0.1259) * sin(-6.27925) + 21.3;
        y_r(n) = (x_mid(k, n) - 21.3) * sin(-6.27925) + (y_mid(k, n) + 0.1259) * cos(-6.27925) - 0.1259;
    end
    % ��ʻ�켣ͼ    
    if(0)
        figure(m);
        yyaxis left
        plot(x_mid_1 - x_mid_1(1),y_mid_1 - y_mid_1(1),'b');
        plot(x_r - x_r(1), y_r - y_r(1), 'b');
        xlabel('������/m');
        ylabel('������/m');
        hold on
        plot(x_data - x_data(1), y_data - y_data(1), 'r');
        hold on 
        x = 0 : 0.1 :120;
        y = 0 * x;
        plot(x,y,'g');
        yyaxis right
        plot(x_mid(k,1:limit(k))-x_mid(k,1), mroll, 'r');
        mid_roll = sum(mroll / length(mroll));
        mid_roll_ve = mid_roll * ones(1, length(mroll));
        hold on 
        plot(x_mid(k,1:limit(k))-x_mid(k,1), mid_roll_ve, 'y-');
        hold on 
        plot(dx_data - dx_data(1), pitch, 'k');
        m = m + 1;
    end
    
    %����ƫ����Ԥ������ƫ��
    if(0)
        figure(m)
        x = 1: length(x_data);
        plot(x, d_mid_line(k,1:length(x_data)));
        hold on
        plot(x, d_sim); 
        m = m + 1;
    end
    
    %����ƫ����ʵ��ƫ��
    if(0)
        figure(m)
        yyaxis left
        x = 1: length(x_mid);
        plot(d_sim - d_mid_line(k,1:length(x_mid)));
        axis([0, 2000, -0.2, 0.2]);
        yyaxis right
        plot(x, mroll);
        m = m + 1;
    end
    
     %��������Ԥ��
    if(0)
        min_i = 1; 
        mid_i = 1; 
        max_i = 1; 
        x_sim(1) = x_mid(k, 1);
        y_sim(1) = y_mid(k, 1);
        for n = 1 : numline - 2
            fai = yaw(n) * pi /180;                       %�����
            c_theta = d_theta(n) * pi / 180;               %ǰ��ƫ��
            if(calculFai(n) > c_theta)          %����ת��
                ub = calculFai(n);
                lb = c_theta;
                v_theta = front_wheel_angle_spd;      %todoǰ��ת���ٶ�
            else
                ub = c_theta;
                lb = calculFai(n);
                v_theta = -front_wheel_angle_spd;      %todoǰ��ת���ٶ�
            end
            %v_theta
            if(abs(d_mid_line(k, n)) > 0.12 || abs(d_north(n) > 3.2))
                v = vmin;
            else
                if(abs(d_mid_line(k, n)) < 0.05 || abs(d_north(n) < 1.2))
                    v = vmax;
                else
                    v = vmid;
                end
            end
            stop_time = time_val(n);
            sim('singleStepPredict');
            x_sim(n + 1) = x_mid(k, n) + simout.data(length(simout.data),1);
            y_sim(n + 1) = y_mid(k, n) + simout.data(length(simout.data),2);
        end
    end
    
    %����ʽ��������
    if(0)
        min_i = 1; 
        mid_i = 1; 
        max_i = 1; 
        dx_sim = zeros(1, numline - 2);
        dy_sim = zeros(1, numline - 2);
        for n = 1 : numline - 2
            fai = yaw(n) * pi /180;                       %�����
            c_theta = d_theta(n) * pi / 180;               %ǰ��ƫ��
            if(calculFai(n) > c_theta)          %����ת��
                ub = calculFai(n);
                lb = c_theta;
                v_theta = front_wheel_angle_spd;      %todoǰ��ת���ٶ�
            else
                ub = c_theta;
                lb = calculFai(n);
                v_theta = -front_wheel_angle_spd;      %todoǰ��ת���ٶ�
            end
            if(abs(d_mid_line(k, n)) > 0.12 || abs(d_north(n) > 3.2))
                v = vmin;
            else
                if(abs(d_mid_line(k, n)) < 0.05 || abs(d_north(n) < 1.2))
                    v = vmax;
                else
                    v = vmid;
                end
            end
            stop_time = time_val(n);
            sim('singleStepPredict');
            dx_sim(n) = simout.data(length(simout.data),1);
            dy_sim(n) = simout.data(length(simout.data),2);
        end
    end
    
    %����sin��roll��
    if(0)
        figure(m)
        plot(new_sin_roll, new_d, 'ro');
        m = m + 1;
    end
    
    %����d-pitch
    if(0)
        figure(m)
        x = 1:numline-1;
        [AX] = plotyy(x,d_mid_line(k,1:(numline-1)), x, pitch);
        xlabel('���ݵ�');
        set(get(AX(1),'ylabel'),'string','ֱ�߸��ٺ���ƫ��');
        set(get(AX(2),'ylabel'),'string','������');
        m=m+1;
    end
    
    %����d-roll
    if(0)
        figure(m)
        x = 1:numline-1;
        yyaxis left
        plot(x,d_mid_line(k,1:(numline-1)));
        xlabel('���ݵ�');
        ylabel('���');
        hold on
        d_max = max(d_mid_line(k,1:numline-1));
        d_min = min(d_mid_line(k,1:numline-1));
        dnorth_max = max(d_north);
        dnorth_min = min(d_north);
        scale = (d_max - d_min) / (dnorth_max - dnorth_min);
        dnorth_scale = zeros(1, numline - 1);
        for n = 1 : numline - 1
            dnorth_scale(n) = dnorth(n) * scale;
        end
    end
    
    %����pitch-roll
    if(0)       
        figure(m)
        x = 1:numline-1;
        [AX] = plotyy(x,pitch, x, roll);
        xlabel('���ݵ�');
        set(get(AX(1),'ylabel'),'string','������');
        set(get(AX(2),'ylabel'),'string','�����');
        m=m+1;
    end
    
    %����yaw-roll
    if(0)
        figure(m)
        x = 1:numline-1;
        [AX] = plotyy(x,yaw, x, roll);
        xlabel('���ݵ�');
        set(get(AX(1),'ylabel'),'string','�����');
        set(get(AX(2),'ylabel'),'string','�����');
        m=m+1;
    end
    
    if(0)
        figure(m)
        time_interval = zeros(1,limit(k)-1);
        for n = 2:1:limit(k)
            time_interval(n-1) = Time(k,n) - Time(k,n-1);
        end
        plot(time_interval,'ro');
        title('GPSʱ����');
        ylabel('ʱ��(s)');
        m = m + 1;
    end
    
    %���ƺ����ƫ��
    if(0)
        figure(m)
        plot(dnorth);
        m = m + 1;
        title('�����ƫ��');
        xlabel('���ݵ�');
        ylabel('ƫ��');
    end
    
    %���ƺ����
    if(0)
        figure(m)
        plot(north);
        m = m + 1;
        title('�������');
    end
    mean1=mean(d_mid_line);
    abs_mean=mean(abs(d_mid_line));
    var=var(d_mid_line);
end


