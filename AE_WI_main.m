%here is the main system script
clear;
%% insert the main folder path of the Training or Testing data set
% Path_train = 'E:\IAM System\Train_10_Writers\';
% Path_test = 'E:\IAM System\Test_10_Writers\';
% Path_train = 'D:\Test for rashad note\till 22 Jan\Train_50_Writers\';
% Path_test = 'D:\Test for rashad note\till 22 Jan\Test_50_Writers\';
% Path_train = 'E:\IAM System\Train_100_Writers\';
% Path_test = 'E:\IAM System\Test_100_Writers\';
Path_train = 'E:\IAM System\Training_Writers\1\';
Path_test = 'E:\IAM SYSTEM\Test_khatt_10_Writers\';   

% Path_train = 'D:\Test for rashad note\till 22 Jan\Training 100 writers\6\';
% Path_test = 'D:\Test for rashad note\till 22 Jan\Testing 100 writers\6\';   
% Path_train = 'E:\Arabic WI System_part2_2\Train_Writers\1\';
% Path_test = 'E:\Arabic WI System_part2_2\Test_Writers\1\';   
% Block_Size_Rows =96 ;
% Block_Size_Columns =256; 
Block_Size_Rows =130 ;
Block_Size_Columns =260; 
Window_Size = 13;
% Path_train = 'E:\Arabic WI System_part2_2\Train_10_Writers\';
% Path_test = 'E:\Arabic WI System_part2_2\Test_10_Writers\';
%set(0,'DefaultFigureVisible','off');
tic;
%% here we are going to calculate the features of the training data set.
Training_data = [];
 Training_data = Build_Test_Train_Data_Sheet(Path_train, Block_Size_Columns,Block_Size_Rows ,Window_Size, 0);
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
Testing_data = Build_Test_Train_Data_Sheet(Path_test, Block_Size_Columns,Block_Size_Rows ,Window_Size, 1);
Testing_data = double(Testing_data);
save Testing_data_sheet Testing_data;
%% Calculating the training codes occurrence histogram
Train_Occurance_Histogram = Calculate_Occurance_Histogram(Path_train,Training_data , 0);
x= sum(Train_Occurance_Histogram);
sum_of_x= sum(x(1:k));
Train_Occurance_Histogram(:,1:k)= Train_Occurance_Histogram(:,1:k)/sum_of_x;
save('Train_Occurance_Histogram', 'Train_Occurance_Histogram');
%% Calculating the testing codes occurrence histogram
Test_Occurance_Histogram = Calculate_Occurance_Histogram(Path_test,Testing_data,1) ;
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
 Performance1 = Calculate_Performance( Writers_Similarity_Matrix, 1)
 Performance5 = Calculate_Performance( Writers_Similarity_Matrix, 5)
 Performance7 = Calculate_Performance( Writers_Similarity_Matrix, 7)
 Performance10 = Calculate_Performance( Writers_Similarity_Matrix, 10)
 toc; 


 