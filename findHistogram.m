function totalCounts = findHistogram(pbv, lowCut, highCut)

    %Use for inplane 008, 009
%     lowCut = 100;
%     highCut = 250;
% 
%     lowCut = 150;
%     highCut = 350;
% 
%     lowCut = 125;
%     highCut = 400;
    
    pbvCutoff = pbv;
    iLow = pbvCutoff < lowCut;
    iHigh = pbvCutoff > highCut;
    
    pbvCutoff(iLow) = NaN;
    pbvCutoff(iHigh) = NaN;
    
    totalCounts = sum(histcounts(pbvCutoff));
    
    figure; hold on;
    histogram(pbvCutoff, (highCut - lowCut));
    title('Histogram of Pulmonary Blood Volume');
    xlabel('Bins, 100 - 250');
    ylabel('Counts');
    set(gca,'FontSize',20);
    title('Histogram of PBV');
    set(gcf,'Position',[-1800 400 1000 800])
    
end
    
    

