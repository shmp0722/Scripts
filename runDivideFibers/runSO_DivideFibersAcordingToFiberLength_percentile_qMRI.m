function [TractProfile] = runSO_DivideFibersAcordingToFiberLength_percentile_qMRI
%%
homeDir = TamagawaPath('qmr');
subDir = 'LHON1-CV-76M-20141205_8504';
%% Calculate vals along the fibers and return TP structure
fgN ={'ROR_D4L4.pdb','LOR_D4L4.pdb','ROTD4L4_1206.pdb','LOTD4L4_1206.pdb'};

%% get diffusivities based on fiber length (percentile)

% define directory
SubDir = fullfile(homeDir,subDir);
OR_fgDir    = (fullfile(SubDir,'/dwi96/fibers/conTrack/OR_100k'));
OT_fgDir = fullfile(SubDir,'/dwi96/fibers/conTrack/OT_5K');
% dt6 file
dt  = fullfile(homeDir,subDir,'dwi96','dt6.mat');
dt6  = dtiLoadDt6(dt);

for j =1:length(fgN)
    switch j
        case {1,2}
            fg = fgRead(fullfile(OR_fgDir,fgN{j}));
        case {3,4}
            fg = fgRead(fullfile(OT_fgDir,fgN{j}));
    end
    [TractProfile{j}, ~,~,~,~,~]...
        = SO_DivideFibersAcordingToFiberLength_percentile(fg,dt6,0,'AP',100);
end

save TractProfile_LHON1CV TractProfile
