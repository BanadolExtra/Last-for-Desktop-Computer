BW = imread('E:\KHATT_PARA4\segmented files\0213\0.bmp');
imshow(BW);
%---------------------------
BW2 = bwmorph(BW,'remove');
figure
imshow(BW2)
%------------------------------
BW3 = bwmorph(BW,'skel',Inf);
figure
imshow(BW3)