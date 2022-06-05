function Train_Occurance_Histogram = Calculate_Occurance_Histogram( Path, Train_or_Test_Sheet, Trn_OR_TST) 
  list_of_writers = dir(Path);
  list_of_writers(1:2) = [];
  load('center');
  x = size(center);
  y = size(Train_or_Test_Sheet);
  data_sheet_length = size(Train_or_Test_Sheet);
  i = 1;
 if  Trn_OR_TST == 0 
   Train_or_Test_Histogram = zeros(length(list_of_writers), x(1)+1);
   for writers_counter=1 : length(list_of_writers)
     Writer_ID= list_of_writers(writers_counter).name;
     Train_or_Test_Histogram(writers_counter,x(1)+1)= str2num(Writer_ID);
     while Train_or_Test_Sheet(i,y(2))== str2num(Writer_ID) && i <= data_sheet_length(1)
       target_cell_index = Calculate_Distance(Train_or_Test_Sheet(i,1:y(2)-1),center);
       Train_or_Test_Histogram(writers_counter,target_cell_index) = Train_or_Test_Histogram(writers_counter,target_cell_index)+1; 
      i = i+1;
      if i == data_sheet_length(1)
          break
      end
     end    
   end
 else 
     %  here is the testing set processing
     % here I should take into my consideration the CROSS Validation
     % now I just take 30% simply
     Train_or_Test_Histogram = zeros(floor(length(list_of_writers)*0.3), x(1)+1);
     for writers_counter=1 : floor(length(list_of_writers)*0.3) 
        Writer_ID= list_of_writers(writers_counter).name;
        Train_or_Test_Histogram(writers_counter,x(1)+1)= str2num(Writer_ID);
        while Train_or_Test_Sheet(i,y(2))== str2num(Writer_ID) && i <= data_sheet_length(1)
         target_cell_index = Calculate_Distance(Train_or_Test_Sheet(i,1:y(2)-1),center);
         Train_or_Test_Histogram(writers_counter,target_cell_index) = Train_or_Test_Histogram(writers_counter,target_cell_index)+1; 
         i = i+1;
         if i == data_sheet_length(1)
             break
         end
        end  
     end
 end
Train_Occurance_Histogram = Train_or_Test_Histogram;
end


