
% this function implements the algorithm in 
% "New nonparametric dominant point detection algorithm" - Chau and Siu (2001)
% adapted for the contour of a handwritten character

% input: the contour of the character
% output: the dominant points
function [domX domY domPos] = dominantPoint(contourX, contourY)
    
    totP = length(contourX);
    domI = zeros(totP, 1); % index of the dominant points
    
    
    contourX(totP + 1) = contourX(1);
    contourY(totP + 1) = contourY(1);
    contourX(totP + 2) = contourX(1);
    contourY(totP + 2) = contourY(1);

    % find initial set of dominant points    
    domI(1) = 1; 
    adjustX = [-1 0 1 -1 1 -1 0 1];
    adjustY = [1 1 1 0 0 -1 -1 -1];
    weight = [1 2 4 8 16 32 64 128];
    validTW = [5 10 11 12 13 14 17 18 19 21 33 34 35 42 48 65 68 72 73 80 84 96 97 104 112 130 132 134 136 144 146 160 168 176 196 200];
    for i = 3 : totP
        w = 0;
        for j = 1 : 8
            nx = contourX(i) + adjustX(j);
            ny = contourY(i) + adjustY(j);
            if (nx == contourX(i-2) && ny == contourY(i-2)) || (nx == contourX(i-1) && ny == contourY(i-1)) || (nx == contourX(i+1) && ny == contourY(i+1)) || (nx == contourX(i+2) && ny == contourY(i+2))
                w = w + weight(j);
            end
        end
        if ~isempty(find(validTW == w, 1)) % is the weight for this point is in valid weight list?
            domI(i) = 1;
%             plot(contourX(i), contourY(i), 'o');
        end
    end
    % plot
%     hold on;
%     domPos = find(domI == 1);
%     plot(contourX(domPos), contourY(domPos), 'o');

    % initial set of dominant points found
    
    % make pre-supression
    
    domPos = find(domI == 1); % index of initial dominant points
    domC = length(domPos); % no of initial dominant points
    
%     domX = contourX(domPos);
%     domY = contourY(domPos);
%     [strength domPos] = getStrength(contourX, contourY, domX, domY);
    i = 1;
    while i <= domC
        %find consecutive dominant points
        j = i + 1;
        conc = 1; % no of consecutive dominant points
        while j <= domC && (domPos(j) == domPos(j-1)+1) % check for end point case
            j = j + 1;
            conc = conc + 1;
        end
        if conc == 1
            i = i + 1;
            continue;
        end
        if conc == 2
            if i == 1 
                domI(domPos(i+1)) = 0;
            elseif i + 1 == domC
                    domI(domPos(i)) = 0;
            else
                l1 = getLength(contourX(domPos(i)), contourY(domPos(i)), contourX(domPos(i-1)), contourY(domPos(i-1)));
                l2 = getLength(contourX(domPos(i+1)), contourY(domPos(i+1)), contourX(domPos(i+2)), contourY(domPos(i+2)));
                %l1 = strength(i);
                %l2 = strength(i+1);
                if l1 > l2
                    domI(domPos(i+1)) = 0;
                else
                    domI(domPos(i)) = 0;
                end
            end
            i = i + 2;
            continue;
        end
        
        if conc > 2
            domI(domPos(i+1 : j-2)) = 0;
            i = j;
        end
    end
    % plot
%     domPos = find(domI == 1);
%     plot(contourX(domPos), contourY(domPos), 'or');
    % pre-supression of dominant points done
    
    % do iterative suppression of dominant points    
    
    % first find the min avg cos angle for each possible dom point
        % do the code??
    
    spanLimit = 0;
    for span = 1 : spanLimit
        while 1 % iterate until no update possible
            domC = length(domPos);
            i = 1;
            while i < domC - span % do for all dominant point
                
                avgAngle = 0;
                segLen = 0;
                for j = i : i+span
                    segX = contourX(domPos(j):domPos(j+1));
                    segY = contourY(domPos(j):domPos(j+1));
                    dom1X = contourX(domPos(j));
                    dom1Y = contourY(domPos(j));
                    dom2X = contourX(domPos(j+1));
                    dom2Y = contourY(domPos(j+1));
                    [aAngle sLen] = calAvgCosineAngle(segX, segY, dom1X, dom1Y, dom2X, dom2Y);
                    avgAngle = avgAngle + aAngle*sLen;
                    segLen = segLen + sLen;
                end
                segX = contourX(domPos(i):domPos(i+span+1));
                segY = contourY(domPos(i):domPos(i+span+1));
                dom1X = contourX(domPos(i));
                dom1Y = contourY(domPos(i));
                dom2X = contourX(domPos(i+span+1));
                dom2Y = contourY(domPos(i+span+1));
                [avgAngle3 segLen3] = calAvgCosineAngle(segX, segY, dom1X, dom1Y, dom2X, dom2Y);
                if avgAngle/segLen >= avgAngle3
                    domI(domPos(i+1: i+span)) = 0;
    %                 plot(contourX(domPos(i)), contourY(domPos(i)), '.r');
                    i = i + span + 1;
                else
                    % check for colinear points
