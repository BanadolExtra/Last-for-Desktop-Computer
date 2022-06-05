function Performance = Calculate_Performance( Similarity_Matrix, y )

% This peice of code is dedicated for testing the similarity measure and
% performance for Top 1 

true_match = 0;
min_val = 0;
j = 1;
similarity_values_temp_matrix = [];
trained_writers_temp_matrix = {};
idx = [];
a = [];
testing_training_entries = size(Similarity_Matrix);
%---------------------------- 
for i = 1 : testing_training_entries(1)
    temp = Similarity_Matrix{ i , j };
    min_val = temp{1,1};
    tested_writer = temp{1,2};
    trained_writer = temp{1,3};
   for j = 1 : testing_training_entries(2)
       temp = Similarity_Matrix{ i , j }; 
       similarity_values_temp_matrix(j) = temp{1,1};
       trained_writers_temp_matrix{j} = temp{1,3};
       if min_val > temp {1,1}
         min_val = temp {1,1};
         tested_writer = temp{1,2};
         trained_writer = temp{1,3};
       end
   end
   [a idx] = sort(similarity_values_temp_matrix);
   for t= 1 : y 
     if tested_writer == trained_writers_temp_matrix{idx(t)}
        true_match = true_match+1 ;
     end  
   end
   j = 1; 
   similarity_values_temp_matrix = [];
   trained_writers_temp_matrix = {};
   idx = [];
   a = [];
end
%true_match
Performance = true_match/testing_training_entries(1)*100;


end

