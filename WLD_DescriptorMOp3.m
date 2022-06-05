%--------------------------------------------------------------------------
%     Calculate WLD using 
%     By: Dr.M.Hussain
%     Date: April 23, 2011
%==========================================================================
% function WLDHist = WLD_Descriptor(Im, T, M, S, P, R)
% INPUT:
%       Im: original image in gray scale
%       T : Number of orientations
%       M : The number of segments to which each sub-histogram is divided
%       S : The number of bins in each segment
%       P : The number points in the neighbourhod
%       R : The radious of the neighbourhood
%
% OUTPUT:
%       WLDHist: WLD Histogram
%
% ALGORITHM:
% Step-1: Compute differential excitation and gradient orientation
% Step-2: Compute subhistograms H(t), t = 1, 1, 2, ..., T
% Step-3: Divide each subhistogram into into M segments H(m, t)
% Step-4: Compute H(m)= [H(m, 1) H(m, 2) H(m, 3) ... H(m, T)], m = 1, 2,..., M
% Step-5: Compute H = {H(m)}, m = 1, 2,..., M
%--------------------------------------------------------------------------
function WLDHist = WLD_DescriptorMOp3(Im, T, M, S, P, R)
PIR = 3.141592653589;
PI = 180;
%% Step-1
[DE, GO] = ComputeDE_GO_M(Im, P, R);
% [HistDE, xout] = hist(DE(:), 256);
% plot(xout, HistDE);
% ----------------------------------------------------------------
% Step-2: Compute sub-histograms H(t)
% ----------------------------------------------------------------
t = 1:T; t = t-1;
phi_t = (360/T)*t;
HT = cell(T,1);
for i = 1:T;
    low = phi_t(i) - (180/T);
    hi  = phi_t(i) + (180/T);
    if(low < 0)
        low = low +360; 
        C   = find((GO(:) >= low & GO(:) <= 360) | (GO(:) >= 0 & GO(:) < hi));
    else
        C   = find(GO(:) >= low & GO(:) < hi);
    end;
    DEC = DE(:);
    HT{i} = DEC(C);
end
% ----------------------------------------------------------------
%Step-3~5: Compute subhistograms H(m), m = 0,1,...,M-1
% ----------------------------------------------------------------
H_MT = cell(M, T);
m = 1:M; m = m-1;
ll= ((m/M)-0.5)*PIR;
lu= (((m+1)/M)-0.5)*PIR;
WLD_H =[];
for i =1:M;
    for j = 1:T;
        H_MT = ComputeSegmentHistOp3(HT{j}, ll(i), lu(i), S);
        WLD_H = [WLD_H H_MT];
    end;
end;
clear HT;
WLDHist = WLD_H;