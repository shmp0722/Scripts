%% set directories

[AFQdata ,subs] = Tama_subj3;

%%
% Make directory structure for each subject
for ii = 1:length(subs)
    sub_dirs{ii} = fullfile(AFQdata, subs{ii},'dwi_2nd');
end

% Subject grouping is a little bit funny because afq only takes two groups
% but we have 3. For now we will divide it up this way but we can do more
% later
sub_group = zeros(1,17);
sub_group(1,17)=1;

% Now create and afq structure
afq = AFQ_Create('sub_dirs', sub_dirs, 'sub_group', sub_group, 'clip2rois', 0,'normalization','ants');
afq.params.track.algorithm = 'mrtrix';

% Run AFQ on these subjects
afq = AFQ_run(sub_dirs, sub_group, afq);

TamagawaPath(3)

save AFQ_AMDC afq  

return
