%--------------------------------------------------------------------------
%     Calculate Segment of a Subhistogram
%     By: Dr.M.Hussain
%     Date: April 23, 2011
%==========================================================================
%function H = ComputeSegmentHist(HT, ll, lu, S);
% INPUT:
%       HT: subhistogrm corresponding to Phi_t
%       ll: lower bound of the segment
%       lu: upper bound of the segment
%       S : number of bins
% OUTPUT:
%      Segment of the histogram
%--------------------------------------------------------------------------
function H = ComputeSegmentHistOp3(HT, ll, lu, S)
% H = zeros(1,S);
% num = S*(HT-ll);
% den = (lu-ll);
% SJ  = floor((num/den)+0.5);
% for i = 1:S;
%     j = i - 1;
%     [r, c, v] = find(SJ == j);
%     H(i) = sum(v);
% end;
ind = find(HT > ll & HT <= lu);
HT  = HT(ind);
H   = hist(HT, S);
