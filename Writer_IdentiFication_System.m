% this is the main procedure

% Training_Data_Paths = { 'D:\IAM Dataset\IAM\Training\1\';'D:\IAM Dataset\IAM\Training\2\'; ...
%                         'D:\IAM Dataset\IAM\Training\3\';'D:\IAM Dataset\IAM\Training\4\'; ...
%                         'D:\IAM Dataset\IAM\Training\5\';'D:\IAM Dataset\IAM\Training\6\'};
% Testing_Data_Paths = { 'D:\IAM Dataset\IAM\Testing\1\';'D:\IAM Dataset\IAM\Testing\2\'; ...
%                         'D:\IAM Dataset\IAM\Testing\3\';'D:\IAM Dataset\IAM\Testing\4\'; ...
%                         'D:\IAM Dataset\IAM\Testing\5\';'D:\IAM Dataset\IAM\Testing\6\'};
Training_Data_Paths = 'E:\IAM SYSTEM\Train_khatt_10_Writers\';
Testing_Data_Paths = 'E:\IAM SYSTEM\Test_khatt_10_Writers\';
System_Performance = [];
sys_performance = [];
% invoking the main system function
for i = 1 : 5
  Sys_Performance = System_Main_Function(Training_Data_Paths{i}, Testing_Data_Paths{i} );
  System_Performance = [ System_Performance ; Sys_Performance ];
end
save System_Performance System_Performance;