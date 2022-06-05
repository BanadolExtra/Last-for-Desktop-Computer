function Conn_Com_Features = Calculate_Conn_Com_Features( dilatedImage, Opt_Poly, sub_folder_name,win_size)
Writer_ID = str2num(sub_folder_name); 
Extracted_features = [];
win = floor(win_size/2);
for i=1 : length(Opt_Poly)
   curr_win = dilatedImage(Opt_Poly(i,1)-win:Opt_Poly(i,1)+win,Opt_Poly(i,2)-win:Opt_Poly(i,2)+win);
   %% implementation of LBP patterns
%    curr_lbp = efficientLBP(curr_win);
%    temp_lbp = reshape(curr_lbp,[1,win_size*win_size]);
%    h1=hist(temp_lbp(:),0:255);
%% Implementation of LPQ 
   curr_lpq = lpq_basic(curr_win);
   temp_lpq = reshape(curr_lpq,[1,win_size*win_size]);
%    h2=hist(temp_lbp(:),0:255);   
%% Implementation of LTP patterns
%     [H L T]=ltp_image(curr_win, 'P8R2', 0);
% %     temp_ltp_L = reshape(L,[1,win_size*win_size]);
%     temp_ltp_H = reshape(H,[1,win_size*win_size]);

%% Tmplementation of WLD
%    curr_WLD = WLD_DescriptorMOp1(curr_win,4,4,5,8,2);
%    Extracted_features = [ Extracted_features; curr_WLD Writer_ID];
   %temp = reshape(curr_WLD,[1,25]);
   %% Merging features (Fusion)
%    Extracted_features = [ Extracted_features; h1 h2 ];% temp_lpq temp_ltp ];% Writer_ID];
   Extracted_features = [ Extracted_features; temp_lpq ];% temp_lpq temp_ltp ];% Writer_ID];
end

h = hist(Extracted_features(:),0:255);
% h= Extracted_features;
 h = h/sum(h(:));
%  w= Writer_ID.*ones(size(Extracted_features,1),1);
 h = [h Writer_ID]; 
Conn_Com_Features = h;
end

