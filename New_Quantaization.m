function Angles_Histogram = New_Quantaization( org_seg_angles )
   Seg_Angles_Histogram = zeros(1,12);
   Seg_length = size ( org_seg_angles);
  for i = 1 : Seg_length(2)
      %% Quantaization on the base of 16 periods 
%       if org_seg_angles(i) >= 0 && org_seg_angles(i) < 11.25
%            Seg_Angles_Histogram(1) = Seg_Angles_Histogram(1)+ 1;
%        elseif org_seg_angles(i) >= 11.25 && org_seg_angles(i) < 22.5
%            Seg_Angles_Histogram(2) = Seg_Angles_Histogram(2)+1;
%        elseif org_seg_angles(i) >= 22.5 && org_seg_angles(i) < 33.75
%            Seg_Angles_Histogram(3) = Seg_Angles_Histogram(3)+1;
%        elseif org_seg_angles(i) >= 33.75 && org_seg_angles(i) < 45
%            Seg_Angles_Histogram(4) = Seg_Angles_Histogram(4)+1;
%        elseif org_seg_angles(i) >= 45 && org_seg_angles(i) < 56.25
%            Seg_Angles_Histogram(5)= Seg_Angles_Histogram(5)+1; 
%        elseif org_seg_angles(i) >= 56.25 && org_seg_angles(i) < 67.5
%            Seg_Angles_Histogram(6) = Seg_Angles_Histogram(6)+1;
%        elseif org_seg_angles(i) >= 67.5 && org_seg_angles(i) < 78.75
%            Seg_Angles_Histogram(7) = Seg_Angles_Histogram(7)+1;
%        elseif org_seg_angles(i) >= 78.75 && org_seg_angles(i) < 90
%            Seg_Angles_Histogram(8) = Seg_Angles_Histogram(8)+1;
%        elseif org_seg_angles(i) >= 90 && org_seg_angles(i) < 101.25
%            Seg_Angles_Histogram(9) = Seg_Angles_Histogram(9)+1;
%        elseif org_seg_angles(i) >= 101.25 && org_seg_angles(i) < 112.5
%            Seg_Angles_Histogram(10) = Seg_Angles_Histogram(10)+1;
%        elseif org_seg_angles(i) >= 112.5 && org_seg_angles(i) < 123.75
%            Seg_Angles_Histogram(11) = Seg_Angles_Histogram(11)+1;
%        elseif org_seg_angles(i) >= 123.75 && org_seg_angles(i) < 135
%            Seg_Angles_Histogram(12) = Seg_Angles_Histogram(12)+1; 
%        elseif org_seg_angles(i) >= 135 && org_seg_angles(i) < 146.25
%            Seg_Angles_Histogram(13) = Seg_Angles_Histogram(13)+1;
%        elseif org_seg_angles(i) >= 146.25 && org_seg_angles(i) < 157.5
%            Seg_Angles_Histogram(14) = Seg_Angles_Histogram(14)+1;
%        elseif org_seg_angles(i) >= 157.5 && org_seg_angles(i) < 168.75
%            Seg_Angles_Histogram(15) = Seg_Angles_Histogram(15)+1;
%        else
%            Seg_Angles_Histogram(16) = Seg_Angles_Histogram(16)+1;
%       end
  %% Quantaization on the base of 12 periods
       if org_seg_angles(i) >= 0 && org_seg_angles(i) < 15
           Seg_Angles_Histogram(1) = Seg_Angles_Histogram(1)+ 1;
       elseif org_seg_angles(i) >= 15 && org_seg_angles(i) < 30
           Seg_Angles_Histogram(2) = Seg_Angles_Histogram(2)+1;
       elseif org_seg_angles(i) >= 30 && org_seg_angles(i) < 45
           Seg_Angles_Histogram(3) = Seg_Angles_Histogram(3)+1;
       elseif org_seg_angles(i) >= 45 && org_seg_angles(i) < 60
           Seg_Angles_Histogram(4) = Seg_Angles_Histogram(4)+1;
       elseif org_seg_angles(i) >= 60 && org_seg_angles(i) < 75
           Seg_Angles_Histogram(5)= Seg_Angles_Histogram(5)+1; 
       elseif org_seg_angles(i) >= 75 && org_seg_angles(i) < 90
           Seg_Angles_Histogram(6) = Seg_Angles_Histogram(6)+1;
       elseif org_seg_angles(i) >= 90 && org_seg_angles(i) < 105
           Seg_Angles_Histogram(7) = Seg_Angles_Histogram(7)+1;
       elseif org_seg_angles(i) >= 105 && org_seg_angles(i) < 120
           Seg_Angles_Histogram(8) = Seg_Angles_Histogram(8)+1;
       elseif org_seg_angles(i) >= 120 && org_seg_angles(i) < 135
           Seg_Angles_Histogram(9) = Seg_Angles_Histogram(9)+1;
       elseif org_seg_angles(i) >= 135 && org_seg_angles(i) < 150
           Seg_Angles_Histogram(10) = Seg_Angles_Histogram(10)+1;
       elseif org_seg_angles(i) >= 150 && org_seg_angles(i) < 165
           Seg_Angles_Histogram(11) = Seg_Angles_Histogram(11)+1;
       else
           Seg_Angles_Histogram(12) = Seg_Angles_Histogram(12)+1;
       end
