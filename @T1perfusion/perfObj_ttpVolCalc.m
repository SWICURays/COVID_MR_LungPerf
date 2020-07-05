function [fraction, lungWithoutVessel] = perfObj_ttpVolCalc(perfObj, ttpMap)

    low = input('Input low cutoff for TTP \n');
    high = input('Input high cutoff for TTP \n');

    i = ttpMap == 1;
    ttpMap(i) = NaN;

    i = ttpMap <= low;
    ttpMap(i) = NaN;

    lungWithoutVessel = sum(sum(sum(~isnan(ttpMap))));
    
    i = ttpMap >= high;
    ttpMap(i) = NaN;

    subVol = sum(sum(sum(~isnan(ttpMap))));

    fraction = subVol/lungWithoutVessel;

end