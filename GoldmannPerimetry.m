function GoldmannPerimetry
%% Plot circle

mrvNewGraphWin; hold on;

% viscircles([0,0],90)%,'edgecolor','none')
% fill([0,0],90,[0.3 0.3 0.3])
radi = [10:20:90]; 
for ii = 1:length(radi)
    viscircles([0,0],radi(ii),'edgecolor',[0,0,0],'linewidth',0.5)
end

radi = [20:20:80]; 
for ii = 1:length(radi)
    viscircles([0,0],radi(ii),'edgecolor',[0,0,0],'linestyle',':','linewidth',0.5)
end

axis square
axis off
set(gca,'xlim',[-90 90],'xtick',[-90 0 90],'xtickLabel',[90 0 90],...
    'ylim',[-90 90],'ytick',[-90 0 90],'ytickLabel',[90 0 90])

plot([-90 90],[0 0],'--','color',[0 0 0],'linewidth',0.5)
plot([0 0],[-90 90],'--','color',[0 0 0],'linewidth',0.5)

