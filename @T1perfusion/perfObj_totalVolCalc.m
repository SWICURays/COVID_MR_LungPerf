function total = perfObj_totalVolCalc(perfObj, ttp)

    totalVol = ttp;
    i = totalVol == 1;
    totalVol(i) = NaN;
    total = sum(sum(sum(~isnan(totalVol))));

end