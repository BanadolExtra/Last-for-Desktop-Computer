function curvature_Histogram = Curvature_Quantaization( org_points_curvatures )
   Seg_points_curv_Histogram = zeros(1,10);
   Seg_length = size ( org_points_curvatures);
  for i = 1 : Seg_length(2)
   %% Quantaization on the base of 10 periods
       if org_points_curvatures(i) >= -2.7386 && org_points_curvatures(i) < -2.1909
           Seg_points_curv_Histogram(1) = Seg_points_curv_Histogram(1)+ 1;
       elseif org_points_curvatures(i) >= -2.1909 && org_points_curvatures(i) < -1.6432
           Seg_points_curv_Histogram(2) = Seg_points_curv_Histogram(2)+1;
       elseif org_points_curvatures(i) >= -1.6432 && org_points_curvatures(i) < -1.0955
           Seg_points_curv_Histogram(3) = Seg_points_curv_Histogram(3)+1;
       elseif org_points_curvatures(i) >= -1.0955 && org_points_curvatures(i) < -0.5478
           Seg_points_curv_Histogram(4) = Seg_points_curv_Histogram(4)+1;
       elseif org_points_curvatures(i) >= -0.5478 && org_points_curvatures(i) < 0
           Seg_points_curv_Histogram(5)= Seg_points_curv_Histogram(5)+1; 
       elseif org_points_curvatures(i) >= 0 && org_points_curvatures(i) < 0.5478
           Seg_points_curv_Histogram(6) = Seg_points_curv_Histogram(6)+1;
       elseif org_points_curvatures(i) >= 0.5478 && org_points_curvatures(i) < 1.0954
           Seg_points_curv_Histogram(7) = Seg_points_curv_Histogram(7)+1;
       elseif org_points_curvatures(i) >= 1.0954 && org_points_curvatures(i) < 1.6431
           Seg_points_curv_Histogram(8) = Seg_points_curv_Histogram(8)+1;
       elseif org_points_curvatures(i) >= 1.6431 && org_points_curvatures(i) < 2.1908
           Seg_points_curv_Histogram(9) = Seg_points_curv_Histogram(9)+1;
       else
           Seg_points_curv_Histogram(10) = Seg_points_curv_Histogram(10)+1;
       end
  end
Seg_points_curv_Histogram = Seg_points_curv_Histogram/40;
curvature_Histogram = Seg_points_curv_Histogram;
end

