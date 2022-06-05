%--------------------------------------------------------------------------
%     Calculate Differential Excitation and Gradient Orientation
%==========================================================================
% INPUT:
%       M: original image in gray scale
% OUTPUT:
%       DE: Differential Ecitation
%       GO: Gradient Orientation
%--------------------------------------------------------------------------
function [DE, GO] = ComputeDE_GO_M(M, P, R)

d_image=double(M);

% Determine the dimensions of the input image.
[ysize xsize] = size(M);

% Block size, each WLD code is computed within a block of size bsizey*bsizex
bsizey = 3;
bsizex = 3;

BELTA = 5; % to avoid that center pixture is equal to zero
ALPHA = 3; % like a lens to magnify or shrink the difference between neighbors
EPSILON =0.0000001;
PI = 3.141592653589;
numNeighbors = 8;  % using 3*3 patch for example

% Minimum allowed size for the input image depends
% on the radius of the used LBP operator.
if(xsize < bsizex || ysize < bsizey)
  error('Too small input image. Should be at least (2*radius+1) x (2*radius+1)');
end
%--------------------------------------------------------------------------
% Filters: Select Filters
%--------------------------------------------------------------------------
if(P == 8); 
    f00=[1, 1, 1; 1, -8, 1; 1, 1, 1]; 
elseif(P == 16); 
    f00=[1, 1,  1,  1, 1;
         1, 0,  0,  0, 1;
         1, 0, -16, 0, 1;
         1, 0,  0,  0, 1;
         1, 1,  1,  1, 1]; 
elseif(P == 24);
    f00=[1, 1, 1,  1,  1, 1, 1; 
         1, 0, 0,  0,  0, 0, 1;
         1, 0, 0,  0,  0, 0, 1;
         1, 0, 0, -24, 0, 0, 1; 
         1, 0, 0,  0,  0, 0, 1;
         1, 0, 0,  0,  0, 0, 1;
         1, 1, 1,  1,  1, 1, 1]; 
end;
%--------------------------------------------------------------------------
% Compute DE and GO: Case 1 - P:8, R:1
%--------------------------------------------------------------------------
if(P == 8);
    % Calculate dx and dy;
    dx = xsize - bsizex;
    dy = ysize - bsizey;

    % Initialize the result matrix with zeros.
    d_differential_excitation = zeros(ysize, xsize);
    d_gradient_orientation    = zeros(ysize, xsize);

    %Compute the WLD code per pixle
    for y = 2:ysize-1
        for x = 2:xsize-1
             N=d_image(y-1:y+1,x-1:x+1); % 3*3 block neighbors
             center=d_image(y,x);

            % step 1 compute differential excitationt
            v00=sum(sum(f00 .* N));
            v01=center + BELTA; % BELTA to avoid that center pixture is equal to zero
            if ( v01 ~= 0 )
                d_differential_excitation(y,x)=atan(ALPHA*v00/v01);% ALPHA like a lens to magnify or shrink the difference between neighbors
            else
                d_differential_excitation(y,x)=0.1;% set the phase of the current pixel directly by WLD
            end

             % step 2 compute gradient orientation
             N1=d_image(y-1,x);         N5=d_image(y+1,x);
             N3=d_image(y,x+1);         N7=d_image(y,x-1);

             if ( abs(N7-N3) < EPSILON)		d_gradient_orientation(y,x) = 0;
             else
                 v10=N5-N1;		v11=N7-N3; % Original
                 %%v10=N1-N5;		v11=N3-N7;
                 %v10=N5-N1;		v11=N3-N7;
                 d_gradient_orientation(y,x) = atan(v10/v11);

                 % transform to a degree for convient visualization
                 d_gradient_orientation(y,x)=d_gradient_orientation(y,x)*180/PI;

                 if     (v11 >  EPSILON && v10 >  EPSILON)		
                     d_gradient_orientation(y,x)= d_gradient_orientation(y,x)+ 0;    % the first quadrant
                 elseif (v11 < -EPSILON && v10 >  EPSILON)      
                     d_gradient_orientation(y,x)= d_gradient_orientation(y,x)+ 180;  % the second quadrant
                 elseif (v11 < -EPSILON && v10 < -EPSILON)      
                     d_gradient_orientation(y,x)= d_gradient_orientation(y,x)+ 180;  % the third quadrant
                 elseif (v11 >  EPSILON && v10 < -EPSILON)		
                     d_gradient_orientation(y,x)= d_gradient_orientation(y,x)+ 360;  % the fourth quadrant
                 end
             end
        end
    end
    DE = d_differential_excitation(2:ysize-1, 2:xsize-1);
    GO = d_gradient_orientation(2:ysize-1, 2:xsize-1);
