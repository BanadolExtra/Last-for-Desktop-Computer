clc
%load your features here
% load('allSiftFeatur','allSiftFeatur');
load('Training_data_sheet');
k=100;
c1=clock;
[IDX,C] = kmeans(Training_data,k) ;
clock-c1;
center=C;
toc;
save('center','center');