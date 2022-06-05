image = imread('E:\KHATT_PARA4\segmented files\0575\5_5.bmp');
image = padarray(image, [9 9]);
%-----------------------------------------
dilatedImage = imdilate(image,strel('disk',1));

% boundaries = bwboundaries(dilatedImage);
% x = boundaries{1}(:, 2);
% y = boundaries{1}(:, 1);
boundaries = traceit( dilatedImage );
x = boundaries(:, 2);
y = boundaries(:, 1);

windowSize = 19;
halfWidth = floor(windowSize/2);   %half window size
curvatures = zeros(size(x));
%
%k =10
for k = halfWidth+1 : length(x) - halfWidth
	theseX = x(k-halfWidth:k+halfWidth);   % 19 element of x
	theseY = y(k-halfWidth:k+halfWidth);   % 19 elemebt of y
	% Get a fit.
	coefficients = polyfit(theseX, theseY, 2);
	% Get the curvature
	curvatures(k) = coefficients(1);
	xc(k) = x(k);
	yc(k) = y(k);	
end