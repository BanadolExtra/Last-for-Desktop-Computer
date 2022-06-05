function Train_Occurance_Histogram = Calculate_Train_Occurance_Histogram( Path )
  list_of_folders = dir(Path);
  list_of_folders(1:2) = [];
  Train_Histogram = zeros(length(list_of_folders), 101);
  load('center');
  %Contour_Points_Curvatures = [];
  Conn_Comp_Seg_Codes = [];
for folders_counter=1 : length(list_of_folders)
    sub_folder_name= list_of_folders(folders_counter).name;
    Train_Histogram(folders_counter,101)= str2num(sub_folder_name);
    All_images = dir(fullfile(strcat(Path,sub_folder_name),'\*.bmp'));
 for ii=1 : length(All_images)
    imagename = strcat(strcat(Path,sub_folder_name),strcat('\',All_images(ii).name));
    I = imread(imagename);
    I = padarray(I, [9 9]);
    dilatedImage = imdilate(I,strel('disk',1));
    %% Here is the calculation of contour points curvatures feature
    %Contour_Points_Curvatures = Calculate_Contour_Curvature(dilatedImage);
    %Conn_Comp_Seg_Codes = Contour_Curve_Segmentation(Contour_Points_Curvatures);
    %% Here is the calculation of contour points angles feature
    B = bwboundaries(dilatedImage);
    boundary = B{1};
    Contour_Points_Angles = Calculate_Curve_angles(boundary);
    Conn_Comp_Seg_Codes = Contour_Curve_Segmentation(Contour_Points_Angles);
    %% Here is the calculation of codes occurances histogram
    x = size( Conn_Comp_Seg_Codes );
    length_conn_comp_seg_codes = x(1);
    for i=1 : length_conn_comp_seg_codes
       target_cell_index = Calculate_Distance(Conn_Comp_Seg_Codes(i,:),center);
       Train_Histogram(folders_counter,target_cell_index) = Train_Histogram(folders_counter,target_cell_index)+1; 
    end    
    %% Here is the preparation of the features
    %Trn_or_Tst_Data = [ Trn_or_Tst_Data; Conn_Comp_Seg_Codes ];
    Conn_Comp_Seg_Codes = [];
    %Contour_Points_Curvatures = [];
    Contour_Points_Angles = [];
 end
end
Train_Occurance_Histogram = Train_Histogram;
end

