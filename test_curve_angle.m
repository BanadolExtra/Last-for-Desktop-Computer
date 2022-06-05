boundary = [5; 10; 15; 20;
            25; 30; 35; 40;
            45; 50; 55; 60; 
            65; 70; 75; 80; 85];
contour_length = length(boundary);
prev_point_index = 0;
next_point_index = 0;
line_segment_length = 5; 
result = [];
for i = 1 : contour_length 
  if i<= line_segment_length 
     prev_point_index = i+contour_length -line_segment_length;
     next_point_index = i+line_segment_length;
  elseif i> contour_length - line_segment_length
    prev_point_index = i- line_segment_length;
    % next_point_index = mod((i+contour_length),line_segment_length);
    next_point_index = line_segment_length-(contour_length-i);
  else
     prev_point_index = i- line_segment_length;
     next_point_index = i+ line_segment_length;
  end 
  result = [result; boundary(prev_point_index)+boundary(next_point_index)]; 
  end 
     