function res = get_degree(input,max)
    temp = {};
    temp{1} = [1 1 1 1];
    temp{2} = [2 1 1 1];
    temp{3} = [2 2 1 1];
    temp{4} = [2 2 2 1];
    temp{5} = [2 2 2 2];
    for i = 1 : 8
        temp{4*i + 2} = temp{2} + i;
        temp{4*i + 3} = temp{3} + i;
        temp{4*i + 4} = temp{4} + i;
        temp{4*i + 5} = temp{5} + i;
    end
    if input >= max
        res = temp{37};
    elseif input <= -max
        res = temp{1};
    else
        i = 37.0 * (input + max) / (2 * max);
        res = temp{ceil(i)};
    end
end

