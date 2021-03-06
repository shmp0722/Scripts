%% feClipFibersToVolume_test.m
%Clip fibers to be constrained withint a Volume.
%
%  function fibers = feClipFibersToVolume(fibers,coords,maxVolDist)
%
% INPUTS:
%        fibers         - A cell array of fibers, each defined as a 3xN array
%                         of x,y,z coordinates. E.g., fg.fibers.
%        coords         - A volume of defined as a 3xN array of x,y,z coordinates.
%        maxVolDist     - The farther distance (in mm) from the volume a node can
%                         be to be kept in the fiber.
%
% OUTPUTS:
%        fibersOut      - A cell-array of fibers clipped within the volume
%                        defined by coords.
%
% SEE ALSO: feClipFiberNodes.m, feConnectomePreprocess.m
%
% Franco (c) 2012 Stanford Vista Team.

%% Initializing the parallel toolbox
poolwasopen=1; % if a matlabpool was open already we do not open nor close one
if (matlabpool('size') == 0),
    c = parcluster;
    c.NumWorkers = 8;
    matlabpool(c);
    poolwasopen=0;
end
%%
homeDir = '/biac4/wandell/biac2/wandell/data/DWI-Tamagawa-Japan';

subDir ={
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
    'JMD-Ctl-FN-20130621-DWI'
    'JMD-Ctl-AM-20130726-DWI'};
for i = 1:length(subDir)
    % INPUTS
    SubDir=fullfile(homeDir,subDir{i});
    fgDir = (fullfile(SubDir,'/dwi_2nd/fibers/conTrack/OR_Top100K_V1_3mm_clipped'));
    cd(fgDir)
    
    
    % load fg
    switch i
        case {1,2,3,4,5,6,10,11,12,13,14,15,16,17,18,19,20}
            fgfile = {'fg_OR_Top100K_V1_3mm_clipped_Lt-LGN_lh_V1_smooth3mm_NOT_2013-06-19_18.12.51.pdb'
                'fg_OR_Top100K_V1_3mm_clipped_Rt-LGN_rh_V1_smooth3mm_NOT_2013-06-19_18.12.51.pdb'};
        case {7,8,9}
            fgfile = {'fg_OR_Top100K_V1_3mm_clipped_Lt-LGN_lh_V1_smooth3mm_NOT_2013-06-26_16.58.13.pdb'
                'fg_OR_Top100K_V1_3mm_clipped_Rt-LGN_rh_V1_smooth3mm_NOT_2013-06-26_16.58.13.pdb'};
        case {21}
            fgfile = {'fg_OR_Top100K_V1_3mm_clipped_Lt-LGN_lh_V1_smooth3mm_NOT_2013-07-02_15.23.28.pdb'
                'fg_OR_Top100K_V1_3mm_clipped_Rt-LGN_rh_V1_smooth3mm_NOT_2013-07-02_15.23.28.pdb'};
        case {22}
            fgfile = {'fg_OR_Top100K_V1_3mm_clipped_LGN4mm_Lt-LGN4_lh_V1_smooth3mm_NOT_2013-07-28_09.05.36.pdb'
                'fg_OR_Top100K_V1_3mm_clipped_LGN4mm_Rt-LGN4_rh_V1_smooth3mm_NOT_2013-07-28_09.05.36.pdb'};
    end
    
    for k= 1:length(fgfile)
        % Load roi
        switch k
            case 1 % for left hemi-sphere fg
                roiFile1 = 'Right-Cerebral-White-Matter_Rt-LGN'; %
                roiFile2 = 'Left-Cerebral-White-Matter_Lt-LGN'; %
                roiFile3 = 'Left-Hippocampus';
            case 2
                roiFile1 = 'Left-Cerebral-White-Matter_Lt-LGN';
                roiFile2 = 'Right-Cerebral-White-Matter_Rt-LGN';
                roiFile3 = 'Right-Hippocampus';
        end
        % load roi, fg
        % NOT roi is for dtiIntersect, AND roi is for feClip
        NOTroi1 = dtiReadRoi(fullfile(homeDir,subDir{i},'/dwi_2nd/ROIs',roiFile1));
        NOTroi2 = dtiReadRoi(fullfile(homeDir,subDir{i},'/dwi_2nd/ROIs',roiFile3));
        
        NOTroi = dtiMergeROIs(NOTroi1,NOTroi2);
        ANDroi = dtiReadRoi(fullfile(homeDir,subDir{i},'/dwi_2nd/ROIs',roiFile2));
        
        fg=fgRead(fgfile{k});
        
        % Intersect interhemisphere fibers using NOTroi
        [fgOut,~,keep,~] = dtiIntersectFibersWithRoi([],'not',[],NOTroi,fg);
        
        % keep pathwayInfo and Params.stat for contrack scoring
        keep1 = ~keep;
        for l = 1:length(fgOut.params)
            fgOut.params{1,l}.stat=fgOut.params{1,l}.stat(keep1);
            fgOut.pathwayInfo = fgOut.pathwayInfo(keep1);
        end
        fgOut1.name = sprintf('%s.pdb',fgOut.name);
        mtrExportFibers(fgOut, fgOut1.name,[],[],[],2)
        
        %% contrack scoring
        name = fg.name(3:end);
        
        nFiber = length(fgOut.fibers);
        if nFiber >= 20000;
            nFiber = 20000;
        elseif  20000> nFiber >10000;
            nFiber = 10000;
        else  nFiber <= 10000;
            nFiber = nFiber-1000;
        end
        % get oldest files to match the identifier in the folder
        dTxt = fullfile(pwd,sprintf('%s%s.txt','ctrSampler',name));
        dPdb = fgOut1.name;
%         [~, tmp] = fileparts(dPdb{1});
%         
%         inds = strfind(tmp,fileidentifier);
%         name = tmp(1:inds-1);
%         
        % define filename for fiber group
        [p,n,e] = fileparts(dPdb);
        m = strfind(n,'.'); n(m)='_';
        outputfibername = fullfile(pwd, sprintf('%s%s_%d.pdb',n,'_Ctr',nFiber));
        
        % make command to get 25000 fibers for contrack
        ContCommand = sprintf('contrack_score.glxa64 -i %s -p %s --thresh %d --sort %s', ...
            dTxt, outputfibername, nFiber, dPdb);
        
        % run contrack
        system(ContCommand);
    

        %% run feClipFibersVolume
        
        fg = fgRead(outputfibername);
        % Keep parameters, once
        params      = fg.params;
        pathwayInfo = fg.pathwayInfo;
        
        % Clear parameters fields that we do not need:
        fg.params      = [];
        fg.pathwayInfo = [];
        
        % Clip the fibers' nodes that are 1mm away from the WM.
        maxVolDist = 0; % mm
        fg1 = feClipFibersToVolume(fg,ANDroi.coords,maxVolDist);
        
        % Back parameter
        
        % % Show a random 2000 fibers
        % fg1=fg;
        % fg1.fibers = fg1.fibers(randsample(1:length(fg1.fibers),500));
        % feConnectomeDisplay(fg1,figure)
        
        % Save the clipped fiber group back to disk.
        fg1.name = sprintf('%s-BWhiteMatter',fg1.name);
        fgWrite(fg1,fg1.name,'mat')
    end
end
return

