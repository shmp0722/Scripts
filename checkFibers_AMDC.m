function checkFibers_AMDC

[homeDir,subDir,AMDC,JMDC] = Tama_subj3;

%%
for i = AMDC
        % INPUTS
        SubDir   = fullfile(homeDir,subDir{i});
        fgDir    = (fullfile(SubDir,'/dwi_2nd/fibers/conTrack/OR_Top100K_V1_3mm_clipped_LGN4mm'));
        fiberDir = fullfile(SubDir,'/dwi_2nd/fibers');
        fgN = {'LOTD4L4_1206.pdb','ROTD4L4_1206.pdb','LOR_D4L4.pdb','ROR_D4L4.pdb'};
        
        % Render OT fig
        figure; hold on;
        for j= 1:2            
            fg1  = fgRead(fullfile(fiberDir,fgN{j}));
            AFQ_RenderFibers(fg1,'numfibers',10,'newfig',0)
            fgF = dir(fgN{j+2});
            fg2  = fgRead(fullfile(fgDir,fgN{j+2}));
            AFQ_RenderFibers(fg2,'numfibers',100,'newfig',0)
        end
        
        camlight 'headlight';
        axis off
        axis image
        title([subDir{i}])
        hold off;        
end

