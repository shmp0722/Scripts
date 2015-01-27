function check_OT5K_AMDC

[homeDir,subDir,AMDC,JMDC] = Tama_subj3;

%%
for i = AMDC
        % INPUTS
        SubDir   = fullfile(homeDir,subDir{i});
        %     fgDir    = (fullfile(SubDir,'/dwi_2nd/fibers/conTrack/OT_5K'));
        fiberDir = fullfile(SubDir,'/dwi_2nd/fibers');
        fgN = {'LOTD4L4_1206*','ROTD4L4_1206*'};
        
        % Render OT fig
        figure; hold on;
        for j= 1:2            
            fgF = dir(fgN{j});
            fg  = fgRead(fullfile(fiberDir,fgF.name));
            AFQ_RenderFibers(fg,'numfibers',10,'newfig',0)
            
        end
        camlight 'headlight';
        axis off
        axis image
        title([subDir{i}])
        hold off;        
end

