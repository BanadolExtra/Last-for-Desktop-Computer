function  System_Performance  = System_Main_Function( Training_Data_Paths, Testing_Data_Paths )

Block_Size_Rows =121 ;
Block_Size_Columns =253; 
Window_Size = 11;
% Path_train = 'E:\Arabic WI System_part2_2\Train_10_Writers\';
% Path_test = 'E:\Arabic WI System_part2_2\Test_10_Writers\';
%set(0,'DefaultFigureVisible','off');
tic;
%% here we are going to calculate the features of the training data set.
Training_data = [];
 Training_data = Build_Test_Train_Data_Sheet(Training_Data_Paths, Block_Size_Columns,Block_Size_Rows ,Window_Size, 0);
 Training_data = double(Training_data);
 save Training_data_sheet Training_data;
%% Here is the code book construction process
k= 10;
c1=clock;
[IDX,C] = kmeans(Training_data(:,1:256),k) ;
clock-c1;
center=C;
save('center','center');
 %%  here we are going to calculate the features of the testing data set.
Testing_data = [];
Testing_data = Build_Test_Train_Data_Sheet(Testing_Data_Paths, Block_Size_Columns,Block_Size_Rows ,Window_Size, 1);
Testing_data = double(Testing_data);
save Testing_data_sheet Testing_data;
%% Calculating the training codes occurrence histogram
Train_Occurance_Histogram = Calculate_Occurance_Histogram(Training_Data_Paths,Training_data , 0);
x= sum(Train_Occurance_Histogram);
sum_of_x= sum(x(1:k));
Train_Occurance_Histogram(:,1:k)= Train_Occurance_Histogram(:,1:k)/sum_of_x;
save('Train_Occurance_Histogram', 'Train_Occurance_Histogram');
%% Calculating the testing codes occurrence histogram
Test_Occurance_Histogram = Calculate_Occurance_Histogram(Testing_Data_Paths,Testing_data,1) ;
x= sum(Test_Occurance_Histogram);
sum_of_x= sum(x(1:k));
Test_Occurance_Histogram(:,1:k)= Test_Occurance_Histogram(:,1:k)/sum_of_x;
save('Test_Occurance_Histogram', 'Test_Occurance_Histogram');
%% Callculating the similarity between the training and testing histograms
 Writers_Similarity_Matrix = {};
 Writers_Similarity_Matrix = Calculate_Matrices_Similarities(Test_Occurance_Histogram,Train_Occurance_Histogram);
 save Similarity_matrix Writers_Similarity_Matrix; 
 %% System performance 
  % Here is the top1 performance of the system 
 top1 = Calculate_Performance( Writers_Similarity_Matrix, 1)
 top5 = Calculate_Performance( Writers_Similarity_Matrix, 5)
 top7 = Calculate_Performance( Writers_Similarity_Matrix, 7)
 top10 = Calculate_Performance( Writers_Similarity_Matrix, 10)
 toc;
 System_Performance = [top1 top5 top7 top10];
 

end

