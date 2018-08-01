close all;
clear all;
clc;
path = mfilename('fullpath'); %%获取当前m文件的绝对路径
datapath = strrep(path,'sensordata','data\');%%获取data1文件夹的绝对目录
Files = dir(fullfile(datapath,'pitchroll_4.txt'));
fid = strcat(datapath,Files.name);
[data] = textread(fid, '%s');
pitch_data = zeros(1, 4000);
roll_data = zeros(1, 4000);
for i = 1 : 4000
    temp = strsplit(char(data(i)), ',');
    pitch_data(i) = str2double(cell2mat(temp(2)));
    roll_data(i) = str2double(cell2mat(temp(3)));
end
plot(pitch_data);
xlabel('数据点');
ylabel('pitch');
figure(2)
plot(roll_data);
xlabel('数据点');
ylabel('roll');
