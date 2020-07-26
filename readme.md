COVID_MR_LungPerf

Code provided under GNU GPLv3 for T1perfusion.

Imtool3D is forked from Tanguy Duval and originally from Justin Solomon. See separate LICENSE.

This is code used in Rysz et al. for generating T1 weighted perfusion Time-To-Peak analysis.

Link to preprint:
10.21203/rs.3.rs-32494/v2

SYSTEM REQUIREMENTS
The code is tested on macOS (10.14.6) and MATLAB (R2019b). Sufficient RAM to hold the 4D exam for analysis is required (and some to spare).

INSTALLATION
Copy the github repository and launch MATLAB.

INSTRUCTIONS
Load a T1perfusion class object. If not input it will offer the choice of a folder to read a 4D volume. The object will read all DICOM files in that folder in the DICOM metadata timestamp. As such, use only on folder per 4D volume. It has been tested with 4D volumes from Siemens and Philips.

If the 4D volume is already loaded in the workspace it can be loaded into the object as an argument. The second argument is a binary mask for the lungs.

The functions used in the manuscript are:

perfObj_readDicomDir    -> Read a 4D volume
perfObj_T1ttpCalc       -> Calculate TTP maps (using MATLAB max)
perfObj_ApplyMask       -> Apply a mask to a original 4D volume
perfObj_ttpVolCalc      -> Calculate perfused fraction, need to provide high and low values.