%--------------------------------------------------------------------------
% Compute DE and GO: Case 1 - P:16, R:2
%--------------------------------------------------------------------------
elseif(P == 16);
    % Calculate dx and dy;
    dx = xsize - bsizex;
    dy = ysize - bsizey;

    % Initialize the result matrix with zeros.
    d_differential_excitation = zeros(ysize, xsize);
    d_gradient_orientation    = zeros(ysize, xsize);

    %Compute the WLD code per pixle
    for y = 3:ysize-2
        for x = 3:xsize-2
             N=d_image(y-2:y+2,x-2:x+2); % 5*5 block neighbors
             center=d_image(y,x);

            % step 1 compute differential excitationt
            v00=sum(sum(f00 .* N));
            v01=center + BELTA; % BELTA to avoid that center pixture is equal to zero
            if ( v01 ~= 0 )
                d_differential_excitation(y,x)=atan(ALPHA*v00/v01);% ALPHA like a lens to magnify or shrink the difference between neighbors
            else
                d_differential_excitation(y,x)=0.1;% set the phase of the current pixel directly by WLD
            end

             % step 2 compute gradient orientation
             N1=d_image(y-2,x);         N5=d_image(y+2,x);
             N3=d_image(y,x+2);         N7=d_image(y,x-2);

             if ( abs(N7-N3) < EPSILON)		d_gradient_orientation(y,x) = 0;
             else
                 v10=N5-N1;		v11=N7-N3; % Original
                 %%v10=N1-N5;		v11=N3-N7;
                 %v10=N5-N1;		v11=N3-N7;
                 d_gradient_orientation(y,x) = atan(v10/v11);

                 % transform to a degree for convient visualization
                 d_gradient_orientation(y,x)=d_gradient_orientation(y,x)*180/PI;

                 if     (v11 >  EPSILON && v10 >  EPSILON)		
                     d_gradient_orientation(y,x)= d_gradient_orientation(y,x)+ 0;    % the first quadrant
                 elseif (v11 < -EPSILON && v10 >  EPSILON)      
                     d_gradient_orientation(y,x)= d_gradient_orientation(y,x)+ 180;  % the second quadrant
                 elseif (v11 < -EPSILON && v10 < -EPSILON)      
                     d_gradient_orientation(y,x)= d_gradient_orientation(y,x)+ 180;  % the third quadrant
                 elseif (v11 >  EPSILON && v10 < -EPSILON)		
                     d_gradient_orientation(y,x)= d_gradient_orientation(y,x)+ 360;  % the fourth quadrant
                 end
             end
        end
    end
    DE = d_differential_excitation(3:ysize-2, 3:xsize-2);
    GO = d_gradient_orientation(3:ysize-2, 3:xsize-2);
%--------------------------------------------------------------------------
% Compute DE and GO: Case 1 - P:24, R:3
%--------------------------------------------------------------------------
elseif(P == 24);
    % Calculate dx and dy;
    dx = xsize - bsizex;
    dy = ysize - bsizey;

    % Two matrices 
    % Initialize the result matrix with zeros.
    d_differential_excitation = zeros(ysize, xsize);
    d_gradient_orientation    = zeros(ysize, xsize);

    % d_differential_excitation = zeros(dy+1,dx+1);
    % d_gradient_orientation    = zeros(dy+1,dx+1);

    %Compute the WLD code per pixle
    for y = 4:ysize-3
        for x = 4:xsize-3
             N=d_image(y-3:y+3,x-3:x+3); % 3*3 block neighbors
             center=d_image(y,x);

            % step 1 compute differential excitationt
            v00=sum(sum(f00 .* N));
            v01=center + BELTA; % BELTA to avoid that center pixture is equal to zero
            if ( v01 ~= 0 )
                d_differential_excitation(y,x)=atan(ALPHA*v00/v01);% ALPHA like a lens to magnify or shrink the difference between neighbors
            else
                d_differential_excitation(y,x)=0.1;% set the phase of the current pixel directly by WLD
            end

             % step 2 compute gradient orientation
             N1=d_image(y-3,x);         N5=d_image(y+3,x);
             N3=d_image(y,x+3);         N7=d_image(y,x-3);

             if ( abs(N7-N3) < EPSILON)		d_gradient_orientation(y,x) = 0;
             else
                 v10=N5-N1;		v11=N7-N3; % Original
                 %%v10=N1-N5;		v11=N3-N7;
                 %v10=N5-N1;		v11=N3-N7;
                 d_gradient_orientation(y,x) = atan(v10/v11);

                 % transform to a degree for convient visualization
                 d_gradient_orientation(y,x)=d_gradient_orientation(y,x)*180/PI;

                 if     (v11 >  EPSILON && v10 >  EPSILON)		
                     d_gradient_orientation(y,x)= d_gradient_orientation(y,x)+ 0;    % the first quadrant
                 elseif (v11 < -EPSILON && v10 >  EPSILON)      
                     d_gradient_orientation(y,x)= d_gradient_orientation(y,x)+ 180;  % the second quadrant
                 elseif (v11 < -EPSILON && v10 < -EPSILON)      
                     d_gradient_orientation(y,x)= d_gradient_orientation(y,x)+ 180;  % the third quadrant
                 elseif (v11 >  EPSILON && v10 < -EPSILON)		
                     d_gradient_orientation(y,x)= d_gradient_orientation(y,x)+ 360;  % the fourth quadrant
                 end
             end
        end
    end
    DE = d_differential_excitation(4:ysize-3, 4:xsize-3);
    GO = d_gradient_orientation(4:ysize-3, 4:xsize-3);
end;