%  function TD = Build_Data_Sheet(Path, Block_Size ,Window_Size)
  Block_Size_Rows = 128;
  Block_Size_Columns = 256;
  Window_Size = 11;
  Path = 'C:\Users\Bashar\Desktop\1\';
  list_of_folders = dir(Path);
  list_of_folders(1:2) = [];
  Trn_or_Tst_Data = [];
  All_Writers_Blocks = {};
  All_Writers_Windows = {};
  Temp_Block = [];
  Jump_Size = (Block_Size_Columns/Window_Size)*Window_Size;
  win = floor(Window_Size/2);
  Block_Features = [];
for folders_counter=1 : length(list_of_folders)
    sub_folder_name= list_of_folders(folders_counter).name;
    All_images = dir(fullfile(strcat(Path,sub_folder_name),'\*.bmp'));
    Doc_Line_Mat = [];
    Temp_Block = [];
    Writer_ID = str2num(sub_folder_name); 
  for conn_comp_idx=1 : length(All_images)
    imagename = strcat(strcat(Path,sub_folder_name),strcat('\',All_images(conn_comp_idx).name))
    Img = imread(imagename);
    padding_QTY = floor(Window_Size/2)+1;
    Img = padarray(Img, [padding_QTY padding_QTY]);
%     dilatedImage = imdilate(I,strel('disk',1));
    dilatedImage = Img;
    %% Getting contour points coordinates
% Here is the connected component boundary points
     B = bwboundaries(dilatedImage);    
%      %boundary = B{1};
     C = [B{1}(: , 2 ) B{1}(:,1 )];
     contourX = C(:,2);
     contourY = C(:,1);
     [domX domY domPos] = dominantPoint(contourX, contourY);  
     % apply contrained colinear suppression
     [domXtmp domYtmp endConition] = applyCollinearSuppression(contourX, contourY, domX, domY, 1,1, 1);
     Opt_Poly = [domXtmp domYtmp];
     length (Opt_Poly)
     %% here we build the Handwritten Document Linear Matrix
%      for ix=1 : length (Opt_Poly)
%        curr_win = dilatedImage(Opt_Poly(ix,1)-win:Opt_Poly(ix,1)+win,Opt_Poly(ix,2)-win:Opt_Poly(ix,2)+win);
%        Doc_Line_Mat = [ Doc_Line_Mat curr_win ]; 
%      end
  end
  %% Here I have to build the blocks Segemnets from the windows linear matrix
%      i = 1; J = 1;
%      blocks_counter = 1;
%      while i<= size(Doc_Line_Mat,2)/Jump_Size
%        Temp_Block = [ Temp_Block; Doc_Line_Mat(:,J:i*Jump_Size)];
%        if mod(i, floor(Block_Size_Rows/Window_Size))== 0 
%           All_Writers_Blocks{folders_counter,1}= Writer_ID;
%           All_Writers_Blocks{folders_counter,blocks_counter+1}= Temp_Block;
%           Block_Features = Calculate_Block_Features( Temp_Block, Writer_ID);
%           Trn_or_Tst_Data = [ Trn_or_Tst_Data; Block_Features ];
%           blocks_counter = blocks_counter+1;
%           Temp_Block = [];
%        end
%        i = i+1;
%        J= (i-1)*Jump_Size+1;
%      end; 
    %% Save handwritten document linear matrix
    All_Writers_Windows{folders_counter,1}= Writer_ID;
    All_Writers_Windows{folders_counter,2}= Doc_Line_Mat;
    save All_Writers_Windows All_Writers_Windows;
    Doc_Line_Mat = [];
end
TD = Trn_or_Tst_Data;
 