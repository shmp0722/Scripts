function s_ctrIntBathPipeline_OR_Top100K_Tama3(id)
% Multi-Subject Tractography for Tamagawa_subjects using conTrack
%
%

%% pick up subjects

[homeDir,subDir,JMD,CRD,LHON,Ctl,RP,AMDC] = Tama_subj2;

%
subs = squeeze(subDir(id));

%% Set ctrInitBatchParams

% make Params structure
ctrParams = ctrInitBatchParams;

% give the names 
ctrParams.projectName = 'OR_100K';
ctrParams.logName = 'myConTrackLog';
ctrParams.baseDir = homeDir;
ctrParams.dtDir = 'dwi_2nd';
ctrParams.roiDir = '/dwi_2nd/ROIs';
ctrParams.subs = subs;

% set parameter
ctrParams.roi1 = {'Lt-LGN4','Rt-LGN4'};
ctrParams.roi2 = {'lh_V1_smooth3mm_NOT','rh_V1_smooth3mm_NOT'};
ctrParams.nSamples = 100000;
ctrParams.maxNodes = 240;
ctrParams.minNodes = 50; % defalt: 10
ctrParams.stepSize = 1;
ctrParams.pddpdfFlag = 0;
ctrParams.wmFlag = 0;
ctrParams.oi1SeedFlag = 'true';
ctrParams.oi2SeedFlag = 'true';
ctrParams.multiThread = 0;
ctrParams.xecuteSh = 0;


%% Run ctrInitBatchTrack
%
[cmd infofile] = ctrInitBatchTrack(ctrParams);


%% run conTrack
system(cmd);




