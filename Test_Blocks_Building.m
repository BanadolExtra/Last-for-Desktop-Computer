
Doc_Line_Mat=[1 2 3 4 5 6 7 8 9 10 11 12 25 26 29 30 33 34; 13 14 15 16 17 18 19 20 21 22 23 24 27 28 31 32 35 36];
Temp_Block =[];
All_Writers_Blocks={};
Writer_ID = 1;
blocks_counter = 1; 
folders_counter = 1;
i = 1; J = 1;
Block_Size = 4;
Window_Size = 2;
%Jump size depend on this Eq: (block_size/window_size)*Window_Size
Jump_Size = (Block_Size/Window_Size)*Window_Size;
while i<= size(Doc_Line_Mat,2)/Jump_Size
  Temp_Block = [ Temp_Block; Doc_Line_Mat(:,J:i*Jump_Size)];
%   if i == floor(Block_Size/Window_Size)
   if mod(i, floor(Block_Size/Window_Size))== 0 
      All_Writers_Blocks{folders_counter,1}= Writer_ID;
      All_Writers_Blocks{folders_counter,blocks_counter+1}= Temp_Block;
      blocks_counter = blocks_counter+1;
      % Here I should Calculate the local descriptor for the current block
      % Invoke features calculation function
      Temp_Block = [];
  end
  i = i+1;
  J= (i-1)*Jump_Size+1;
end; 


% 
% A=[1 2 3 4 5 6 7 8 9 10 11 12 25 26 29 30 33 34; 13 14 15 16 17 18 19 20 21 22 23 24 27 28 31 32 35 36];
% Temp_Block =[];
% All_Writers_Blocks={};
% Writer_ID = 1;
% blocks_counter = 1; 
% folders_counter = 1;
% i = 1; J = 1;
% Block_Size = 4;
% Window_Size = 2;
% %Jump size depend on this Eq: block_size/window_size
% Jump_Size = (Block_Size/Window_Size)*Window_Size;
% while i<= size(A,2)/Jump_Size
%   Temp_Block = [ Temp_Block; A(:,J:i*Jump_Size)];
% %   if i == floor(Block_Size/Window_Size)
%    if mod(i, floor(Block_Size/Window_Size))== 0 
%       All_Writers_Blocks{folders_counter,1}= Writer_ID;
%       All_Writers_Blocks{folders_counter,blocks_counter+1}= Temp_Block;
%       blocks_counter = blocks_counter+1;
%       % Here I should Calculate the local descriptor for the current block
%       % Invoke features calculation function
%       Temp_Block = [];
%   end
%   i = i+1;
%   J= (i-1)*Jump_Size+1;
% end; 
