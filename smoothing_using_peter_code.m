
clear all;
image = imread('E:\KHATT_PARA4\segmented files\0213\3_25.bmp');
image = padarray(image, [3 3]);
imshow(image);
%-----------------------------------------
dilatedImage = imdilate(image,strel('disk',1));
figure
imshow(dilatedImage);
%-----------------------------------
% useing skeleton function
% BW3 = bwmorph(dilatedImage,'skel',Inf);
% figure
% imshow(BW3);
%-------------------------------------
thinedImage = bwmorph(dilatedImage,'thin',inf);
figure
imshow(thinedImage);
%-----------------------------------------------
% using Canny operator to detect edges
%canny_img = edge(thinedImage,'canny');
canny_img = edge(dilatedImage,'canny', [0.1 0.2], 1);
figure;
imshow(canny_img);

[C,h] = contour(dilatedImage,1) ;


%w = h.LineWidth;
%------------------------------------------------
 % Link edge pixels together into lists of sequential edge points, one
 % list for each edge contour. A contour/edgelist starts/stops at an 
 % ending or a junction with another contour/edgelist.
 % Here we discard contours less than 10 pixels long.
 [edgelist, labelededgeim] = edgelink(canny_img, 10);
    
    % Display the edgelists with random colours for each distinct edge 
    % in figure 2

  drawedgelist(edgelist, size(canny_img), 1, 'rand', 2); axis off        


