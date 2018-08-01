function res = get_degree_1(input, max_)
    temp = {};
    temp{1} = [1 1 1];
    temp{2} = [2 1 1];
    temp{3} = [2 2 1];
    temp{4} = [2 2 2];
    if input >= max_
        res = temp{4} + 2;
    elseif input <= -max_
        res = temp{1};
    elseif input == 0
        res = temp{1} + 2;
    else
        if input < 0
          i = 4.0 * (input + max_) / max_;
          res = temp{ceil(i)};
        else
          i = 4.0 * input / max_;
          res = temp{ceil(i)} + 2;
        end
    end
end
