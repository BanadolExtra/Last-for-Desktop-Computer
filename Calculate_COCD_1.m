function Conn_Comp_Codes = Calculate_COCD_1( Contour, Optimized_Polygon, Writer_ID )
Optimized_Poly_Length = size(Optimized_Polygon);
Writer_ID = str2num(Writer_ID); 
conn_comp_code_words = [];
Edge_Length = 0;
Line_Distance = 0;
Curve_Edge_radius = 0;
Theta = 0;      
conn_comp_code_words = [conn_comp_code_words; Edge_Length Line_Distance Curve_Edge_radius Theta Writer_ID];
counter = 0;
for i = 1 : Optimized_Poly_Length(1) 
    if i == Optimized_Poly_Length(1) 
        break;
    else
        %% indecies setting
       [a b] = find(Contour(2: size(Contour,1),1)== Optimized_Polygon(i,1));
       [c d] = find(Contour(2: size(Contour,1),2)== Optimized_Polygon(i,2)); 
       curr_point_idx = intersect(a,c);
       [e f] = find(Contour(2: size(Contour,1),1)== Optimized_Polygon(i+1,1));
       [g h] = find(Contour(2: size(Contour,1),2)== Optimized_Polygon(i+1,2));
       next_point_idx = intersect(e,g);
       %% Temporary edge points list
       if  curr_point_idx < next_point_idx
          tmp_list = Contour (curr_point_idx:next_point_idx,:);    
       else
          tmp_list = Contour (next_point_idx:curr_point_idx,:);
       end
      % i
       tmp_list_length = size(tmp_list);
       %%
       x = [ Contour(curr_point_idx,1) Contour(curr_point_idx,2)]; 
       z = [ Contour(next_point_idx,1) Contour(next_point_idx,2)];
       % first attribute: e edge length in terms of number of points
       Edge_Length = tmp_list_length(1); %abs(next_point_idx - curr_point_idx);
       % second attribute: euclidean distance between two successive vertices
       Line_Distance = sqrt((z(2)- x(2))^2 + (z(1)- x(1))^2);
       % Third attribute: radius of the curve edge
       y = [tmp_list(ceil(tmp_list_length(1)/2),1) tmp_list(ceil(tmp_list_length(1)/2),2)];
       % Review this equation from the Polygon approximation paper
       Curve_Edge_radius = abs((z(1)-x(1))*(x(2)-y(2)) - (x(1)-y(1))*(z(2)-x(2)))/sqrt((z(2)-x(2))^2 + (z(1)-x(1))^2);
       % Fourth attribute: angle between each two successive vertices
       Theta = (atan((z(2)- x(2))/ (z(1) - x(1))))* (180/pi);     
       Theta = wrapTo360(Theta);
%        if i == 10 %97 || i==161
%         plot( y(1) ,y(2) , 'r+' );
%         plot( x(1) ,x(2) , 'g+' );%, 'MarkerSize', 10);
%         plot( z(1) ,z(2) , 'b+' );
%         hold  on;
%        end

    end
 % append writer id to the code word
   tmp_list = [];
   conn_comp_code_words = [conn_comp_code_words; Edge_Length Line_Distance Curve_Edge_radius Theta Writer_ID];
end
Conn_Comp_Codes_Dim = size(conn_comp_code_words);
conn_comp_code_words(Conn_Comp_Codes_Dim(1),:) = [];
conn_comp_code_words(1,:) = [];
% here is the quantaization part of the feature attributes
% Edge_Length_Histogram = Line_Dist_Quant(conn_comp_code_words(:,1)');
% Line_Dist_Histogram = Line_Dist_Quant(conn_comp_code_words(:,2)');
% Edge_Curve_Rad_Histogram = Edge_Curve_Rad_Quant(conn_comp_code_words(:,3)');
% Angle_Histogram = New_Quantaization_theta_1_2(conn_comp_code_words(:,4)');
% Conn_Comp_Codes = [Edge_Length_Histogram Line_Dist_Histogram Edge_Curve_Rad_Histogram Angle_Histogram Writer_ID];%conn_comp_code_words;
Conn_Comp_Codes = conn_comp_code_words;
end
%% here are the auxilary functions 
% Line Distance histogram function
