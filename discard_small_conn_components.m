% here is the code of reading images of connected components of handwritten document
% for the sake of discarding small non informative components
%% here you have to insert the path of the main folder of the images 

tic

small_images_path = 'D:\Test for rashad note\till 22 Jan\Training 100 writers\6';  
list_of_folders = dir(small_images_path);
counter = 0;
img_count = 0;
for folders_counter=1 : length(list_of_folders)
    sub_folder_name= list_of_folders(folders_counter).name;
    All_images = dir(fullfile(strcat('D:\Test for rashad note\till 22 Jan\Training 100 writers\6\',sub_folder_name),'\*.bmp'));
 for ii=1 : length(All_images)
    imagename = strcat(strcat('D:\Test for rashad note\till 22 Jan\Training 100 writers\6\',sub_folder_name),strcat('\',All_images(ii).name));
    I = imread(imagename);
    I = padarray(I, [9 9]);
    img_count = img_count+1;
    %-----------------------------------------
    dilatedImage = imdilate(I,strel('disk',1));
    %% boundary using matlab built-in function 
     B = bwboundaries(dilatedImage);    
%      %boundary = B{1};
     C = [B{1}(: , 2 ) B{1}(:,1 )];
     contourX = C(:,2);
     contourY = C(:,1);
     [domX domY domPos] = dominantPoint(contourX, contourY);  
     % apply contrained colinear suppression
     [domXtmp domYtmp endConition] = applyCollinearSuppression(contourX, contourY, domX, domY, 1,1, 1);
     Opt_Poly = [domXtmp domYtmp];
    
    if length(Opt_Poly) <= 8
        counter = counter+1
        delete(imagename);
    end
%     Image_Dim = size(I);
%     if Image_Dim(1)<=2 | Image_Dim(2)<=2 
%         imagename
%         delete(imagename);
%     end
%      
 end
end
toc
