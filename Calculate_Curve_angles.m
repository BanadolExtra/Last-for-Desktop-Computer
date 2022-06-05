function curve_points_angles = Calculate_Curve_angles( boundary )
  contour_length = length(boundary);
  prev_point_index = 0;
  next_point_index = 0;
  line_segment_length = 9;% This should be specified empirically
  a = [];
  b = [];
  c = [];
  points_angles = [];
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
  % formal rule
%   theta1 = mod(atan2(a(1)*b(2)- b(1)* a(2), a(1)* b(1)+ a(2)* b(2)),2*pi)* (180/pi);
%   theta2 = mod(atan2(b(1)*c(2)- c(1)* b(2), b(1)* c(1)+ b(2)* c(2)),2*pi)* (180/pi);
  % informal rule
  theta1 = (atan((b(2)- a(2))/ (b(1) - a(1))))* (180/pi);
  theta2 = (atan((b(2)- c(2))/ (b(1) - c(1))))* (180/pi);     
  curve_point_angle = min(norm(theta2-theta1),360 - norm(theta2-theta1));
  theta1 = wrapTo360(theta1);
  theta2 = wrapTo360(theta2);
  % here is the quantaization function invoke
  %curve_point_angle = Angle_Quantization(curve_point_angle);
  %points_angles = [points_angles; boundary(i,1) boundary(i,2) curve_point_angle];
  points_angles = [points_angles; theta1 theta2 curve_point_angle];
end 
curve_points_angles = points_angles;




