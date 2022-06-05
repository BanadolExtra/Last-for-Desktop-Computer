function segmented_contour = Contour_Curve_Segmentation( boundary, current_writer )
% This function uses the Moore's contour boundary points and segments the
% contour into curves segments
gap =15; Lf =40;
seg_contour = [];
tmp_list = []; 
current_gap_index = 1;
length_org_contour = length( boundary );
while ( length_org_contour - current_gap_index >= Lf )
   tmp_list = boundary( current_gap_index  : (current_gap_index + Lf)-1, 1);
   tmp_list = tmp_list.';
   % Call quantaization function for perpendiculare distance
   Curv_Perp_Dist_Histogram = Distance_Quantaization(tmp_list,1); 
   %%   Call quantaization function for perpendiculare distance
   tmp_list = boundary( current_gap_index  : (current_gap_index + Lf)-1, 2);
   tmp_list = tmp_list.';
   Curv_Seg_Line_Dist_Histogram = Distance_Quantaization(tmp_list,2); 
   %% Augmenting the feature by the first angle
   tmp_list = boundary( current_gap_index  : (current_gap_index + Lf)-1, 3);
   tmp_list = tmp_list.';
   % Call quantaization function for first angle
   Curv_Seg_theta1_Histogram = New_Quantaization_theta_1_2(tmp_list); 
   %%   Augmenting the feature by the second angle
   tmp_list = boundary( current_gap_index  : (current_gap_index + Lf)-1, 4);
   tmp_list = tmp_list.';
   % Call quantaization function for first angle
   Curv_Seg_theta2_Histogram = New_Quantaization_theta_1_2(tmp_list); 
   %% change segmentation location
   current_gap_index = (current_gap_index + gap);
   seg_contour = [ seg_contour ; Curv_Perp_Dist_Histogram Curv_Seg_Line_Dist_Histogram Curv_Seg_theta1_Histogram Curv_Seg_theta2_Histogram];  
end
   x = size(seg_contour);
   seg_contour(:,x(2)+1) = str2num(current_writer);
   segmented_contour = seg_contour;
end