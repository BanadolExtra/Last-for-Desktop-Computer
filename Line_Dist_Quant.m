function LD_Hist = Line_Dist_Quant(org_points_distances )
   Line_Dist_Histogram = zeros(1,9);
   Seg_length = size ( org_points_distances);
  for i = 1 : Seg_length(2)
      if org_points_distances(i) > 0 && org_points_distances(i) < 5
           Line_Dist_Histogram(1) = Line_Dist_Histogram(1)+ 1;
      elseif org_points_distances(i) >= 5 && org_points_distances(i) < 10
           Line_Dist_Histogram(2) = Line_Dist_Histogram(2)+1;
      elseif org_points_distances(i) >= 10 && org_points_distances(i) < 15
           Line_Dist_Histogram(3) = Line_Dist_Histogram(3)+1;
      elseif org_points_distances(i) >= 15 && org_points_distances(i) < 20
           Line_Dist_Histogram(4) = Line_Dist_Histogram(4)+1;
      elseif org_points_distances(i) >= 20 && org_points_distances(i) < 25
           Line_Dist_Histogram(5)= Line_Dist_Histogram(5)+1; 
      elseif org_points_distances(i) >= 25 && org_points_distances(i) < 30
           Line_Dist_Histogram(6) = Line_Dist_Histogram(6)+1;
      elseif org_points_distances(i) >= 30 && org_points_distances(i) < 35
           Line_Dist_Histogram(7) = Line_Dist_Histogram(7)+1;
      elseif org_points_distances(i) >= 35 && org_points_distances(i) < 40
           Line_Dist_Histogram(8) = Line_Dist_Histogram(8)+1;
      else
           Line_Dist_Histogram(9) = Line_Dist_Histogram(9)+1;
      end
end      
LD_Hist = Line_Dist_Histogram;
end

