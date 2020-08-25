function [data_dir, code_dir, output_dir, fMRIprep_DIR] = set_dir(machine_id)
    % Returns directory to work with depending on which computer/container we
    % are on

    if nargin < 1
        machine_id = 2;
    end

    switch machine_id
        case 0 % container
            % containers
            data_dir = '/data';
            output_dir = '/output/derivatives/spm12';
            addpath(fullfile('/opt/spm12'));
        case 1 % Remi
            data_dir = '/home/remi/gin/olfaction_blind';
            output_dir = fullfile(data_dir, 'derivatives', 'spm12');
        case 2 % beast
            data_dir = '/mnt/data/christine/olf_blind/';
            output_dir = fullfile(data_dir, 'derivatives', 'spm12');
            addpath(fullfile('/home/remi-gau/Documents/SPM/spm12'));
    end

    code_dir = fileparts(mfilename('fullpath'));

    % add subfunctions to path
    [~]  = addpath(genpath(fullfile(code_dir, 'subfun')));
    [~]  = addpath(genpath(fullfile(code_dir, 'lib')));

    % define derivatives fMRIprep dir
    fMRIprep_DIR = fullfile(data_dir, 'derivatives', 'fmriprep');

    spm('defaults', 'fmri');
end
