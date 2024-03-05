function total_num_one = one_counter(num)
     
     random_array= randi([1 10], num);


     one_counts=0;

     parfor i=1:numel(random_array)

         if random_array(i)==1
             one_counts=one_counts+1;
         end
     end

     disp(random_array);
     total_num_one = one_counts;

end