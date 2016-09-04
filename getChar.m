function char_str = getChar(input_str)
    if isa(input_str, 'str')
        char_str = input_str.val;
    elseif isa(input_str, 'char')
        char_str = input_str;
    else
        ME = MException();
        throw(ME);
    end
end