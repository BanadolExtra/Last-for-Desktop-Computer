 function TD = Build_Data_Sheet_New(Path)
  list_of_folders = dir(Path);
  list_of_folders(1:2) = [];
  Trn_or_Tst_Data = [];
%   Contour_Points_Curvatures = [];
  Conn_Comp_features = [];
for folders_counter=1 : length(list_of_folders)
    sub_folder_name= list_of_folders(folders_counter).name;
    All_images = dir(fullfile(strcat(Path,sub_folder_name),'\*.bmp'));
 for ii=1 : length(All_images)
    imagename = strcat(strcat(Path,sub_folder_name),strcat('\',All_images(ii).name));
    I = imread(imagename);
    I = padarray(I, [9 9]);
%     dilatedImage = imdilate(I,strel('disk',1));
    %% Getting contour points coordinates
% Here is the connected component boundary points
     B = bwboundaries(I);    
%      %boundary = B{1};
     C = [B{1}(: , 2 ) B{1}(:,1 )];
% [C,handle] = imcontour(dilatedImage,1);
% C = C';
     contourX = C(:,2);
     contourY = C(:,1);
     [domX domY domPos] = dominantPoint(contourX, contourY);  
     % apply contrained colinear suppression
     [domXtmp domYtmp endConition] = applyCollinearSuppression(contourX, contourY, domX, domY, 1,1, 1);
     Optimized_Polygon = [domXtmp domYtmp];
     Conn_Comp_features = Calculate_Conn_Com_Features( I, Optimized_Polygon, sub_folder_name,7);
 %% calculate textural features based on polygon points
%  B = bwboundaries(dilatedImage);    
%  C = [B{1}(: , 1 ) B{1}(:,2 )];
%  contourX = C(:,1);
%  contourY = C(:,2);
%  %C = unique(C,'rows');
%      Chain_Code = GetChainCode(C);
%      PolyGon = GetPolygon(C,Chain_Code);
%      Poly_Points = PolyGon(:,1:2);
%   %convert the polygon into clockwise contour polygon
%      [x3, y3] = poly2cw(Poly_Points(:,1), Poly_Points(:,2));
%     % Poly_Points = [x3 y3];
%        [domXtmp domYtmp endConition] = applyCollinearSuppression(contourX, contourY, x3, y3, 1,1, 1);
%        Optimized_Polygon = [domXtmp domYtmp];
%      Conn_Comp_features = Calculate_Conn_Com_Features( dilatedImage, Optimized_Polygon, sub_folder_name);
        
    %% Here is the preparation of the features
    Trn_or_Tst_Data = [ Trn_or_Tst_Data; Conn_Comp_features ];
    Conn_Comp_features = [];
    Contour_Points_Curvatures = [];
    %Contour_Points_Angles = [];
 end
end
TD = Trn_or_Tst_Data;
 end