function out = bubbles()
    num = 1000; %vary this number when testing
    rand_num = rand(num);
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
    

    if rand_num == sort(rand_num)
        display("Looks about right") %confirm that the matrix is sorted correctly
    end
    %out = rand_num;
end
