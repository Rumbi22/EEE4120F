function out = parr_bubble()
    num = 1000; %vary this during testing
    rand_num = rand(num);
    
    tic()
    %display(rand_num)
    
    parfor col = 1:num
        temp_column = rand_num(:,col)

          for i = 1:num-1
            for j = 1:num-i
                if temp_column(j) > temp_column(j+1)
                    % Swap elements
                    temp = temp_column(j);
                    temp_column(j) = temp_column(j+1);
                    temp_column(j+1) = temp;
                end
            end
          end
          rand_num(:,col) = temp_column;
    end
    toc()

    if rand_num == sort(rand_num)
        display("Looks about right") %confirm that the matrix is sorted correctly
    end

    %out =  rand_num;
    %disp(out);
end
