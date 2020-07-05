function ttpVol = perfObj_T1ttpCalc(perfObj, vol)

    %Preallocate memory
    ttpVol = zeros(size(vol, 3));
    
    %Create waitbar
    f = waitbar(0, 'Calculating TTP maps');
    yRange = perfObj.props.size.yDim;
    
    for sliceIter = 1:perfObj.props.size.zDim

        %Update waitbar
        waitbar((sliceIter / perfObj.props.size.zDim), f);
        
        for xIter = 1:perfObj.props.size.xDim
            for yIter = 1:yRange
                
                timeVector1 = squeeze(vol(xIter, yIter, sliceIter, :));
                
                [M, I] = max(timeVector1);
                
                ttpVol(xIter, yIter, sliceIter) = I;
                
            end
        end
    end
    
    %Close the waitbar
    close(f);

end