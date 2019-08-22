% create visual ROIS

% URL = 'http://scholar.princeton.edu/sites/default/files/napl/files/probatlas_v4.zip';
unzip(fullfile(pwd, 'inputs', 'probatlas_v4.zip'), fullfile(pwd, 'inputs'));
gunzip(fullfile(pwd, 'inputs', 'ProbAtlas_v4', 'subj_vol_all', 'maxprob_vol_*h.nii.gz'), fullfile(pwd, 'inputs'));


% coding for each area
% 01 , ... V1v	    
% 02 , ... V1d	   
% 03 , ... V2v	   
% 04 , ... V2d	   
% 05 , ... V3v	    
% 06 , ... V3d	    
% 07 , ... hV4	  
% 08 , ... VO1	    
% 09 , ... VO2	    
% 10 , ... PHC1	    
% 11 , ... PHC2	    
% 12 , ... MST	    
% 13 , ... hMT	   
% 14 , ... LO2	    
% 15 , ... LO1	   
% 16 , ... V3b	    
% 17 , ... V3a	  
% 18 , ... IPS0	   
% 19 , ... IPS1	    
% 20 , ... IPS2	    
% 21 , ... IPS3	  
% 22 , ... IPS4	  
% 23 , ... IPS5	  
% 24 , ... SPL1	 
% 25 , ... FEF

ROI_2_select = [
    01 , ... V1v
    02 , ... V1d
    03 , ... V2v
    04 , ... V2d
    05 , ... V3v
    06 , ... V3d
    07 , ... hV4
    08 , ... VO1
    09 , ... VO2
    10 , ... PHC1
    11 , ... PHC2
    12 , ... MST
    13 , ... hMT
    14 , ... LO2
    15 , ... LO1
    16 , ... V3b
    17 , ... V3a
];


files =  spm_select('FPList', fullfile(pwd, 'inputs'), '^maxprob_vol_.*h.nii$');
hdr = spm_vol(files);
vol = spm_read_vols(hdr);
vol = sum(vol,4);

all_rois = zeros(size(vol));

for i = 1:numel(ROI_2_select)
    all_rois(vol==ROI_2_select(i)) = 1;
end

hdr = hdr(1);
hdr.fname = fullfile(pwd, 'inputs', 'all_visual_ROIS.nii');
spm_write_vol(hdr, all_rois);

