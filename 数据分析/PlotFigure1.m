%%程序可以不考虑路径的问题，直接打开m文件即可运行
close all;
clear;
clc;
path = mfilename('fullpath'); %%获取当前m文件的绝对路径
datapath = strrep(path,'PlotFigure1','data\');%%获取data1文件夹的绝对目录
Files = dir(fullfile(datapath,'*gps.txt'));%%读取文件夹内的所有文件
lengthfiles = length(Files); 
m=1;
NUM = 56; %每组数据个数
% k=2;
%%--------------------读取data1内的数据-------------------------------------
for k=1:lengthfiles;    %%读取第K个文件内的数据
    fid=strcat(datapath,Files(k).name);                  %%定位要打开的文件
    [data]=textread(fid,'%s');
    L=length(data);
    j=1;
    for i=1:L
        if mod(i,NUM)==1
            str=char(data(i));
            str2=str(6:end);
            time=str2double(str2);                         %%得到时间数据
            hour=fix(time/10000);
            min=fix((time-hour*10000)/100);
            TIME(k,j)=time-hour*10000-min*100+hour*60*60+min*60;
            Time(k,j) = str2double(str2);
        end
        if mod(i,NUM)==2
            str=char(data(i));
            str2=str(3:end);
            x(k,j)=str2double(str2);                         %%得到车身统一坐标系横坐标数据
        end
        if mod(i,NUM)==3
            str=char(data(i));
            str2=str(3:end);
            y(k,j)=str2double(str2);                         %%得到车身统一坐标系纵坐标数据
            s(k,j)=((x(k,j)-x(k,1))^2+(y(k,j)-y(k,1))^2)^0.5;
        end 
        if mod(i,NUM)==4
            str=char(data(i));
            str2=str(7:end);
            theta(k,j)=str2double(str2);                     %%得到统一坐标系航向角数据
        end    
        if mod(i,NUM)==5
            str=char(data(i));
            str2=str(10:end);
            v(k,j)=str2double(str2);                         %%车身速度
        end   
        if mod(i,NUM)==6
            str=char(data(i));
            str2=str(10:end);
            d(k,j)=str2double(str2);                         %%得到横向偏差数据
        end
        if mod(i,NUM)==7
            str=char(data(i));
            str2=str(15:end);
            faiC(k,j)=str2double(str2);                      %%理论车轮转角
        end
         if mod(i,NUM)==8
            str=char(data(i));
            str2=str(4:end);
            AX(k,j)=str2double(str2);                      %%理论车轮转角
         end
         if mod(i,NUM)==9
            str=char(data(i));
            str2=str(4:end);
            AY(k,j)=str2double(str2);                      %%理论车轮转角
         end
         if mod(i,NUM)==10
            str=char(data(i));
            str2=str(4:end);
            BX(k,j)=str2double(str2);                      %%理论车轮转角
         end
         if mod(i,NUM)==11
            str=char(data(i));
            str2=str(4:end);
            BY(k,j)=str2double(str2);                      %%理论车轮转角
         end
        if mod(i,NUM)==12
            str=char(data(i));
            str2=str(7:end);
            north(k,j)=str2double(str2);                      %%理论车轮转角
        end
         if mod(i,NUM)==13
            str=char(data(i));
            str2=str(8:end);
            inValue(k,j)=str2double(str2);                      %%理论车轮转角
         end
         if mod(i,NUM)==14
            str=char(data(i));
            str2=str(7:end);
            x_mid(k,j)=str2double(str2);                      %%理论车轮转角
         end
         if mod(i,NUM)==15
            str=char(data(i));
            str2=str(7:end);
            y_mid(k,j)=str2double(str2);                      %%理论车轮转角
         end
        if mod(i,NUM)==16
            str=char(data(i));
            str2=str(8:end);
            AX_mid(k,j)=str2double(str2);                      %%理论车轮转角
        end
        if mod(i,NUM)==17
            str=char(data(i));
            str2=str(8:end);
            AY_mid(k,j)=str2double(str2);                      %%理论车轮转角
        end
        if mod(i,NUM)==18
            str=char(data(i));
            str2=str(8:end);
            BX_mid(k,j)=str2double(str2);                      %%理论车轮转角
         end
        if mod(i,NUM)==19
            str=char(data(i));
            str2=str(8:end);
            BY_mid(k,j)=str2double(str2);                      %%理论车轮转角
        end
        if mod(i,NUM)==20
            str=char(data(i));
            str2=str(14:end);
            d_mid(k,j)=str2double(str2);                      %%理论车轮转角
        end
        if mod(i,NUM)==21
            str=char(data(i));
            str2=str(10:end);
            velValue(k,j)=str2double(str2);                      %%理论车轮转角
        end
        if mod(i,NUM)==22
            str=char(data(i));
            str2=str(8:end);
            dnorth(k,j)=str2double(str2);                      %%理论车轮转角
        end
        if mod(i,NUM)==23
            str=char(data(i));
            str2=str(4:end);
            kp(k,j)=str2double(str2);                      %%理论车轮转角
        end
        if mod(i,NUM)==24
            str=char(data(i));
            str2=str(4:end);
            ki(k,j)=str2double(str2);                      %%理论车轮转角
        end
        if mod(i,NUM)==25
            str=char(data(i));
            str2=str(4:end);
            kd(k,j)=str2double(str2);                      %%理论车轮转角
         end
        if mod(i,NUM)==26
            str=char(data(i));
            str2=str(7:end);
            chose(k,j)=str2double(str2);                      %%理论车轮转角
        end
        if mod(i,NUM)==27
            str=char(data(i));
            str2=str(12:end);
            rolldegree(k,j)=str2double(str2);                      %%理论车轮转角
        end
        if mod(i,NUM)==28
            str=char(data(i));
            str2=str(11:end);
            diffTheta(k,j)=str2double(str2);
        end
        if mod(i,NUM)==29
            str=char(data(i));
            str2=str(16:end);
            expectendCircle(k,j)=str2double(str2);
        end
        if mod(i,NUM)==30
            str=char(data(i));
            str2=str(9:end);
            slopeAB(k,j)=str2double(str2);
        end
        if mod(i,NUM)==31
            str=char(data(i));
            str2=str(12:end);
            xaMid_coor(k,j)=str2double(str2);
        end
        if mod(i,NUM)==32
            str=char(data(i));
            str2=str(12:end);
            yaMid_coor(k,j)=str2double(str2);
        end
        if mod(i,NUM)==33
            str=char(data(i));
            str2=str(12:end);
            udiffTheta(k,j)=str2double(str2);
        end
        if mod(i,NUM)==34
            str=char(data(i));
            str2=str(15:end);
            udistancesMid(k,j)=str2double(str2);
        end
        if mod(i,NUM)==35
            str=char(data(i));
            str2=str(15:end);
            xcirclecenter(k,j)=str2double(str2);
        end
        if mod(i,NUM)==36
            str=char(data(i));
            str2=str(15:end);
            ycirclecenter(k,j)=str2double(str2);
        end
        if mod(i,NUM)==37
            str=char(data(i));
            str2=str(11:end);
            kp_circle(k,j)=str2double(str2);
        end
        if mod(i,NUM)==38
            str=char(data(i));
            str2=str(11:end);
            kd_circle(k,j)=str2double(str2);
        end
        if mod(i,NUM)==39
            str=char(data(i));
            str2=str(18:end);
            circleoutput(k,j)=str2double(str2);
        end
        if mod(i,NUM)==40
            str=char(data(i));
            str2=str(10:end);
            latitude(k,j)=str2double(str2);
        end
        if mod(i,NUM)==41
            str=char(data(i));
            str2=str(11:end);
            longitude(k,j)=str2double(str2);
        end
        if mod(i,NUM)==42
            str=char(data(i));
            str2=str(11:end);
            rollAngle(k,j)=str2double(str2);
        end
        if mod(i,NUM)==43
            str=char(data(i));
            str2=str(12:end);
            pitchAngle(k,j)=str2double(str2);
        end
        if mod(i,NUM)==46
            str=char(data(i));
            str2=str(13:end);
            x_mid_after(k,j)=str2double(str2);
        end
        if mod(i,NUM)==47
            str=char(data(i));
            str2=str(13:end);
            y_mid_after(k,j)=str2double(str2);
        end
        if mod(i,NUM)==48
            str=char(data(i));
            str2=str(16:end);
            d_mid_tdfilter(k,j)=str2double(str2);
        end
        if mod(i,NUM)==49
            str=char(data(i));
            str2=str(4:end);
            z1(k,j)=str2double(str2); 
        end
        if mod(i,NUM)==50
            str=char(data(i));
            str2=str(4:end);
            z2(k,j)=str2double(str2); 
        end
        if mod(i,NUM)==51
            str=char(data(i));
            str2=str(4:end);
            z3(k,j)=str2double(str2); 
        end
        if mod(i,NUM)==52
            str=char(data(i));
            str2=str(4:end);
            z4(k,j)=str2double(str2); 
        end
        if mod(i,NUM)==53
            str=char(data(i));
            str2=str(10:end);
            frontout(k,j)=str2double(str2); 
        end
        if mod(i,NUM)==54
            str=char(data(i));
            str2=str(4:end);
            k1(k,j)=str2double(str2); 
        end
        if mod(i,NUM)==55
            str=char(data(i));
            str2=str(4:end);
            k2(k,j)=str2double(str2); 
        end
        if mod(i,NUM)==0
            str=char(data(i));
            str2=str(3:end);
            T(k,j)=str2double(str2); 
            j=j+1;
        end
        
    end
        
    limit(k)=L/NUM;
    
    d_mid_inte(k,1)=0;
        for i=2:limit(k)
        if abs(d_mid(k,i))<0.15
            if d_mid_inte(k,i-1)>200
                if d_mid(k,i)>0
                    d_mid_inte(k,i)=d_mid_inte(k,i-1);
                else
                    d_mid_inte(k,i) = d_mid_inte(k,i-1)+d_mid(k,i);
                end
            elseif d_mid_inte(k,i-1)<-200
                if d_mid<0
                    d_mid_inte(k,i)=d_mid_inte(k,i-1);
                else
                    d_mid_inte(k,i)=d_mid_inte(k,i-1)+d_mid(k,i);
                end
            else d_mid_inte(k,i)=d_mid_inte(k,i-1)+d_mid(k,i);
            end
        else
            d_mid_inte(k,i) = d_mid_inte(k,i-1);
        end
    end
    
%     TIME = TIME - TIME(1);
    %% 行驶轨迹图
%     figure(m);
%     plot(x_mid(k,1:limit(k))-x_mid(k,1),y_mid(k,1:limit(k))-y_mid(k,1));
%     m=m+1;
%     figure(m)
%     plot(s(k,1:limit(k)),d_mid(k,1:limit(k)));
%     m=m+1;

%     figure(m)
%     plot(s(k,1:limit(k)),d_mid(k,1:limit(k)),'-');
%     hold on;
%     plot(s(k,1:limit(k)),d_mid_tdfilter(k,1:limit(k)),'-*');
%     hold on;
%     plot(s(k,1:limit(k)),z1(k,1:limit(k)),'-o');
%     m=m+1;
%     figure(m)
%     plot(s(k,1:limit(k)),-z2(k,1:limit(k))*180/pi,'-*')
%     hold on;
%     plot(s(k,1:limit(k)),dnorth(k,1:limit(k)),'-')
%     m=m+1;
    
    
    
     figure(m)
    plot(d_mid(k,1:limit(k)),'-b');
    hold on;
%     plot(d_mid_tdfilter(k,1:limit(k)),'-*');
%     hold on;
    plot(z1(k,1:limit(k)),'--r');
    xlabel('n');
    ylabel('横向偏差d/m');
    legend('原始横向偏差','状态观测器输出');
    title('线性状态观测器');
    
    m=m+1;
    
    figure(m)
%     plot(1:limit(k),(z2(k,1:limit(k))),'--r',1:limit(k),-sin(dnorth(k,1:limit(k))/180*pi).*v(k,1:limit(k))/3.6,'-b');
    plot(1:limit(k),(z2(k,1:limit(k))),'--r',1:limit(k),-sin(dnorth(k,1:limit(k))/180*pi)*0.7,'-b');
    xlabel('n');
    ylabel('航向角偏差');
    title('线性状态观测器');
    legend('z2','z2测量值');
    m=m+1;

    
%     figure(m)
%     plot(z2(k,1:limit(k)))
%     hold on;
%     plot(-0.15*sin(dnorth(k,1:limit(k))/180*pi));
%     m=m+1;
%     
% %     figure(m)
% %     plot(z4(k,1:limit(k)),'*')
% %     m=m+1;
%     
%     figure(m)
%     plot(d_mid(k,1:limit(k)),'-r');
%     hold on;
%     plot(dnorth(k,1:limit(k))/180*pi,'-b');
%     hold on;
%     plot(frontout(k,1:limit(k)),'-*');
%     m=m+1;
%     
    figure(m)
%     plot(0.8*z1(k,1:limit(k))+3.5*z2(k,1:limit(k)),'--r');
%     hold on
%     plot(z4(k,1:limit(k))*0.5/0.49,'-b');
%     hold on;
    plot(-dnorth(k,1:limit(k))/180*pi+atan(1.4/0.69*(d_mid(k,1:limit(k))-1.06*sin(pi/180*dnorth(k,1:limit(k)))))+0.05*d_mid_inte(k,1:limit(k)),'-b');
    hold on;
    plot(((0.8*z1(k,1:limit(k))+3.5*z2(k,1:limit(k)))),'--r');
%     plot(frontout(k,1:limit(k)),'--r');
    hold on;
%     plot(atan(0.8*z1(k,1:limit(k))+3.5*z2(k,1:limit(k))+z4(k,1:limit(k))*0.5/0.49),'-.r');
%     hold on;
    plot(atan(0.8*z1(k,1:limit(k))+3.5*z2(k,1:limit(k)))-0.1/0.65/0.65*z4(k,1:limit(k)),'-Dr');
    xlabel('n');
    ylabel('控制量');
    legend('常规控制方法','自抗扰控制无补偿','自抗扰有补偿');
    m=m+1;
    
end

