function [roi] = fs_V1RetinotopyRoi(template, MinDegree, MaxDegree, saveflag, outType)
% This function divide V1 ROI in periferal and foveal part based on
% retiontopic eccentrisity.
%
% You need to run fs_retinotopicTemplate and get eccecntricity map before this function.  
% See; fs_retinotopicTemplate
%  input;
%       template; 
%       outType;     - 'nifti' or 'mat' [outType='nifti']
% 
% SO@Vista lab Stanford 2014

%% argument check   
        %% template
        if ~exist(template),
            sprintf('Make sure if exist template')
            return
        elseif ischar(template);
            ni =niftiRead(template);
        else isstruct(template)
            ni = template;
        end
        
        %% select voxels has less than Maximum
        % foveal ROL
        roi = ni;
        roi.data(roi.data > MaxDegree)=0;
        roi.data(roi.data < MinDegree)=0;
        roi.data(roi.data >0) = 1;        
       

        %% save the ROI
        if saveflag == true,
            switch outType
                case {'nifti','nii','.nii','.nii.gz'}
                    niiName =  [roi.fname,'.nii.gz'];
                    niftiWrite(roi,niiName)
                case {'mat','.mat'}                    
                    matName =  [roi.fname,'.mat'];
                    binary = true; save = true;
                    roi = SO_dtiRoiFromNifti(roi,0,matName,'mat',binary,0);
            end
        end
end