%                     x = contourX(domPos(i+span));
%                     y = contourY(domPos(i+span));
%                     d = distancetoVector(x, y, dom1X, dom1Y, dom2X, dom2Y);
%                     if d <= .7
%                         domI(domPos(i+span)) = 0;
%                         i = i + span + 1;
%                     else
%                        i = i + 1; 
%                     end
                    i = i + 1;
                end
            end
            domPos = find(domI == 1);
            if length(domPos) == domC
                break;
            end
        end
    end    
    domX = contourX(domPos);
    domY = contourY(domPos);
%     plot(domX, domY, 'or-');

    % make some final suppression.......my test

    final = 0;
    if final == 1
        domPos = find(domI == 1); % index of initial dominant points
        domC = length(domPos); % no of initial dominant points

        i = 1;
        while i <= domC
            %find consecutive dominant points
            j = i + 1;
            conc = 1; % no of consecutive dominant points
            while j <= domC && (domPos(j) == domPos(j-1)+1) % check for end point case
                j = j + 1;
                conc = conc + 1;
            end
            if conc == 1
                i = i + 1;
                continue;
            end
            if conc == 2
                if i == 1 
                    domI(domPos(i+1)) = 0;
                elseif i + 1 == domC
                    domI(domPos(i)) = 0;
                else
                    l1 = getLength(contourX(domPos(i)), contourY(domPos(i)), contourX(domPos(i-1)), contourY(domPos(i-1)));
                    l2 = getLength(contourX(domPos(i+1)), contourY(domPos(i+1)), contourX(domPos(i+2)), contourY(domPos(i+2)));
                    if l1 > l2
                        domI(domPos(i+1)) = 0;
                    else
                        domI(domPos(i)) = 0;
                    end
                end
                i = i + 2;
                continue;
            end
            if conc > 2
                i = j;
            end
        end
    end
    domPos = find(domI == 1); % index of initial dominant points    
    domX = contourX(domPos);
    domY = contourY(domPos);
    

    
    function d = distancetoVector(x, y, sx, sy, ex, ey)
        vx = ex - sx;
        vy = ey - sy;
        vtx = -vy;
        vty = vx;
        v = sqrt(double((vx^2 + vy^2)));
        d = double(double(abs(vtx*(x-sx) + vty*(y-sy)))/v);    
    
    function [avgCosAngle segLen] = calAvgCosineAngle(segX, segY, dom1X, dom1Y, dom2X, dom2Y)
        % calculate avg cosine angle between dom1 and dom2
        n = length(segX);
        angle = 0.0;
        for i = 2 : n-1
            x = segX(i);
            y = segY(i);
            angle = angle + (double((x - dom1X)*(x - dom2X) + (y - dom1Y)*(y - dom2Y)))/(sqrt(double((x - dom1X)^2+(y - dom1Y)^2)) * sqrt(double((x - dom2X)^2+(y - dom2Y)^2)));
        end
%         x = segX;
%         y = segY;
%         angle = sum(((x - dom1X)*(x - dom2X) + (y - dom1Y)*(y - dom2Y))/(sqrt(double((x - dom1X)^2+(y - dom1Y)^2)) * sqrt(double((x - dom2X)^2+(y - dom2Y)^2))));
        
        %segLen = getLength(dom1X, dom1Y, dom2X, dom2Y);
        segLen = n-2;
        avgCosAngle = angle / double(segLen);
    
    
    function len = getLength(x1, y1, x2, y2)
        a = (x1-x2)^2 + (y1-y2)^2;
        len = sqrt(double(a));
     
    function [strength domPos] = getStrength(contourX, contourY, domX, domY)
        n = length(contourX);
        nd = length(domX);
        strength = zeros(nd, 1);
        domPos = zeros(nd, 1);
        j = 1;
        i = 1;
        previ = 1;
        while i <= n && j <= nd
            if domX(j)==contourX(i) && domY(j)==contourY(i)
                strength(j) = strength(j) + i - previ;
                domPos(j) = i;
                j = j + 1;
                previ = i;
            end
            i = i + 1;
        end
        strength(1) = strength(1) + n - previ;
        for j = 1 : nd-1
            strength(j) = strength(j) + strength(j+1);
        end
        strength(nd) = strength(nd) + n - previ;