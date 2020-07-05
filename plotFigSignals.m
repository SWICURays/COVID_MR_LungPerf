

figure; hold on;
set(gcf,'Position',[-1800 400 1000 800])
errorbar(x1, sicPA, stdPA, 'b', 'lineWidth', 3)
errorbar(x1, sicAorta, stdAorta, 'r', 'lineWidth', 3)
errorbar(x1, sicHilus, stdHilus, 'y', 'lineWidth', 3)
errorbar(x1, sicAnt, stdAnt, 'g', 'lineWidth', 3)
title('Signal Intensity Curves, MRI lung perfusion')
legend('Pulmonary Artery Time Signal', 'Aortic Signal', 'Ventilated Lung, Hilar signal', 'Ventilated Lung, Periphery');
set(gca,'FontSize',20)
figure; hold on;
errorbar(x1, sicHilus, stdHilus, 'y', 'lineWidth', 3)
errorbar(x1, sicAnt, stdAnt, 'g', 'lineWidth', 3)
legend('Ventilated Lung, Hilar signal', 'Ventilated Lung, Periphery');
set(gca,'FontSize',20)




%Plot Fig swine lung progressivly more lateral, treated

figure; hold on;
set(gcf,'Position',[-1800 400 1000 800])
errorbar(x1Clean, Sicv_008_003_clean, Stdv_008_003_clean, 'r', 'lineWidth', 3);
errorbar(x1Clean, Sicv_008_004_clean, Stdv_008_004_clean, 'b', 'lineWidth', 3);
errorbar(x1Clean, Sicv_008_005_clean, Stdv_008_005_clean, 'g', 'lineWidth', 3);
title('Signal Intensity Curves, MRI lung perfusion, Treated Animal');
legend('ROI start perfusion defect', 'ROI mid perfusion defect', 'ROI lateral perfusion defect');
xlabel('Time');
ylabel('Absolute Signal Intensity');
set(gca,'FontSize',20);


%Plot Fig swine lung progressivly more lateral, Untreated

figure; hold on;
set(gcf,'Position',[-1800 400 1000 800])
errorbar(x1Clean, Sicv_009_003_clean, Stdv_009_003_clean, 'r', 'lineWidth', 3);
errorbar(x1Clean, Sicv_009_004_clean, Stdv_009_004_clean, 'b', 'lineWidth', 3);
errorbar(x1Clean, Sicv_009_005_clean, Stdv_009_005_clean, 'g', 'lineWidth', 3);
title('Signal Intensity Curves, MRI lung perfusion, Treated Animal');
legend('ROI start perfusion defect', 'ROI mid perfusion defect', 'ROI lateral perfusion defect');
xlabel('Time');
ylabel('Absolute Signal Intensity');
set(gca,'FontSize',20);



%Get values for Swine008
[sic8A, std8A] = roiVector(v8.volOrig, A008_A_ROI_slice37, 37);
[sic8PA, std8PA] = roiVector(v8.volOrig, A008_PA_ROI_slice19, 19);
[sic8Perifer, std8Perifer] = roiVector(v8.volOrig, A008_ROI_Perfier_slice39, 39);
[sic8Hilus, std8Hilus] = roiVector(v8.volOrig, A008_ROI_Hilus_slice39, 39);

sic8Perifer = (sic8Perifer ./ mean(sic8Perifer(1:2))) -1;
sic8Hilus = (sic8Hilus ./ mean(sic8Hilus(1:2))) -1;

scaleFactor = max(sic8Hilus);

sic8Perifer = ((sic8Perifer / scaleFactor * 100));
sic8Hilus = ((sic8Hilus / scaleFactor * 100));

%Get Values for Swine010
[sic10A, std10A] = roiVector(v10.volOrig, A010_A_ROI_slice35, 35);
[sic10PA, std10PA] = roiVector(v10.volOrig, A010_PA_ROI_slice20, 20);
[sic10Perifer, std10Perifer] = roiVector(v10.volOrig, A010_ROI_Perifer_slice34, 34);
[sic10Hilus, std10Hilus] = roiVector(v10.volOrig, A010_ROI_Hilus_slice34, 34);

sic10Perifer = (sic10Perifer ./ mean(sic10Perifer(1:2))) -1;
sic10Hilus = (sic10Hilus ./ mean(sic10Hilus(1:2))) -1;

scaleFactor = max(sic10Perifer);

sic10Perifer = ((sic10Perifer / scaleFactor * 100));
sic10Hilus = ((sic10Hilus / scaleFactor * 100));


%Get Values for Patient001

[sicP1PA, stdP1PA] = roiVector(double(vPat.volOrig), P001_PA_ROI_slice13, 13);
[sicP1A, stdP1A] = roiVector(double(vPat.volOrig), P001_A_ROI_slice30, 30);
[sicP1Perifer, stdP1Perifer] = roiVector(double(vPat.volOrig), P001_ROI_Perifer_slice39, 39);
[sicP1Hilus, stdP1Hilus] = roiVector(double(vPat.volOrig), P001_ROI_Hilus_slice39, 39);

sicP1Perifer = (sicP1Perifer ./ mean(sicP1Perifer(1:2))) -1;
sicP1Hilus = (sicP1Hilus ./ mean(sicP1Hilus(1:2))) -1;

scaleFactor = max(sicP1Perifer);

sicP1Perifer = ((sicP1Perifer / scaleFactor * 100));
sicP1Hilus = ((sicP1Hilus / scaleFactor * 100));

