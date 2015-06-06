function output = cobs(input)
    %COBS Encode message with Consistent Overhead Byte Stuffing - see
    % http://www.stuartcheshire.org/papers/cobsforton.pdf for algorithm
    % details
    l = length(input);
    output = zeros(0, l + ceil(l/255), 'uint8'); % preallocate

    while ~isempty(input)
        
        code = min([255,find([input,0] == 0)]);
        output(end+1) = code;
        if code > 1
            output(end+1:end+code-1) = input(1:code-1);
            try
                input(1:code) = [];
            catch
                return;
            end
        else
            input(1) = [];
        end 
    end  
end