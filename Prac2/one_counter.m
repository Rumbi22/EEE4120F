
function total_num_one = one_counter()
     
     random_array=randi([1 10],100);


     one_counts=0;
     tic()
     parfor i=1:numel(random_array)
         if random_array(i)==1
             one_counts=one_counts+1;
         end
     end 
     toc()
    total_num_one = one_counts;
    
end
