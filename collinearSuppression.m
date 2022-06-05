function [domX domY optimumThr] = collinearSuppression(contourX, contourY, ...
                        domX, domY, maxThr, isMinimizeError, isCCS, mode)
    if isempty(mode)
        mode = 1;
    end
    domXtmp = domX;
    domYtmp = domY;
    threshold = .5 : .5 : maxThr;
    errorMin = 9999;
    optimumThr = 0;
    dcol = 0;
    for i = 1 : length(threshold)
        dcol = threshold(i);
        [domXtmp domYtmp] = applyCollinearSuppression(contourX, contourY, domXtmp, domYtmp, dcol, mode, isCCS);
        if isMinimizeError == 1
            [CR E WE WE2 WE3 LengthRatio] = getPolApproxMeasures(contourX, contourY, domXtmp, domYtmp);
            if WE3 < errorMin
                errorMin = WE3;
                optimumThr = dcol;
                domX = domXtmp;
                domY = domYtmp;
            end
        end
    end
    if isMinimizeError == 0
        domX = domXtmp;
        domY = domYtmp;
        optimumThr = dcol;
    end