function  Quantaized_Angle  = Angle_Quantization( point_angle )
%
  if point_angle >= 0 && point_angle < 11.25
      point_angle = 1;
  elseif point_angle >= 11.25 && point_angle < 22.5
      point_angle = 2;
  elseif point_angle >= 22.5 && point_angle < 33.75
      point_angle = 3;
  elseif point_angle >= 33.75 && point_angle < 45
      point_angle = 4;
  elseif point_angle >= 45 && point_angle < 56.25
      point_angle = 5; 
  elseif point_angle >= 56.25 && point_angle < 67.5
      point_angle = 6;
  elseif point_angle >= 67.5 && point_angle < 78.75
      point_angle = 7;
  elseif point_angle >= 78.75 && point_angle < 90
      point_angle = 8;
  elseif point_angle >= 90 && point_angle < 101.25
      point_angle = 9;
  elseif point_angle >= 101.25 && point_angle < 112.5
      point_angle = 10;
  elseif point_angle >= 112.5 && point_angle < 123.75
      point_angle = 11;
  elseif point_angle >= 123.75 && point_angle < 135
      point_angle = 12; 
  elseif point_angle >= 135 && point_angle < 146.25
      point_angle = 13;
  elseif point_angle >= 146.25 && point_angle < 157.5
      point_angle = 14;
  elseif point_angle >= 157.5 && point_angle < 168.75
      point_angle = 15;
  else
      point_angle = 16;
  end
  Quantaized_Angle = point_angle;

