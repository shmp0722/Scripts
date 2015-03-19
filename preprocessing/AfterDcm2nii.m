function AfterDcm2nii
%
% AfterDcm2nii
%
%
% SO @Vista team 2015
%

%% 


%% dwi1st
files = dir('*003a001*');

if length(files)>=2
    for ii = 1:length(files)
        [~,f,e] = fileparts(files(ii).name);
        [~,~,E] = fileparts(f);
        if isempty(E)
            cmd = sprintf('mv *%s ../raw/%s%s',files(ii).name,'dwi1st',e);
        else
            cmd =  sprintf('mv *%s ../raw/%s%s%s',files(ii).name,'dwi1st',E,e);
        end
        system(cmd)
    end
end

% dwi2nd
files = dir('*009a001*');

if length(files)>=2
    for ii = 1:length(files)
        [~,f,e] = fileparts(files(ii).name);
        [~,~,E] = fileparts(f);
        if isempty(E)
            cmd = sprintf('mv *%s ../raw/%s%s',files(ii).name,'dwi2nd',e);
        else
            cmd =  sprintf('mv *%s ../raw/%s%s%s',files(ii).name,'dwi2nd',E,e);
        end
        system(cmd)
    end
end