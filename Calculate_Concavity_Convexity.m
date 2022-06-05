function curve_points_Concs = Calculate_Concavity_Convexity( boundary )
  contour_length = length(boundary);
  prev_point_index = 0;
  next_point_index = 0;
  line_segment_length = 9;% This should be specified empirically
  a = [];
  b = [];
  c = [];
  points_concs = [];
for i = 1 : contour_length 
  if i<= line_segment_length 
     prev_point_index = i+contour_length -line_segment_length;
     next_point_index = i+line_segment_length;
  elseif i> contour_length - line_segment_length
    prev_point_index = i- line_segment_length;
    next_point_index = line_segment_length-(contour_length-i);
  else
     prev_point_index = i- line_segment_length;
     next_point_index = i+ line_segment_length;
  end 
  a = [ boundary(prev_point_index,1) boundary(prev_point_index,2)]; 
  b = [ boundary(i,1) boundary(i,2)];
  c = [ boundary(next_point_index,1) boundary(next_point_index,2)];
  % here is the equation of calculating the distance from the center point
  % to the line that connects both curve's end points
  Perpendicular_Distance = abs((c(1)-a(1))*(a(2)-b(2)) - (a(1)-b(1))*(c(2)-a(2)))/sqrt((c(2)-a(2))^2 + (c(1)-a(1))^2);      
  %Perpendicular_Distance = abs(det(A))/abs(c(1)-a(1));
  Actual_Line_Seg_Length = sqrt((c(2)-a(2))^2 + (c(1)-a(1))^2);
  %% here is the angles calculations
  theta1 = (atan((b(2)- a(2))/ (b(1) - a(1))))* (180/pi);
  theta2 = (atan((b(2)- c(2))/ (b(1) - c(1))))* (180/pi);     
  %curve_point_angle = min(norm(theta2-theta1),360 - norm(theta2-theta1));
  theta1 = wrapTo360(theta1);
  theta2 = wrapTo360(theta2);
  points_concs = [points_concs; Perpendicular_Distance Actual_Line_Seg_Length theta1 theta2 ];
end 
curve_points_Concs = points_concs;
end


%% Here are the angles calculation if we need to add them later
% % formal rule
% %   theta1 = mod(atan2(a(1)*b(2)- b(1)* a(2), a(1)* b(1)+ a(2)* b(2)),2*pi)* (180/pi);
% %   theta2 = mod(atan2(b(1)*c(2)- c(1)* b(2), b(1)* c(1)+ b(2)* c(2)),2*pi)* (180/pi);
%   % informal rule
%   theta1 = (atan((b(2)- a(2))/ (b(1) - a(1))))* (180/pi);
%   theta2 = (atan((b(2)- c(2))/ (b(1) - c(1))))* (180/pi);     
%   curve_point_angle = min(norm(theta2-theta1),360 - norm(theta2-theta1));
%   theta1 = wrapTo360(theta1);
%   theta2 = wrapTo360(theta2);

