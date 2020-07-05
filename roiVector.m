function [sic, stdSic] = roiVector(vol, roi, slice)

timePoints = size(vol, 4);

vol = double(vol);

maskedVol = vol(:,:,slice,:) .* roi.mask;
maskedVol = squeeze(maskedVol);
 
sic = zeros(timePoints, 1);
stdSic = zeros(timePoints, 1);
 
 for timeIter = 1:timePoints
     
     sic(timeIter) = mean(mean(nonzeros(maskedVol(:, :, timeIter))));
     stdSic(timeIter) = std(nonzeros(maskedVol(:, :, timeIter)));
     
 end
 
end
