%% s_fs_aparcAsegLabelToNiftiRoi1021
%
%This function will take a freesurfer segmentation file (fsIn =
% aparc+aseg.nii) and convert specific lables within it to a nifti roi.
%
% labelVal + '1021' means 'ctx-lh-pericalcarine'                120 100 60  0
%            '2021' means 'ctx-rh-pericalcarine'                120 100 60  0
%
% SEE: http://surfer.nmr.mgh.harvard.edu/fswiki/FsTutorial/AnatomicalROI/FreeSurferColorLUT

%% Set the fullpath to data directory
basedir = '/biac4/wandell/biac2/wandell/data/DWI-Tamagawa-Japan';
fsdir = fullfile(basedir,'freesurfer');



% navigate to direcotry containing new T1s
subDir = {...
    'JMD1-MM-20121025-DWI'
    'JMD2-KK-20121025-DWI'
    'JMD3-AK-20121026-DWI'
    'JMD4-AM-20121026-DWI'
    'JMD5-KK-20121220-DWI'
    'JMD6-NO-20121220-DWI'
    'JMD7-YN-20130621-DWI'
    'JMD8-HT-20130621-DWI'
    'JMD9-TY-20130621-DWI'
    'LHON1-TK-20121130-DWI'
    'LHON2-SO-20121130-DWI'
    'LHON3-TO-20121130-DWI'
    'LHON4-GK-20121130-DWI'
    'LHON5-HS-20121220-DWI'
    'LHON6-SS-20121221-DWI'
    'JMD-Ctl-MT-20121025-DWI'
    'JMD-Ctl-SY-20130222DWI'
    'JMD-Ctl-YM-20121025-DWI'
    'JMD-Ctl-HH-20120907DWI'
    'JMD-Ctl-HT-20120907-DWI'
     'JMD-Ctl-FN-20130621-DWI'};

% loop for each subject
for subinds = 21%:length(subDir);
% cd(fullfile(fsdir, subDir{subinds}, 'mri'))
% 
% t1Anatfile = fullfile('/biac4/wandell/biac2/wandell/data/DWI-Tamagawa-Japan', ...
%                         subDir{subinds},'t1.nii.gz');
% outfile    = fullfile('/biac4/wandell/biac2/wandell/data/DWI-Tamagawa-Japan', ...
%                         'freesurfer',subDir{subinds},'mri','aparc+aseg.nii.gz');
% fsIn = fs_mgzSegToNifti('aparc+aseg.mgz', t1Anatfile, outfile);
fsIn =fullfile(fsdir, subDir{subinds}, 'mri','aseg.nii.gz');

%% Run fs_aparcAsegLabelToNiftiRoi
     
        labelVal = {'42','3'};

        
         outfileName = {'Right-Cerebral-Cortex','Left-Cerebral-Cortex'};


%loop for every file
    
    for ii = 1:length(outfileName);
        
        % save nifti ROI in mri directory
        savefile =fullfile(fsdir,subDir{subinds},'mri',outfileName{ii});
        fs_aparcAsegLabelToNiftiRoi(fsIn,labelVal{ii},savefile)
        
        % Save 'mat' ROI in ROIs directory
        % Set parameters
        nifti       =  sprintf('%s.nii.gz',savefile);
        maskValue   =  0;       % All nonZero values are used for the mask
        outName     = sprintf('%s.mat',outfileName{ii});
        outFile     = fullfile(basedir,subDir{subinds},'dwi_2nd','ROIs',outName);
        outType     = 'mat';  binary = true; save = true;
        
        % run main
        dtiRoiFromNifti(nifti,maskValue,outFile,outType,binary,save);

           
    end
end
