function out = bubbles(num)

    % Generate a random matrix of size (num x num)
    rand_num = rand(10);
    disp(sort(rand_num))
    % Sort each column of the matrix
    tic()
    for col = 1:num
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
    toc()
    % Output the sorted matrix
    out = rand_num;
end
