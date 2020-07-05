function vol = perfObj_readDicomDir(perfObj)

    %Get directory
    dir = uigetdir();

    %Index files
    collection = dicomCollection(dir, 'IncludeSubfolders', 1);
    collection = sortrows(collection, 'SeriesDateTime');
    
    %Get first file and allocate volume
    im1 = dicomread(collection.Filenames{1}(1));
    [xDim, yDim] = size(im1);
    zDim = length(collection.Filenames{1});
    timeDim = height(collection);
    vol = zeros(xDim, yDim, zDim, timeDim);

    %Read the volume
    
    f = waitbar(0, 'Reading the DICOM 4D vol from disk');
    
    for volIter = 1:height(collection)
        
        %Read the volume
        vol(:,:,:,volIter) = squeeze(dicomreadVolume(collection(volIter, :)));
        
        %Update the waitbar
        waitbar((volIter /height(collection)), f);

    end
    
    %Close waitbar
    close(f);
    
    
    %Rotate if cor, phaseencode R -> L (a reasonable choice)
    vol = imrotate(vol, 270);

end