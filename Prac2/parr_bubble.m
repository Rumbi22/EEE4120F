function out = parr_bubble(num)
    % Generate a random matrix of size (num x num)
    rand_num = rand(num);
    %disp(rand_num);

    % Calculate the number of columns each worker will handle
    num_columns = ceil(num / numlabs);


    % Cell array to store sorted columns from each worker
    sorted_columns = cell(1, numlabs);

    spmd
        % Calculate the starting and ending indices for the columns assigned to each worker
        start_column = (labindex - 1) * num_columns + 1;
        end_column = min(labindex * num_columns, num); 

        % Sort each column of the matrix
        for col = start_column:end_column
            for i = 1:num-1
                for j = 1:num-i
                    if rand_num(j, col) > rand_num(j+1, col)
                        % Swap elements if they are out of order
                        temp = rand_num(j, col);
                        rand_num(j, col) = rand_num(j+1, col);
                        rand_num(j+1, col) = temp;
                    end
                end
            end
        end
    % Output the sorted columns from each worker
        sorted_columns{labindex} = rand_num(:, start_column:end_column);
    end

    % Concatenate sorted columns into a single matrix
    out = [];
    for i = 1:numel(sorted_columns)
        if ~isempty(sorted_columns{i})
            out = [out, sorted_columns{i}];
        end
    end
    
    % Display the sorted matrix
    disp(out);
end
