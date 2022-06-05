% Clean up.
clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
clear;  % Erase all existing variables. Or clearvars if you want.
workspace;  % Make sure the workspace panel is showing.
format long g;
format compact;
fontSize = 20;

% Change the current folder to the folder of this m-file.
% (The line of code below is from Brett Shoelson of The Mathworks.)
% Don't use these lines if you're calling this from another m-file.
if(~isdeployed)
	cd(fileparts(which(mfilename)));
end

% Check that user has the Image Processing Toolbox installed.
hasIPT = license('test', 'image_toolbox');
if ~hasIPT
	% User does not have the toolbox installed.
	message = sprintf('Sorry, but you do not seem to have the Image Processing Toolbox.\nDo you want to try to continue anyway?');
	reply = questdlg(message, 'Toolbox missing', 'Yes', 'No', 'Yes');
	if strcmpi(reply, 'No')
		% User said No, so exit.
		return;
	end
end


%===============================================================================
% Read in a standard MATLAB color demo image.
folder = 'C:\Users\Meshoo\Documents';
baseFileName = 'conv.png';
% Get the full filename, with path prepended.
fullFileName = fullfile(folder, baseFileName);
if ~exist(fullFileName, 'file')
	% Didn't find it there.  Check the search path for it.
	fullFileName = baseFileName; % No path this time.
	if ~exist(fullFileName, 'file')
		% Still didn't find it.  Alert user.
		errorMessage = sprintf('Error: %s does not exist.', fullFileName);
		uiwait(warndlg(errorMessage));
		return;
	end
end
grayImage = imread(fullFileName);
% Get the dimensions of the image.  
% numberOfColorBands should be = 1.
[rows, columns, numberOfColorBands] = size(grayImage);
if numberOfColorBands > 1
	% It's not really gray scale like we expected - it's color.
	% Convert it to gray scale by taking only the green channel.
	grayImage = grayImage(:, :, 2); % Take green channel.
end
% Display the original gray scale image.
subplot(2, 2, 1);
imshow(grayImage, []);
title('Original Grayscale Image', 'FontSize', fontSize);
% Enlarge figure to full screen.
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
% Give a name to the title bar.
set(gcf, 'Name', 'Demo by ImageAnalyst', 'NumberTitle', 'Off') 

% Get the boundaries, but first you need to binarieze the image into a logical image.
binaryImage = grayImage > 128;
% bwboundaries() returns a cell array, where each cell contains the row/column coordinates for an object in the image.
% Plot the borders of all the coins on the original grayscale image using the coordinates returned by bwboundaries.
subplot(2, 2, 2);
set(gca, 'ydir', 'reverse');
title('Outlines, from bwboundaries()', 'FontSize', fontSize);
hold on;
boundaries = bwboundaries(binaryImage);
numberOfBoundaries = size(boundaries, 1);
for k = 1 : numberOfBoundaries
	thisBoundary = boundaries{k};
	plot(thisBoundary(:,2), thisBoundary(:,1), 'g', 'LineWidth', 2);
end
hold off;

% Get the curvature at each point of the first curve.
x = boundaries{1}(:, 2);
y = boundaries{1}(:, 1);
windowSize = 19;
halfWidth = floor(windowSize/2);
curvatures = zeros(size(x));
for k = halfWidth+1 : length(x) - halfWidth
	theseX = x(k-halfWidth:k+halfWidth);
	theseY = y(k-halfWidth:k+halfWidth);
	% Get a fit.
	coefficients = polyfit(theseX, theseY, 2);
	% Get the curvature
	curvatures(k) = coefficients(1);
	xc(k) = x(k);
	yc(k) = y(k);	
end
% Get rid of ridiculous curvatures (straight line segments).
curvatures(abs(curvatures) > 20) = 0;
subplot(2, 2, 3);
plot(x, curvatures, 'b-');
hold on 
plot(y, curvatures, 'r-');
title('Curvatures', 'FontSize', fontSize);

% Make up a colormap
minC = min(curvatures)
maxC = max(curvatures)
range = ceil(maxC - minC)
myColorMap = jet(range);
% Display the image again.
subplot(2,2,4);
imshow(binaryImage);
hold on;
for k = halfWidth+1 : length(x) - halfWidth
	% Get the index in the color map.
	thisIndex = round(size(myColorMap, 1) * (curvatures(k) - minC) / range)
	fprintf('For point #%d, the colormap index is %d\n', k, thisIndex);
	if thisIndex <= 0
		thisIndex = 1;
	end
	if isnan(thisIndex)
		thisIndex = 1;
	end
	% Extract out the RGB triplet for this particular row in the color map.
	thisColor = myColorMap(thisIndex, :);
	plot(x(k), y(k), '.', 'MarkerSize', 25, 'Color', thisColor);
end
title('Curvatures Indicated by Colors', 'FontSize', fontSize);
