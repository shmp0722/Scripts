%script ORisolation
%
% maps = {'ecc', 'pol'};
% hemi = {'lh', 'rh'};
MaxDegree = 5;
MinDegree = 0;

save  = 0;
%% set subject
homeDir = '/biac4/wandell/biac2/wandell/data/DWI-Tamagawa-Japan2';
subDir = 'LongtudinalComparison';
SubDir = fullfile(homeDir,subDir);
fgDir  = fullfile(SubDir,'/fibers/conTrack');
roiDir = fullfile(SubDir,'/dwi_2nd/ROIs');
dt = dtiLoadDt6(fullfile(SubDir,'dwi_2nd/dt6.mat'));
t1w = niftiRead(dt.files.t1);

%% load ORs
ORf = dir(fullfile(fgDir,'*MD4.pdb'));
fg{1} = fgRead(fullfile(fgDir,ORf(1).name));
% fg{2} = fgRead(fullfile(fgDir,ORf(2).name));

%% See fs_retinotopicTemplate
maps = {'ecc', 'pol'};
hemi = {'lh', 'rh'};
tmpDir = '/biac4/wandell/biac2/wandell/data/DWI-Tamagawa-Japan/LHON6-SS-20121221-DWI/fs_Retinotopy2';

i =1;
tmp = sprintf('*%s_%s.nii.gz',hemi{i},maps{i});
tmpn = dir(fullfile(tmpDir,tmp));
Tmp = niftiRead(fullfile(tmpDir,tmpn.name));
% nifti roi
CurTmp = Tmp;
CurTmp.data(CurTmp.data > MaxDegree)=0;
CurTmp.data(CurTmp.data < MinDegree)=0;
CurTmp.data(CurTmp.data >0) = 1;

% change nifti roi name
CurTmp.fname = fullfile(fileparts(CurTmp.fname),sprintf('%s_Ecc%dto%d',hemi{i},MinDegree,MaxDegree));

%% .mat roi
ni = CurTmp;
% pic img_coords up
inds = find(ni.data==1);
% Convert indexed locations to I J K coords
[I, J, K] = ind2sub(size(ni.data),inds);

% Now convert I J K coords to ACPC
acpcCoords =floor(unique(mrAnatXformCoords(ni.qto_xyz, [I J K]),'rows'));

% Add ACPC coords and name into a mrD ROI struct
[p, f, e1] = fileparts(CurTmp.fname); 
[p, f, e2] = fileparts(fullfile(p,f));
e = [e1, e2];
outName = fullfile(p,[f,'.mat']);
roi = dtiNewRoi(outName,'r',acpcCoords);

FG = dtiIntersectFibersWithRoi(0, 'endpoints', [], roi, fg{1});

[fg{1}] = SO_AlignFiberDirection(fg{1},'AP');

fc = zeros(length(fg{1}.fibers), 3);
for ii=1:length(fg{1}.fibers)
%         fc((ii-1)*2+1,:) = [FG.fibers{ii}(:,1)'];
        fc(ii,:) = [fg{1}.fibers{ii}(:,end)'];
end
%
    bestSqDist = cell(length(roi.coords),1);
    keepAll    = cell(length(roi.coords),1);
     minDist = 0.87;
    for ii=1:length(roi.coords)
      [~, bestSqDist{ii}] = nearpoints(fc', roi.coords(ii,:)');
      keepAll{ii}         = bestSqDist{ii}<=minDist^2;
    end
    clear fc;
    
    keep = true(length(fg{1}.fibers),length(roi.coords));
keepID = zeros(length(fg{1}.fibers),length(roi.coords));
dist = zeros(length(fg{1}.fibers),length(roi.coords));

for(ii=1:length(roi.coords))
    fiberCoord = 1;
    if(endptFlag)
        for(jj=1:length(fg.fibers))
            if (both_endptFlag)
                keep(jj,ii) = all(keepAll{ii}(fiberCoord:fiberCoord+1));
            else
            keep(jj,ii) = any(keepAll{ii}(fiberCoord:fiberCoord+1));
            end
            if keep(jj,ii)
                keepID(jj,ii) = find(keepAll{ii}(fiberCoord:fiberCoord+1),1,'first');
            end
            dist(jj,ii) = min(bestSqDist{ii}(fiberCoord:fiberCoord+1));
            fiberCoord = fiberCoord+2;
        end
    else
        for(jj=1:length(fg.fibers))
            fiberLen = size(fg.fibers{jj},2);
            keep(jj,ii) = any(keepAll{ii}(fiberCoord:fiberCoord+fiberLen-1));
            if keep(jj,ii)
                keepID(jj,ii) = find(keepAll{ii}(fiberCoord:fiberCoord+fiberLen-1),1,'first');
            end
            dist(jj,ii) = min(bestSqDist{ii}(fiberCoord:fiberCoord+fiberLen-1));
            fiberCoord = fiberCoord+fiberLen;
        end
    end
    keepAll{ii} = [];
end



AFQ_RenderFibers(FG,'numfibers',100)
AFQ_RenderRoi(roi1)
view(45,45)

