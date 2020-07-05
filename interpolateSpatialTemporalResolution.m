%Interpolation of ang 006-007 to match 4D scan parameters used from 008 and
%onwards

%Resolution of 006, 007 : 128x104x30x94

%Resolution of 008 -    : 156x192x48x60

156/128 + 192/104 + 48/30 + 60/94

J = zeros(156, 192, 30, 94);

%In plane resolution, bicubic
for timeIter = 1:94
    for slabIter = 1:30
        J(:, :, slabIter, timeIter) = imresize(V6(:, :, slabIter, timeIter), [156,192], 'method', 'bicubic');
    end
end

K = zeros(156, 192, 48, 94);

for timeIter = 1:94
    for xIter = 1:156
        for yIter = 1:192
            
            K(xIter, yIter, :, timeIter) = interp1(J(xIter, yIter, :, timeIter),  'method', 'bicubic');
    end
end