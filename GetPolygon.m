function Polyg = GetPolygon( Contour, ChainCode);
%
% C is a contour (C(:,1) is the y-coordinate, C(:,2) is the x-coordinate)
% ChainCode is the corresponding chaincode

CC           = ChainCode(1);
Polyg(1,1:2) = Contour(1,1:2);
Polyg(1,3)   = CC;
k          = 2;
Len        = 0;
for i=2:length(ChainCode);
	Len = Len + 1;
	if (ChainCode(i) ~= CC) % new direction
		CC           = ChainCode(i);
		Polyg(k,1:2) = Contour(i,:); % record the x and y coordiantes
		Polyg(k,3)   = CC;    % record the chain code
		Polyg(k-1,4) = Len; % record the number of hups
		k            = k + 1;
		Len          = 0;     % reset number of hups
	end
end
%[k Len CC Contour(1,1:2)]
Polyg(k-1,4) = Len+1; % record the length for last piece of polygon
Polyg(k,1:2) = Contour(1,1:2); % so that it is closed polygon
                              % note this last polygon point has no length
                              % or chain code or N
%
% compute the length of the polygon segment
for i=1:k-1
	if sum((Polyg(i,3) == [1 3 5 7]))
		Factor = sqrt(2);
	else
		Factor = 1;
	end
	Polyg(i,5) = Polyg(i,4) * Factor;
end
	

%
% a map to the original C variables
% Polyg(:,1) is PolyGy
% Polyg(:,2) is PolyGx
% Polyg(:,3) is PolyGc
% Polyg(:,4) is PolyGN
% Polyg(:,5) is PolyGl
