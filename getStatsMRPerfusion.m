%Get descriptive stats and test MR perfusion

format compact

%Extract data from objects and create tabel
t = table;
t = appendStatsTable(t, 006, 0, (3.125*3.125*5), v6.getStats);
t = appendStatsTable(t, 007, 0, (3.125*3.125*5), v7.getStats);
t = appendStatsTable(t, 008, 0, (2.08*2.08*3), v8.getStats);
t = appendStatsTable(t, 009, 1, (2.08*2.08*3), v9.getStats);
t = appendStatsTable(t, 010, 1, (2.08*2.08*3), v10.getStats);
t = appendStatsTable(t, 011, 1, (2.08*2.08*3), v11.getStats);

%Get descriptive data
unTreatedBlockLowDose = t.FunctionalFraction(t.treatmentStatus == 0);
treatedBlockLowDose = t.FunctionalFraction(t.treatmentStatus == 1);

fprintf('\n \nDESCRIPTIVE STATISTICS: \n \n');
fprintf(['Mean Functionally perfused Lung of Untreated:     ' num2str(mean(unTreatedBlockLowDose)) '\n']);
fprintf(['STD Functionally perfused Lung of Untreated:      ' num2str(std(unTreatedBlockLowDose)) '\n']);
fprintf(['Mean Functionally perfused Lung of Treated:       ' num2str(mean(treatedBlockLowDose)) '\n']);
fprintf(['STD Functionally perfused Lung of Treated:        ' num2str(std(treatedBlockLowDose)) '\n']);

%Test Null Hypothesis (t-test, 2-sided)
[h, p, ci, stats] = ttest2(unTreatedBlockLowDose, treatedBlockLowDose, 'Tail', 'Both');

fprintf('Results of T-test, two sided, equal distribution: \n');
fprintf(['p= ' num2str(p) '\n']);
fprintf(['CI (.95) = ' num2str(ci(1)) ' ' num2str(ci(2)) '\n']);
stats



%Internal functions
function t = appendStatsTable(t, ID, treatmentStatus, voxelSize, stats)
    
    s.ID = ID;
    s.treatmentStatus = treatmentStatus;
    
    s.TotalLungVolume = stats.totalLungVol * voxelSize;
    s.LungVolumeWithoutArteries = stats.lungVolWithoutVessel * voxelSize;
    s.FunctionalFraction = stats.functionalRatio;
    
    t = [t; struct2table(s)];
    
end
    