%% Quantaization on the base of 8 periods
%        if org_seg_angles(i) >= 0 && org_seg_angles(i) < 22.5
%            Seg_Angles_Histogram(1) = Seg_Angles_Histogram(1)+ 1;
%        elseif org_seg_angles(i) >= 22.5 && org_seg_angles(i) < 45
%            Seg_Angles_Histogram(2) = Seg_Angles_Histogram(2)+1;
%        elseif org_seg_angles(i) >= 45 && org_seg_angles(i) < 67.5
%            Seg_Angles_Histogram(3) = Seg_Angles_Histogram(3)+1;
%        elseif org_seg_angles(i) >= 67.5 && org_seg_angles(i) < 90
%            Seg_Angles_Histogram(4) = Seg_Angles_Histogram(4)+1;
%        elseif org_seg_angles(i) >= 90 && org_seg_angles(i) < 112.5
%            Seg_Angles_Histogram(5)= Seg_Angles_Histogram(5)+1; 
%        elseif org_seg_angles(i) >= 112.5 && org_seg_angles(i) < 135
%            Seg_Angles_Histogram(6) = Seg_Angles_Histogram(6)+1;
%        elseif org_seg_angles(i) >= 135 && org_seg_angles(i) < 157.5
%            Seg_Angles_Histogram(7) = Seg_Angles_Histogram(7)+1;
%        else
%            Seg_Angles_Histogram(8) = Seg_Angles_Histogram(8)+1;
%        end
%% Quantaization on the base of 8 periods
%        if org_seg_angles(i) >= 0 && org_seg_angles(i) < 30
%            Seg_Angles_Histogram(1) = Seg_Angles_Histogram(1)+ 1;
%        elseif org_seg_angles(i) >= 30 && org_seg_angles(i) < 60
%            Seg_Angles_Histogram(2) = Seg_Angles_Histogram(2)+1;
%        elseif org_seg_angles(i) >= 60 && org_seg_angles(i) < 90
%            Seg_Angles_Histogram(3) = Seg_Angles_Histogram(3)+1;
%        elseif org_seg_angles(i) >= 90 && org_seg_angles(i) < 120
%            Seg_Angles_Histogram(4) = Seg_Angles_Histogram(4)+1;
%        elseif org_seg_angles(i) >= 120 && org_seg_angles(i) < 150
%            Seg_Angles_Histogram(5)= Seg_Angles_Histogram(5)+1; 
%        else 
%            Seg_Angles_Histogram(6) = Seg_Angles_Histogram(6)+1;
%        end
end
Angles_Histogram = Seg_Angles_Histogram;
end

