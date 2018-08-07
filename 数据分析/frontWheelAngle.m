close all;
clear all;
clc;
path = mfilename('fullpath'); %%��ȡ��ǰm�ļ��ľ���·��
datapath = strrep(path,'frontWheelAngle','data\');%%��ȡdata1�ļ��еľ���Ŀ¼
Files = dir(fullfile(datapath,'21frontwheel.txt'));
fid = strcat(datapath,Files.name);
[data] = textread(fid, '%s'); 
N = 1;
M = 1;
for i = 1 : length(data)
    temp = strsplit(char(data(i)), ',');
    if length(temp) ==2
        pulse(N) = str2double(cell2mat(temp(2)));
        N = N + 1;
    else
        if M == 1
            t = str2double(cell2mat(temp(1)));
        end
        time(M) = str2double(cell2mat(temp(1))) - t;
        front_wheel_angle(M) = str2double(cell2mat(temp(2)));
        M = M + 1;
    end
end
plot(time,front_wheel_angle);
xlabel('time');
ylabel('front wheel angle');