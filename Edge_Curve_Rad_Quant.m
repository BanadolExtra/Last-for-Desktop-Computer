function ECR_Hist = Edge_Curve_Rad_Quant(org_points_distances )
   ECR_Histogram = zeros(1,30);
   Seg_length = size ( org_points_distances);
  for i = 1 : Seg_length(2)
      if org_points_distances(i) >= 0 && org_points_distances(i) < 0.1
           ECR_Histogram(1) = ECR_Histogram(1)+ 1;
      elseif org_points_distances(i) >= 0.1 && org_points_distances(i) < 0.2
           ECR_Histogram(2) = ECR_Histogram(2)+1;
      elseif org_points_distances(i) >= 0.2 && org_points_distances(i) < 0.3
           ECR_Histogram(3) = ECR_Histogram(3)+1;
      elseif org_points_distances(i) >= 0.3 && org_points_distances(i) < 0.4
           ECR_Histogram(4) = ECR_Histogram(4)+1;
      elseif org_points_distances(i) >= 0.4 && org_points_distances(i) < 0.5
           ECR_Histogram(5)= ECR_Histogram(5)+1; 
      elseif org_points_distances(i) >= 0.5 && org_points_distances(i) < 0.6
           ECR_Histogram(6) = ECR_Histogram(6)+1;
      elseif org_points_distances(i) >= 0.6 && org_points_distances(i) < 0.7
           ECR_Histogram(7) = ECR_Histogram(7)+1;
      elseif org_points_distances(i) >= 0.7 && org_points_distances(i) < 0.8
           ECR_Histogram(8) = ECR_Histogram(8)+1;
      elseif org_points_distances(i) >= 0.8 && org_points_distances(i) < 0.9
           ECR_Histogram(9) = ECR_Histogram(9)+1;
      elseif org_points_distances(i) >= 0.9 && org_points_distances(i) < 1
           ECR_Histogram(10) = ECR_Histogram(10)+1;
      elseif org_points_distances(i) >= 1 && org_points_distances(i) < 1.1
           ECR_Histogram(11) = ECR_Histogram(11)+1;
      elseif org_points_distances(i) >= 1.1 && org_points_distances(i) < 1.2
           ECR_Histogram(12) = ECR_Histogram(12)+1;
      elseif org_points_distances(i) >= 1.2 && org_points_distances(i) < 1.3
           ECR_Histogram(13) = ECR_Histogram(13)+1;
      elseif org_points_distances(i) >= 1.3 && org_points_distances(i) < 1.4
           ECR_Histogram(14) = ECR_Histogram(14)+1;
      elseif org_points_distances(i) >= 1.4 && org_points_distances(i) < 1.5
           ECR_Histogram(15) = ECR_Histogram(15)+1;
      elseif org_points_distances(i) >= 1.5 && org_points_distances(i) < 1.6
           ECR_Histogram(16) = ECR_Histogram(16)+1;
      elseif org_points_distances(i) >= 1.6 && org_points_distances(i) < 1.7
           ECR_Histogram(17) = ECR_Histogram(17)+1;
      elseif org_points_distances(i) >= 1.7 && org_points_distances(i) < 1.8
           ECR_Histogram(18) = ECR_Histogram(18)+1;
      elseif org_points_distances(i) >= 1.8 && org_points_distances(i) < 1.9
           ECR_Histogram(19) = ECR_Histogram(19)+1;
      elseif org_points_distances(i) >= 1.9 && org_points_distances(i) < 2
           ECR_Histogram(20) = ECR_Histogram(20)+1;
      elseif org_points_distances(i) >= 2 && org_points_distances(i) < 2.2
           ECR_Histogram(21) = ECR_Histogram(21)+1;
      elseif org_points_distances(i) >= 2.2 && org_points_distances(i) < 2.4
           ECR_Histogram(22) = ECR_Histogram(22)+1;
      elseif org_points_distances(i) >= 2.4 && org_points_distances(i) < 2.6
           ECR_Histogram(23) = ECR_Histogram(23)+1;
      elseif org_points_distances(i) >= 2.6 && org_points_distances(i) < 2.8
           ECR_Histogram(24) = ECR_Histogram(24)+1;
      elseif org_points_distances(i) >= 2.8 && org_points_distances(i) < 3
           ECR_Histogram(25) = ECR_Histogram(25)+1;
      elseif org_points_distances(i) >= 3 && org_points_distances(i) < 3.2
           ECR_Histogram(26) = ECR_Histogram(26)+1;
      elseif org_points_distances(i) >= 3.2 && org_points_distances(i) < 3.4
           ECR_Histogram(27) = ECR_Histogram(27)+1;
      elseif org_points_distances(i) >= 3.4 && org_points_distances(i) < 3.6
           ECR_Histogram(28) = ECR_Histogram(28)+1;
      elseif org_points_distances(i) >= 3.6 && org_points_distances(i) < 3.8
           ECR_Histogram(29) = ECR_Histogram(29)+1;
      else
           ECR_Histogram(30) = ECR_Histogram(30)+1;
       
      end
end      
ECR_Hist = ECR_Histogram;
end


