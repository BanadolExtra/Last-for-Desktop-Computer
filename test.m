load('Training_data_sheet');
load('center');
%center(1,:)=[];
for i=1 : 10 
    cell_index = Calculate_Distance(Training_data(i,:),center)
end