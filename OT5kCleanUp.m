function OT5kCleanUp
% To get the Optic Tract is able to analyse.

%% exclude fibers depend on anatomical location (waypoint ROI)

% homeDir ='/peach/shumpei/qMRI';
[homeDir, subDir] = fileparts(pwd);


fgDir = fullfile(homeDir,subDir,'/dwi_2nd/fibers/conTrack/OT_5K');
roiDir =fullfile(homeDir,subDir,'/ROIs');

fgf = {'*Lt-LGN4*.pdb'
    '*Rt-LGN4*.pdb'};
%% contrack scoring
for j = 1:2
    %
    fgF = dir(fullfile(fgDir,fgf{j}));
%     fg = fgRead((fullfile(fgDir,fgF.name)));
    cd(fgDir)
    % conTrack scoring
    nFiber=100;
    % get .txt and .pdb filename
    identifier = fgF.name(end-8:end-4);
    dTxtF = ['*',identifier,'*.txt'];
    dTxt = dir(fullfile(fgDir,dTxtF));
    dPdb = fullfile(fgDir,fgF.name);
    
    % give filename to output f group
    [~,f] = fileparts(fgF.name);
    outputfibername = fullfile(fgDir, sprintf('%s_Ctrk%d.pdb',f,nFiber));
    
    % score the fibers to particular number
    ContCommand = sprintf('contrack_score.glxa64 -i %s -p %s --thresh %d --sort %s', ...
        dTxt(end).name, outputfibername, nFiber, dPdb);
    %         contrack_score.glxa64 -i ctrSampler.txt -p scoredFgOut_top5000.pdb --thresh 5000 --sort fgIn.pdb
    % run contrack
    system(ContCommand);
    
    %% AFQ_removeoutlier    
    % Load contrack scored fiber
    fg  = fgRead(outputfibername);
    
    
    maxDist = [3,4];
    maxLen  = [2,4];
    
    % exclude outliers based on maxD and maxL
    for ii = 1:length(maxDist)
        
        [fgclean, keep2]=AFQ_removeFiberOutliers(fg,maxDist(ii),maxLen(ii),25,'mean',1, 5,[]);
        % keep pathwayInfo and Params.stat for contrack scoring
        for l = 1:length(fgclean.params)
            fgclean.params{1,l}.stat=fgclean.params{1,l}.stat(keep2);
        end
        fgclean.pathwayInfo = fgclean.pathwayInfo(keep2);
        fgclean.name = sprintf('%s_D%dL%d.pdb',fgclean.name,maxDist(ii),maxLen(ii));
        
        % align fiber direction comes from anrterior to posterior
        fg_aligned = SO_AlignFiberDirection(fgclean,'AP');
        fgWrite(fg_aligned,[fgclean.name],'pdb')
        
        % Check the fiber tract
        AFQ_RenderFibers(fg_aligned,'numfibers',10);
        
        % give a simple name to this fg
        switch j
            case 1
                fgN = {'LOTD3L2','LOTD4L4'};
            case 2
                fgN = {'ROTD3L2','ROTD4L4'};
        end
        % save a cleaned fiber
        fg_aligned.name = fgN{ii};
        fgWrite(fg_aligned,[fg_aligned.name,'.pdb'],'pdb')
        
    end
    
end
cd(fullfile(homeDir, subDir)) 

