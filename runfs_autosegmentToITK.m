function runfs_autosegmentToITK
%
% runfs_autosegmentToITK
%
% Autosegment a t1 weighted anatomical scan named as 't1.nii.gz'using freesurfer
% autosegmentation
%
%
%%
% change directory to a subject you want to make segmantation file using freesurfer

%% Set directory
[~,subDir] = fileparts(pwd);
% subDir  = 'Ctl8214-RL';
% fsDir   =  getenv('SUBJECTS_DIR');
t1 = fullfile(pwd,'t1.nii.gz');

%% autosegmentation with freesurfer
fs_autosegmentToITK(subDir, t1)