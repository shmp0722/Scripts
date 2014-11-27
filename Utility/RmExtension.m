function [p,f,e] = RmExtension(path)
%
% Just remove extension like '.nii.gz', 
% 

% Strip off the extension 
[p, f, e1] = fileparts(path); 
[p, f, e2] = fileparts(fullfile(p,f));
e = [e1, e2];