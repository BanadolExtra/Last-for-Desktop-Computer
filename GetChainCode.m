function ChainCode = GetChainCode( C )

%
% C is a contour (C(:,1) is the y-coordinate, C(:,2) is the x-coordinate)
Cx = C(:,2);
Cy = C(:,1);

ChainCode = zeros(1, length(C)-1);

for i=1:length(C)-1
	
	if (Cx(i+1) == (Cx(i)+1)) && (Cy(i+1) == Cy(i))          % 0 direction
		ChainCode(i) = 0;
	elseif (Cx(i+1) == (Cx(i)+1)) && (Cy(i+1) == (Cy(i)+1))  % 1 direction
		ChainCode(i) = 7;
	elseif (Cx(i+1) == Cx(i)) && (Cy(i+1) == (Cy(i)+1))      % 2 direction
		ChainCode(i) = 6;
	elseif (Cx(i+1) == (Cx(i)-1)) && (Cy(i+1) == (Cy(i)+1))  % 3 direction
		ChainCode(i) = 5;		
	elseif (Cx(i+1) == (Cx(i)-1)) && (Cy(i+1) == Cy(i))      % 4 direction
		ChainCode(i) = 4;	
	elseif (Cx(i+1) == (Cx(i)-1)) && (Cy(i+1) == (Cy(i)-1))  % 5 direction
		ChainCode(i) = 3;	
	elseif (Cx(i+1) == Cx(i)) && (Cy(i+1) == (Cy(i)-1))      % 6 direction
		ChainCode(i) = 2;	
	elseif (Cx(i+1) == (Cx(i)+1)) && (Cy(i+1) == (Cy(i)-1))  % 7 direction
		ChainCode(i) = 1;
	end
end

		
		
    	