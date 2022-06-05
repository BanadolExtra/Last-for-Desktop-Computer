 function TD = Build_Data_Sheet(Path, Block_Size ,Window_Size)
  list_of_folders = dir(Path);
  list_of_folders(1:2) = [];
  Trn_or_Tst_Data = [];
  All_Writers_Blocks = {};
  Jump_Size = (Block_Size/Window_Size)*Window_Size;
  % Here I should specify the window size as a parameter to this function
  win = floor(Window_Size/2);
  Conn_Comp_features = [];
for folders_counter=1 : length(list_of_folders)
    sub_folder_name= list_of_folders(folders_counter).name;
    All_images = dir(fullfile(strcat(Path,sub_folder_name),'\*.bmp'));
    Doc_Line_Mat = [];
    Writer_ID = str2num(sub_folder_name); 
  for conn_comp_idx=1 : length(All_images)
    imagename = strcat(strcat(Path,sub_folder_name),strcat('\',All_images(conn_comp_idx).name));
    I = imread(imagename);
    I = padarray(I, [35 35]);
%     dilatedImage = imdilate(I,strel('disk',1));
    dilatedImage = I;
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
     %% here we build the Handwritten Document Linear Matrix
     for ix=1 : length (Opt_Poly)
       curr_win = dilatedImage(Opt_Poly(ix,1)-win:Opt_Poly(ix,1)+win,Opt_Poly(ix,2)-win:Opt_Poly(ix,2)+win);
       Doc_Line_Mat = [ Doc_Line_Mat curr_win ]; 
     end
     %Conn_Comp_features = Calculate_Conn_Com_Features( dilatedImage, Opt_Poly, sub_folder_name,31);
    %% Here is the preparation of the features
    Trn_or_Tst_Data = [ Trn_or_Tst_Data; Conn_Comp_features ];
    Conn_Comp_features = [];
  end
  %% Here I have to build the Segemnets blocks from the windows linear matrix
     while i<= size(Doc_Line_Mat,2)/Jump_Size
       Temp_Block = [ Temp_Block; Doc_Line_Mat(:,J:i*Jump_Size)];
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
   
end
TD = Trn_or_Tst_Data;
 end