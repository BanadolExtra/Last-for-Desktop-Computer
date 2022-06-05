clear all;
image = imread('E:\KHATT_PARA4\segmented files\0213\3_25.bmp');
%imshow(image);
padded_image = padarray(image, [2 2]);
% figure
% imshow(padded_image);
%padded_image = imrotate( padded_image , -90 ); 
contour(padded_image,1) ;
