function maskedVol = perfObj_ApplyMask(perfObj, vol, mask)

    maskedVol = vol;
    mask4D = zeros(size(vol));
    for timeIter = 1:size(vol, 4)
        mask4D(:,:,:, timeIter) = mask;
    end

    maskedVol(~mask4D) = NaN;
    
end