%% insert the main folder path of the Training or Testing data set
Training_Path = 'E:\IAM System\Train_10_Writers\';
Testing_Path = 'E:\IAM System\Test_10_Writers\';
% Training_Path = 'E:\IAM System\Train_50_Writers\';
% Testing_Path = 'E:\IAM System\Test_50_Writers\';
% Training_Path = 'E:\IAM System\Train_100_Writers\';
% Testing_Path = 'E:\IAM System\Test_100_Writers\';
tic;
%% Here is the initialization of parameters
% No_of_Writers = [641 641 641 641 641 641 641 641 641 641 641 641 641 641 641 641 641 641 641 641]'; 
% LF_Parameter_Values = [35 35 35 35 35 35 35 35 35 35 35 35 35 35 35 35 35 35 35 35]';
% Gap = [20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20]';
% Clusters = [50 100 150 200 250 300 350 400 450 500 550 600 650 700 750 800 850 900 950 1000]'; 
% Line_Seg = [9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9]'; 
% Theta1_Intervals = [12 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12]'; 
% Theta2_Intervals = [12 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12]'; 
% Phi_Intervals = [8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8]';% Curve_Point_Angle_Intervals

%% just for test
No_of_Writers = [641 641]';% 641 641 641 641 641 641 641 641 641 641 641 641 641 641 641 641 641 641]'; 
LF_Parameter_Values = [35 35]';% 35 35 35 35 35 35 35 35 35 35 35 35 35 35 35 35 35 35]';
Gap = [20 20]';% 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20]';
Clusters = [10 5]';% 150 200 250 300 350 400 450 500 550 600 650 700 750 800 850 900 950 1000]'; 
Line_Seg = [9 9]';% 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 9]'; 
Theta1_Intervals = [12 12]';% 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12]'; 
Theta2_Intervals = [12 12]';% 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12]'; 
Phi_Intervals = [8 8]';% 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8]';% Curve_Point_Angle_Intervals
%% Here is the invocation of the main system function in order to maniplate curve angles feature
Top_1 = [];
Top_5 = [];
Top_10 = [];
for i = 1 : 2%20
 Curr_Performance_Rate = System_Main_Func_CPCA_E(Training_Path, Testing_Path, Clusters(i), LF_Parameter_Values(1), Gap(1), Line_Seg(1), Theta1_Intervals(1), Theta2_Intervals(1), Phi_Intervals(1));
 Top_1 = [ Top_1; Curr_Performance_Rate(1)];
 Top_5 = [ Top_5; Curr_Performance_Rate(2)];
 Top_10 = [ Top_10; Curr_Performance_Rate(3)];
end
toc;
%% recording the running data and the result into excel file
filename = 'CPCA_E_Clusters_Param_Results.xls';
Results_Names={'#Writers','#Clusters','LF','GAP','Line Segment','Theta1 intervals','Theta2 intervals','Phi intervals','Top1 %','Top5 %','Top10 %'};
Results_Values=[No_of_Writers,Clusters,LF_Parameter_Values,Gap,Line_Seg, Theta1_Intervals, Theta2_Intervals,Phi_Intervals, Top_1, Top_5, Top_10 ];
sheet=1;
xlRange='A2';
xlswrite(filename,Results_Values,sheet,xlRange);
sheet=1;
xlRange='A1';
xlswrite(filename,Results_Names,sheet,xlRange);
%winopen('CPCA_E_Clusters_Param_Results.xls');

