function total_num_one = one_counter2(num)
     
     random_array= randi([1 10], num);
     worker_count= numlabs;
     

     % Initialize an array to store counts for each worker
     %worker_array = zeros(worker_count, 1);

     
     worker_counts=0;
     parfor i=1:numel(random_array)
        

         local_counts = zeros(worker_count, 1); % Initialize local counts for each worker
        

         if random_array(i)==1
             % Increment the count for the current worker
             local_counts(labindex) = 1;
             %worker_array(labindex)=worker_array(labindex)+1;
         end

         % Accumulate local counts to worker_counts
        worker_counts = worker_counts + local_counts;
     end

     total_num_one = sum(gather(worker_counts));
     disp(random_array);
     

end