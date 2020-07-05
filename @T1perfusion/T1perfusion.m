classdef T1perfusion < handle
    
    
    properties
        vol
        volOnlyLung
        volOrig
        maskPulm
        ttp
        ttpOrig
        pbv
        pbvOrig
        ROI
        handles
        props
        stats
    end
    
    
    methods
        
        function perfObj = T1perfusion(varargin)
            
            stats = struct();
                        
            switch nargin
                case 0
                    perfObj.vol = perfObj.perfObj_readDicomDir();
                    [perfObj.props.size.xDim, perfObj.props.size.yDim, perfObj.props.size.zDim, ...
                    perfObj.props.size.timeDim] = size(perfObj.vol);
                
                    [perfObj.props.size.xDim, perfObj.props.size.yDim, perfObj.props.size.zDim, ...
                    perfObj.props.size.timeDim] = size(perfObj.vol);
                    
                    perfObj.ttp = perfObj.perfObj_T1ttpCalc(perfObj.vol);
                    perfObj.pbv = perfObj.perfObj_T1BloodVolumeCalc(perfObj.vol);
                case 1
                    perfObj.vol = varargin{1};
                    perfObj.volOrig = varargin{1};
                    
                    [perfObj.props.size.xDim, perfObj.props.size.yDim, perfObj.props.size.zDim, ...
                    perfObj.props.size.timeDim] = size(perfObj.vol);
                    
                    perfObj.ttp = perfObj.perfObj_T1ttpCalc(perfObj.vol);
                    perfObj.pbv = perfObj.perfObj_T1BloodVolumeCalc(perfObj.vol);
                    
                case 2
                    perfObj.volOrig = varargin{1};
                    perfObj.maskPulm = logical(varargin{2});
                    perfObj.vol = perfObj.perfObj_ApplyMask ...
                        (perfObj.volOrig, perfObj.maskPulm);
                    
                    [perfObj.props.size.xDim, perfObj.props.size.yDim, perfObj.props.size.zDim, ...
                    perfObj.props.size.timeDim] = size(perfObj.vol);
                    
                    perfObj.ttp = perfObj.perfObj_T1ttpCalc(perfObj.vol);
                    perfObj.ttpOrig = perfObj.perfObj_T1ttpCalc(perfObj.volOrig);
                    perfObj.pbvOrig = perfObj.perfObj_T1BloodVolumeCalc(perfObj.volOrig);
                    
                    stats.totalLungVol = perfObj.perfObj_totalVolCalc(perfObj.ttp);
                    [stats.functionalRatio, stats.lungVolWithoutVessel] ...
                        = perfObj.perfObj_ttpVolCalc(perfObj.ttp);
                    
            end
            
            perfObj.stats = stats;
            
        end
    
        %Functions in separate files
        %Read a DICOM volume from a folder
        vol = perfObj_readDicomDir(perfObj, vol);
        %Calculate TTP maps
        ttpMap = perfObj_T1ttpCalc(perfObj, vol);
        %Calculate PBV maps
        pbv = perfObj_T1BloodVolumeCalc(perfObj, vol);
        %Apply a mask to orig
        vol = perfObj_ApplyMask(perfObj, vol, mask);
        %Calculate total volume segmented in mask
        totalVol = perfObj_totalVolCalc(perfObj, ttp);
        %Calculate perfused fraction, need to input high and low values,
        %also calculates lungvolume without pulmonary arteries
        [functionalRatio, lungVolWithoutVessel] = perfObj_ttpVolCalc(perfObj, ttp);
        perObj_EchoStats(perfObj);
        
        %Internal functions
        function stats = getStats(perfObj)

            stats = perfObj.stats;
    
        end
        
        function stats = calcNewTTP(perfObj)
            
            [perfObj.stats.functionalRatio, perfObj.stats.lungVolWithoutVessel] ...
                        = perfObj.perfObj_ttpVolCalc(perfObj.ttp);
            stats = perfObj.getStats;
            
        end
        
        
    end
    
end