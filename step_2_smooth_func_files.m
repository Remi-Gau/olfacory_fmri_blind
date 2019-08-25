% script to smooth the functional fmriprep preprocessed data


% TO DO
% adapt to copy only some subjects



% example of docker command to run it
% docker run -it --rm \
% -v /c/Users/Remi/Documents/NARPS/:/data \
% -v /c/Users/Remi/Documents/NARPS/code/:/code/ \
% -v /c/Users/Remi/Documents/NARPS/derivatives/:/output \
% spmcentral/spm:octave-latest script '/code/step_2_smooth_func_files.m'

clear
clc

machine_id = 1;% 0: container ;  1: Remi ;  2: Beast
FWHM = 6;
prefix = 's-6_';

% filter =  'sub-.*space-MNI152NLin2009cAsym_desc-preproc'; % to smooth only the preprocessed files

filter =  'sub-.*space-T1w_desc-preproc'; % for the files in native space

% setting up directories
[data_dir, code_dir, output_dir, fMRIprep_DIR] = set_dir(machine_id);

% smooth
smooth_batch(FWHM, prefix, output_dir, filter)
