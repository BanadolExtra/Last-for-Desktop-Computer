function Conv_or_Conc = Is_Convex( Curve_Seg )
%This function tool is just to check whether the curve segment is Convex 
 % or Concave according to the formula of consecutive points cross product
 % I discovered that this is not useful for our feature
i = 2;
Curve_Seg_Length = size(Curve_Seg);
C = [];
a = Curve_Seg;
  while i <= Curve_Seg_Length(1)-1
       C(i-1) = (a(i,1)-a(i-1,1))*(a(i+1,2)-a(i,2)) - (a(i,2)-a(i-1,2))*(a(i+1,1)-a(i,1));
       i = i+1;
  end
  Conv_or_Conc = C;


end

