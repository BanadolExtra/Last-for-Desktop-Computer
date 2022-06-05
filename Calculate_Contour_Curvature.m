function Contour_Points_Curvatures = Calculate_Contour_Curvature( img  )
 
   boundaries = bwboundaries(img);
   x = boundaries{1}(:, 2);
   y = boundaries{1}(:, 1);
   windowSize = 9;
   halfWidth = floor(windowSize/2);   %half window size
   curvatures = zeros(size(x));
  %k =5
for k = halfWidth+1 : length(x) - halfWidth
	theseX = x(k-halfWidth:k+halfWidth);   % 9 element of x
	theseY = y(k-halfWidth:k+halfWidth);   % 9 element of y
	% Get a fit.
	%coefficients = polyfit(theseX, theseY, 2);
    [coefficients,~,mu] = polyfit(theseX, theseY, 1);
    % Get the curvature
	curvatures(k) = coefficients(1);
% 	xc(k) = x(k);
% 	yc(k) = y(k);	
end
% Get rid of ridiculous curvatures (straight line segments).
 curvatures(abs(curvatures) > 20) = 0;
 Contour_Points_Curvatures = [x y curvatures ];
end

