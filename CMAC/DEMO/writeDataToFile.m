w = load('new_w.mat');
w = w.w;
fid = fopen('data3.txt', 'w');
for i = 1 :3
    for j = 1 :3
        for k = 1 : 4
            fprintf(fid, '%.4f', w(i,j,k));
            fprintf(fid, ',');
        end
        fprintf(fid, '\n');
    end 
end
fclose(fid);