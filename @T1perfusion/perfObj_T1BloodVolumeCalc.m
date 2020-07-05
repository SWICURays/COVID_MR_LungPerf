function pbvVol = perfObj_T1BloodVolumeCalc(perfObj, vol)


 pbvVol = zeros(perfObj.props.size.xDim, perfObj.props.size.yDim, perfObj.props.size.zDim);

    %Create waitbar
    f = waitbar(0, 'Calculating PBV maps');

    for sliceIter = 1:perfObj.props.size.zDim
        
        %Update waitbar
        waitbar((sliceIter / perfObj.props.size.zDim), f);
        
        for xIter = 1:perfObj.props.size.xDim
            for yIter = 1:perfObj.props.size.yDim

                timeVector = squeeze(vol(xIter, yIter, sliceIter, :));
                zeroBaseLine = timeVector / mean(timeVector(1:2));
                I = sum(zeroBaseLine);
                
                pbvVol(xIter, yIter, sliceIter) = I;
                    
            end
        end
    end
    
    %Close waitbar
    close(f);

end