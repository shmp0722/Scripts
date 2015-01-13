function runAFQonMySubjects_Tama2_39subj_mrtrix
% Run AFQ_run for these subjects
% set directories

[AFQdata, subs] = Tama_subj2;
%% Make directory structure for each subject
for ii = 1:length(subs)
    sub_dirs{ii} = fullfile(AFQdata, subs{ii},'dwi_2nd');
end

% Subject grouping is a little bit funny because afq only takes two groups
% but we have 3. For now we will divide it up this way but we can do more
% later
a = ones(1,39);
b = [16:23,31:33,35:37];
a(1,b) = 0; 
sub_group = a;
% sub_group = [1,0];

% Now create and afq structure
afq = AFQ_Create('sub_dirs', sub_dirs, 'sub_group', sub_group, 'clip2rois', 0);
% if you would like to use ants for normalization
% afq = AFQ_Create('sub_dirs', sub_dirs, 'sub_group', sub_group, 'clip2rois', 0,'normalization','ants');

% % To have afq overwrite the old fibers
% afq = AFQ_set(afq,'overwritesegmentation');
% afq = AFQ_set(afq,'overwritecleaning');

% % afq.params.cutoff=[5 95];
% afq.params.outdir = ...
%     fullfile(AFQdata,'/AFQ_results/6LHON_9JMD_8Ctl');
% afq.params.outname = 'AFQ_6LHON_9JMD_8Ctl_1015.mat';
afq.params.run_mode = 'mrtrix';

%% Run AFQ on these subjects
afq = AFQ_run(sub_dirs, sub_group, afq);

%% add VOF to afq atructure
% L_VOF
fgName = 'L_VOF.pdb';
roi1Name = afq.roi1names{1,19};
roi2Name = afq.roi2names{1,19};
afq = AFQ_AddNewFiberGroup(afq, fgName, roi1Name, roi2Name, 0, 1);

% R_VOF
fgName = 'R_VOF.pdb';
roi1Name = afq.roi1names{1,20};
roi2Name = afq.roi2names{1,20};
afq = AFQ_AddNewFiberGroup(afq, fgName, roi1Name, roi2Name, 0, 1);




