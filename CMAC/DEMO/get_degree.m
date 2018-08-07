function res = get_degree(input,max_,min_,N)
    temp = {};
    temp{1} = [1 1 1 1];
    temp{2} = [2 1 1 1];
    temp{3} = [2 2 1 1];
    temp{4} = [2 2 2 1];
    temp{5} = [2 2 2 2];
    for i = 1 : N - 2
        temp{4*i + 2} = temp{2} + i;
        temp{4*i + 3} = temp{3} + i;
        temp{4*i + 4} = temp{4} + i;
        temp{4*i + 5} = temp{5} + i;
    end
    if input >= max_
        res = temp{4 * N - 3};
    elseif input <= min_
        res = temp{1};
    else
        i = (4 * N - 3) * (input + max_) / (2 * max_);
        res = temp{ceil(i)};
    end
end

