function data_analysis(filename)
    temp_f = fopen(filename,'r');
    tline = fgetl(temp_f);
    len = 0;
    if(~isempty(tline))
        len = len + 1;
        c = strsplit(tline,':');
        start_str = c{1};
        temp_result = {};
        location = {};
        tline = fgetl(temp_f);
        find_len = false;
        while(tline)
            tline = fgetl(temp_f);
        end
%         while(~find_len)
%             len = len + 1;
%             if(ischar(tline) && contains(tline,'dnorth'))
%                 location = [location len]
%     %             c = strsplit(temp_line,':');
%     %             temp_result = [temp_result c{2}];
%             end
%             if(ischar(tline) && contains(tline,start_str))
%                 find_len = true;
%                 len = len - 1;
%             end
%             tline = fgetl(temp_f);
%         end
    end
    res = cell2mat(temp_result)
end

