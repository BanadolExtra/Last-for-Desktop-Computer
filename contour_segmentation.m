function segmented_contour = contour_segmentation( boundary )
% This function uses the Moore's contour boundary points and segments the
% contour into curves segments
gap =20; Lf =40;
seg_contour = {};
i = 1;
tmp_list = []; 
current_gap_index = 1;
length_org_contour = length( boundary );
while ( length_org_contour - current_gap_index >= Lf )
   tmp_list = boundary( current_gap_index  : (current_gap_index + Lf)-1, :);
   current_gap_index = (current_gap_index + gap);
   seg_contour{i} = tmp_list;
   i = i + 1;
end 
   segmented_contour = seg_contour;
end