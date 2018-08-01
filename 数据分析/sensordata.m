close all;
clear all;
clc;
path = mfilename('fullpath'); %%��ȡ��ǰm�ļ��ľ���·��
datapath = strrep(path,'sensordata','data\');%%��ȡdata1�ļ��еľ���Ŀ¼
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
xlabel('���ݵ�');
ylabel('pitch');
figure(2)
plot(roll_data);
xlabel('���ݵ�');
ylabel('roll');
