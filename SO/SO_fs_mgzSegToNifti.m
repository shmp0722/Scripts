%% SO_fs_mgzSegToNifti.m
% Set directory
homeDir = '/biac4/wandell/biac2/wandell/data/DWI-Tamagawa-Japan';

% subs in colum
subJ = {...
    'JMD1-MM-20121025-DWI'...
    'JMD2-KK-20121025-DWI'...
    'JMD3-AK-20121026-DWI'...
    'JMD4-AM-20121026-DWI'...
    'JMD5-KK-20121220-DWI'...
    'JMD6-NO-20121220-DWI'...
    'JMD7-YN-20130621-DWI'...
    'JMD8-HT-20130621-DWI'...
    'JMD9-TY-20130621-DWI'...
    'LHON1-TK-20121130-DWI'...
    'LHON2-SO-20121130-DWI'...
    'LHON3-TO-20121130-DWI'...
    'LHON4-GK-20121130-DWI'...
    'LHON5-HS-20121220-DWI'...
    'LHON6-SS-20121221-DWI'...
    'JMD-Ctl-MT-20121025-DWI'...
    'JMD-Ctl-YM-20121025-DWI'...
    'JMD-Ctl-SY-20130222DWI'...
    'JMD-Ctl-HH-20120907DWI'...
    'JMD-Ctl-HT-20120907-DWI'...
    'JMD-Ctl-FN-20130621-DWI'};

%% create aparc+aseg.nii.gz from .mgz
%  loop subject
for i = 1:length(subJ)
    mgzInDir = fullfile(homeDir,'freesurfer',subJ{i},'/mri');
    mgzInF = {'aparc+aseg','aseg'};%,'aparc.a2009s+aseg','brain.finalsurfs','brainmask.auto'}; 
    for k = 1:length(mgzInF)
        mgzIn = sprintf('%s.mgz',fullfile(mgzInDir, mgzInF{k}));
        refImg = fullfile(homeDir,subJ{i},'t1.nii.gz');
        outName = sprintf('%s.nii.gz',fullfile(mgzInDir,mgzInF{k}));
        orient = 'RAS';
        fs_mgzSegToNifti(mgzIn, refImg, outName, orient)
    end
end

%%  Create ROI.mat from aseg.nii.gz (especially Cerebral Cortex). 
        labelVal = {'42','3'};
        outfileName = {'Right-Cerebral-Cortex','Left-Cerebral-Cortex'};

for i = 1:length(subJ)

%loop for every label
    
    for ii = 1:length(outfileName);
        fsIn = fullfile(mgzInDir, 'aseg.nii.gz');
        % save nifti ROI in mri directory
        savefile =fullfile(mgzInDir,outfileName{ii});
        fs_aparcAsegLabelToNiftiRoi(fsIn,labelVal{ii},savefile)
                
        % Save '.mat' ROI in .ROIs directory
        % Set parameters
        nifti       = sprintf('%s.nii.gz',savefile);
        maskValue   = 0; % All nonZero values are used for the mask
        outName     = sprintf('%s.mat',outfileName{ii});
        outFile     = fullfile(homeDir,subJ{i},'dwi_2nd','ROIs',outName);
        outType     = 'mat';  binary = true; save = true;
        
        % run main
        dtiRoiFromNifti(nifti,maskValue,outFile,outType,binary,save);

    end
end