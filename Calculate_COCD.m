function Conn_Comp_Codes = Calculate_COCD( Contour, Optimized_Polygon, Writer_ID )
Optimized_Poly_Length = size(Optimized_Polygon);
Writer_ID = str2num(Writer_ID); 
conn_comp_code_words = [];
Edge_Length = 0;
Line_Distance = 0;
Curve_Edge_radius = 0;
Theta = 0;      
conn_comp_code_words = [conn_comp_code_words; Edge_Length Line_Distance Curve_Edge_radius Theta Writer_ID];
counter = 0;
for i = 2 : Optimized_Poly_Length(1) 
    if i == Optimized_Poly_Length(1) 
        break;
    else
        % indecies setting
       [a b] = find(Contour(2: size(Contour,1),1)== Optimized_Polygon(i,1));
       [c d] = find(Contour(2: size(Contour,1),2)== Optimized_Polygon(i,2)); 
       curr_point_idx = intersect(a,c);
       [e f] = find(Contour(2: size(Contour,1),1)== Optimized_Polygon(i+1,1));
       [g h] = find(Contour(2: size(Contour,1),2)== Optimized_Polygon(i+1,2));
       next_point_idx = intersect(e,g);
       x = [ Contour(curr_point_idx,1) Contour(curr_point_idx,2)]; 
       z = [ Contour(next_point_idx,1) Contour(next_point_idx,2)];
       % first attribute: e edge length in terms of number of points
       Edge_Length = abs(next_point_idx - curr_point_idx);
       % second attribute: euclidean distance between two successive vertices
       Line_Distance = sqrt((z(2)- x(2))^2 + (z(1)- x(1))^2);
       % Third attribute: radius of the curve edge
       if  curr_point_idx < next_point_idx
          tmp_list = Contour (curr_point_idx:next_point_idx,:);    
       else
          tmp_list = Contour (next_point_idx:curr_point_idx,:);
%           i
%           tmp_list_length = size(tmp_list)
       end
       %tmp_list = Contour (curr_point_idx:next_point_idx,:);
       tmp_list_length = size(tmp_list);
       y = [tmp_list(ceil(tmp_list_length(1)/2),1) tmp_list(ceil(tmp_list_length(1)/2),2)];
       if i == 85 %97 || i==161
        plot( y(1) ,y(2) , 'r+' );
        plot( x(1) ,x(2) , 'g+' );%, 'MarkerSize', 10);
        plot( z(1) ,z(2) , 'b+' );
        hold  on;
       end
       Curve_Edge_radius = abs((z(1)-x(1))*(x(2)-y(2)) - (x(1)-y(1))*(z(2)-x(2)))/sqrt((z(2)-x(2))^2 + (z(1)-x(1))^2);
       % Fourth attribute: angle between each two successive vertices
       Theta = (atan((z(2)- x(2))/ (z(1) - x(1))))* (180/pi);     
       Theta = wrapTo360(Theta);
    end
 % append writer id to the code word
   tmp_list = [];
   conn_comp_code_words = [conn_comp_code_words; Edge_Length Line_Distance Curve_Edge_radius Theta Writer_ID];
end
%counter
Conn_Comp_Codes = conn_comp_code_words;
end














%%

% for i = 1 : Optimized_Poly_Length(1)-1 
%     if i == Optimized_Poly_Length(1)
%         edg_length = 0;
%         Line_Distance = 0;
%         Curve_Edge_radius = 0;
%         Theta = 0;
%          %break
% %        [a b] = find(Contour(:,1)== Optimized_Polygon(i,1));
% %        [c d] = find(Contour(:,2)== Optimized_Polygon(i,2));
% %        curr_point_idx = intersect(a,c)
% %        [e f] = find(Contour(:,1)== Optimized_Polygon(1,1));
% %        [g h] = find(Contour(:,2)== Optimized_Polygon(1,2));
% %        next_point_idx = intersect(e,g)
%     else
%        [a b] = find(Contour(:,1)== Optimized_Polygon(i,1));
%        [c d] = find(Contour(:,2)== Optimized_Polygon(i,2)); 
%        curr_point_idx = intersect(a,c);
%        [e f] = find(Contour(:,1)== Optimized_Polygon(i+1,1));
%        [g h] = find(Contour(:,2)== Optimized_Polygon(i+1,2));
%        next_point_idx = intersect(e,g);
%     end
%     a = [ Contour(curr_point_idx,1) Contour(curr_point_idx,2)]; 
%     c = [ Contour(next_point_idx,1) Contour(next_point_idx,2)];
%     % first attribute: e edge length in terms of number of points
%      edg_length = abs(next_point_idx - curr_point_idx);
%     % second attribute: euclidean distance between two successive vertices
%      Line_Distance = sqrt((c(2)- a(2))^2 + (c(1)- c(1))^2);
%     % Third attribute: radius of the curve edge
%     if  next_point_idx ~= 1  
%       % a = [ Contour(curr_point_idx,1) Contour(curr_point_idx,2)]; 
%       if curr_point_idx < next_point_idx
%        tmp_list = Contour (curr_point_idx:next_point_idx,:);
%       else 
%        tmp_list = Contour (next_point_idx:curr_point_idx,:);
%       end
%        tmp_list_length = size(tmp_list);
%        b = [tmp_list(ceil(tmp_list_length(1)/2),1) tmp_list(ceil(tmp_list_length(1)/2),2)];
%        %b = [ Contour(curr_point_idx+(ceil(edg_length/2)),1) Contour(curr_point_idx+(ceil(edg_length/2)),2)];
%        %c = [ Contour(next_point_idx,1) Contour(next_point_idx,2)];
%        Curve_Edge_radius = abs((c(1)-a(1))*(a(2)-b(2)) - (a(1)-b(1))*(c(2)-a(2)))/sqrt((c(2)-a(2))^2 + (c(1)-a(1))^2);
%     else
%         Curve_Edge_radius = 1; 
%     end 
%     % Fourth attribute: angle between each two successive vertices
%     Theta = (atan((c(2)- a(2))/ (c(1) - a(1))))* (180/pi);     
%     Theta = wrapTo360(Theta);
%     % append writer id to the code word
%     tmp_list = [];
%    conn_comp_code_words = [conn_comp_code_words; edg_length Line_Distance Curve_Edge_radius Theta Writer_ID];
% end
% Conn_Comp_Codes = conn_comp_code_words;
% end
% 