%Plot fig swine008, ROI
figure; hold on;
set(gcf,'Position',[-1800 400 1000 1000])

pa = [-20:110]; pa1 = ones(1,131)*15; 
a = [-20:110]; a1 = ones(1,131)*20;

plot(pa1, pa, 'b', 'lineWidth', 3);
plot(a1, a, 'r', 'lineWidth', 3);
plot(timeVectorSwine(1:35), sic8Hilus(1:35), 'lineWidth', 3)
plot(timeVectorSwine(1:35), sic8Perifer(1:35), 'lineWidth', 3)
title('Unreated Individual, Signal Intensity Curves, MRI lung perfusion')

legend('Pulmonary artery peak', 'Aortic peak', 'Ventilated Lung, Hilar signal', 'Ventilated Lung, Periphery');
xlabel('Time (s)');
ylabel('Relative MRI signal intensity difference');
ylim([-20 110]);
set(gca,'FontSize',20);

%Plot fig swine010, ROI
figure; hold on;
set(gcf,'Position',[-1800 400 1000 1000])

pa = [-20:110]; pa1 = ones(1,131)*15; 
a = [-20:110]; a1 = ones(1,131)*20;

title('Treated Individual, Signal Intensity Curves, MRI lung perfusion')
plot(pa1, pa, 'b', 'lineWidth', 3);
plot(a1, a, 'r', 'lineWidth', 3);
plot(timeVectorSwine(1:35), sic10Hilus(1:35), 'lineWidth', 3)
plot(timeVectorSwine(1:35), sic10Perifer(1:35), 'lineWidth', 3)

legend('Pulmonary artery peak', 'Aortic peak', 'Ventilated lung, Hilar signal', 'Ventilated lung, periphery');
xlabel('Time (s)');
ylabel('Relative MRI signal intensity difference');
ylim([-20 110]);
set(gca,'FontSize',20);



%Plot fig Pat001 ROI
figure; hold on;
set(gcf,'Position',[-1800 400 1000 1000])

pa = [-20:110]; pa1 = ones(1,131)*timeVectorPatient(6); 
a = [-20:110]; a1 = ones(1,131)*timeVectorPatient(8);

title('Patient, Signal Intensity Curves, MRI lung perfusion')
plot(pa1, pa, 'b', 'lineWidth', 3);
plot(a1, a, 'r', 'lineWidth', 3);
plot(timeVectorPatient, sicP1Hilus, 'lineWidth', 3)
plot(timeVectorPatient, sicP1Perifer, 'lineWidth', 3)

legend('Pulmonary artery peak', 'Aortic peak', 'Ventilated lung, Hilar signal', 'Ventilated lung, periphery');
xlabel('Time (s)');
ylabel('Relative MRI signal intensity difference');
ylim([-20 110]);
set(gca,'FontSize',20);



%LEGACY

%Plot fig swine008, ROI
figure; hold on;
set(gcf,'Position',[-1800 400 1000 800])
% errorbar(timeVectorSwine, sic8PA, std8PA, 'b', 'lineWidth', 3)
% errorbar(timeVectorSwine, sic8A, std8PA, 'r', 'lineWidth', 3)
% errorbar(timeVectorSwine, sic8Hilus, std8Hilus, 'lineWidth', 3)
% errorbar(timeVectorSwine, sic8Perifer, std8Perifer, 'lineWidth', 3)

plot(timeVectorSwine, sic8Hilus, 'lineWidth', 3)
plot(timeVectorSwine, sic8Perifer, 'lineWidth', 3)
title('Unreated Individual, Signal Intensity Curves, MRI lung perfusion')
%legend('Pulmonary Artery Time Signal', 'Aortic Signal', 'Ventilated Lung, Hilar signal', 'Ventilated Lung, Periphery');
legend('Ventilated Lung, Hilar signal', 'Ventilated Lung, Periphery');
xlabel('Time (s)');
ylabel('Absolute MRI Signal Intensity');
set(gca,'FontSize',20);

%Plot fig swine010, ROI
figure; hold on;
set(gcf,'Position',[-1800 400 1000 800])
% errorbar(timeVectorSwine, sic10PA, std10PA, 'b', 'lineWidth', 3)
% errorbar(timeVectorSwine, sic10A, std10PA, 'r', 'lineWidth', 3)
% errorbar(timeVectorSwine, sic10Hilus, std10Hilus, 'lineWidth', 3)
% errorbar(timeVectorSwine, sic10Perifer, std10Perifer, 'lineWidth', 3)

pa = [0:40]; pa1 = ones(1,41)*16; 
a = [0:40]; a1 = ones(1,41)*22;

title('Treated Individual, Signal Intensity Curves, MRI lung perfusion')
plot(pa1, pa, 'b', 'lineWidth', 3);
plot(a1, a, 'r', 'lineWidth', 3);
plot(timeVectorSwine, sic10Hilus, 'lineWidth', 3)
plot(timeVectorSwine, sic10Perifer, 'lineWidth', 3)

%legend('Pulmonary Artery Time Signal', 'Aortic Signal', 'Ventilated Lung, Hilar signal', 'Ventilated Lung, Periphery');
legend('Pulmonary Peak', 'Ventilated Lung, Hilar signal', 'Ventilated Lung, Periphery');

xlabel('Time (s)');
ylabel('Absolute MRI Signal Intensity');
set(gca,'FontSize',20);