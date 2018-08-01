function res = get_degree(input,max)
    temp = {};
    temp{1} = [1 1 1 1];
    temp{2} = [2 1 1 1];
    temp{3} = [2 2 1 1];
    temp{4} = [2 2 2 1];
    temp{5} = [2 2 2 2];
    temp{6} = [3 2 2 2];
    temp{7} = [3 3 2 2];
    temp{8} = [3 3 3 2];
    temp{9} = [3 3 3 3];   
    temp{10} = [4 3 3 3];
    temp{11} = [4 4 3 3];
    temp{12} = [4 4 4 3];
    temp{13} = [4 4 4 4];
    if input >= max
        res = temp{13};
    elseif input <= -max
        res = temp{1};
    else
        i = 13.0 * (input + max) / (2 * max);
        res = temp{ceil(i)};
    end
end

