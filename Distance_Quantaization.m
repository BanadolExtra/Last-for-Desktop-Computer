function Distance_Histogram = Distance_Quantaization( org_points_distances, dist_type )
   Seg_points_cons_Histogram = zeros(1,13);
   Seg_length = size ( org_points_distances);
  for i = 1 : Seg_length(2)
   %% Quantaization on the base of 10 periods
   if dist_type == 1
       if org_points_distances(i) >= 0 && org_points_distances(i) < 1
           Seg_points_cons_Histogram(1) = Seg_points_cons_Histogram(1)+ 1;
       elseif org_points_distances(i) >= 1 && org_points_distances(i) < 2
           Seg_points_cons_Histogram(2) = Seg_points_cons_Histogram(2)+1;
       elseif org_points_distances(i) >= 2 && org_points_distances(i) < 3
           Seg_points_cons_Histogram(3) = Seg_points_cons_Histogram(3)+1;
       elseif org_points_distances(i) >= 3 && org_points_distances(i) < 4
           Seg_points_cons_Histogram(4) = Seg_points_cons_Histogram(4)+1;
       elseif org_points_distances(i) >= 4 && org_points_distances(i) < 5
           Seg_points_cons_Histogram(5)= Seg_points_cons_Histogram(5)+1; 
       elseif org_points_distances(i) >= 5 && org_points_distances(i) < 6
           Seg_points_cons_Histogram(6) = Seg_points_cons_Histogram(6)+1;
       elseif org_points_distances(i) >= 6 && org_points_distances(i) < 7
           Seg_points_cons_Histogram(7) = Seg_points_cons_Histogram(7)+1;
       elseif org_points_distances(i) >= 7 && org_points_distances(i) < 8
           Seg_points_cons_Histogram(8) = Seg_points_cons_Histogram(8)+1;
       elseif org_points_distances(i) >= 8 && org_points_distances(i) < 9
           Seg_points_cons_Histogram(9) = Seg_points_cons_Histogram(9)+1;
       elseif org_points_distances(i) >= 9 && org_points_distances(i) < 10
           Seg_points_cons_Histogram(10) = Seg_points_cons_Histogram(10)+1;
       elseif org_points_distances(i) >= 10 && org_points_distances(i) < 11
           Seg_points_cons_Histogram(11) = Seg_points_cons_Histogram(11)+1;
       elseif org_points_distances(i) >= 11 && org_points_distances(i) < 12
           Seg_points_cons_Histogram(12) = Seg_points_cons_Histogram(12)+1;
       else
           Seg_points_cons_Histogram(13) = Seg_points_cons_Histogram(13)+1; 
       end
   else
       if org_points_distances(i) >= 0 && org_points_distances(i) < 2
           Seg_points_cons_Histogram(1) = Seg_points_cons_Histogram(1)+ 1;
       elseif org_points_distances(i) >= 2 && org_points_distances(i) < 4
           Seg_points_cons_Histogram(2) = Seg_points_cons_Histogram(2)+1;
       elseif org_points_distances(i) >= 4 && org_points_distances(i) < 6
           Seg_points_cons_Histogram(3) = Seg_points_cons_Histogram(3)+1;
       elseif org_points_distances(i) >= 6 && org_points_distances(i) < 8
           Seg_points_cons_Histogram(4) = Seg_points_cons_Histogram(4)+1;
       elseif org_points_distances(i) >= 8 && org_points_distances(i) < 10
           Seg_points_cons_Histogram(5)= Seg_points_cons_Histogram(5)+1; 
       elseif org_points_distances(i) >= 10 && org_points_distances(i) < 12
           Seg_points_cons_Histogram(6) = Seg_points_cons_Histogram(6)+1;
       elseif org_points_distances(i) >= 12 && org_points_distances(i) < 14
           Seg_points_cons_Histogram(7) = Seg_points_cons_Histogram(7)+1;
       elseif org_points_distances(i) >= 14 && org_points_distances(i) < 16
           Seg_points_cons_Histogram(8) = Seg_points_cons_Histogram(8)+1;
       elseif org_points_distances(i) >= 16 && org_points_distances(i) < 18
           Seg_points_cons_Histogram(9) = Seg_points_cons_Histogram(9)+1;
       elseif org_points_distances(i) >= 18 && org_points_distances(i) < 20
           Seg_points_cons_Histogram(10) = Seg_points_cons_Histogram(10)+1;
       elseif org_points_distances(i) >= 20 && org_points_distances(i) < 22
           Seg_points_cons_Histogram(11) = Seg_points_cons_Histogram(11)+1;
       elseif org_points_distances(i) >= 22 && org_points_distances(i) < 24
           Seg_points_cons_Histogram(12) = Seg_points_cons_Histogram(12)+1;
       else
           Seg_points_cons_Histogram(13) = Seg_points_cons_Histogram(13)+1; 
       end
  end
%Seg_points_cons_Histogram = Seg_points_cons_Histogram/40;
Distance_Histogram = Seg_points_cons_Histogram;
  end
end

