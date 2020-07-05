
%Read all subfolders in table with dicom images
collection6 = dicomCollection(pwd, 'IncludeSubfolders', 1);

V6 = zeros(104, 128, 30, 94);
V8 = zeros(192, 156, 48, 60);

for volIter = 1:height(collection7)
    
    V6(:,:,:,volIter) = squeeze(dicomreadVolume(collection7(volIter, :)));
    
end


im = zeros(104, 128, 30);
[props.Xsize, props.Ysize, props.Zsize, ~] = size(V);

for sliceIter = 1:props.Zsize
        
    for xIter = 1:props.Xsize

        for yIter = 1:props.Ysize

            timeVector = squeeze(V(xIter, yIter, sliceIter, :));
                    
            [M, I] = max(timeVector);
                   
            im(xIter, yIter, sliceIter) = I;
                    
        end
        
    end
    
end