function Plot_Tractprofiles_3RP_For1210_0113
%% R_OR indivisual

cd /biac4/wandell/biac3/wandell7/shumpei/matlab/git/LHON/3RP


% cd /Users/shumpei/Documents/MATLAB/git/LHON/3RP
load 3RP_1210.mat
cd /biac4/wandell/biac3/wandell7/shumpei/matlab/git/LHON/3RP/Boxplot

%% averaged left and right
diffusivity = 'fa';

switch diffusivity
    case 'fa'
        OR  = ((afq.vals.fa{21}+afq.vals.fa{22})/2)';
        OT  = ((afq.vals.fa{24}+afq.vals.fa{25})/2)';
        OCF_B  = ((afq.vals.fa{26}+afq.vals.fa{27})/2)';
        
        yaxis = 'Fractional Anisotropy';
    case 'md'
        OR  = ((afq.vals.md{21}+afq.vals.md{22})/2)';
        OT  = ((afq.vals.md{24}+afq.vals.md{25})/2)';
        OCF_B  = ((afq.vals.md{26}+afq.vals.md{27})/2)';
        
        yaxis = 'Mean Diffusivity';
    case 'ad'
        OR  = ((afq.vals.ad{21}+afq.vals.ad{22})/2)';
        OT  = ((afq.vals.ad{24}+afq.vals.ad{25})/2)';
        OCF_B  = ((afq.vals.ad{26}+afq.vals.ad{27})/2)';
        
        yaxis = 'Axial Diffusivity';
    case 'rd'
        OR  = ((afq.vals.rd{21}+afq.vals.rd{22})/2)';
        OT  = ((afq.vals.rd{24}+afq.vals.rd{25})/2)';
        OCF_B  = ((afq.vals.rd{26}+afq.vals.rd{27})/2)';
        yaxis = 'Radial Diffusivity';
end

JMD_OR  = mean(OR(1:4,:));
CRD_OR  = mean(OR(5:9,:));
LHON_OR = mean(OR(10:15,:));
Ctl_OR  = mean(OR(16:23,:));

JMD_OT  = mean(OT(1:4,:));
CRD_OT  = nanmean(OT(5:9,:));
LHON_OT = mean(OT(10:15,:));
Ctl_OT  = mean(OT(16:23,:));

JMD_OCF_B  = mean(OCF_B(1:4,:));
CRD_OCF_B  = mean(OCF_B(5:9,:));
LHON_OCF_B = mean(OCF_B(10:15,:));
Ctl_OCF_B  = mean(OCF_B(16:23,:));


% volume
OT_V    = ((afq.vals.volume{24}+afq.vals.volume{25})/2)';
OR_V    = ((afq.vals.volume{21}+afq.vals.volume{22})/2)';
OCF_V   = afq.vals.volume{26}';
OCF_B_V = ((afq.vals.volume{26}+afq.vals.volume{27})/2)';


%% plot JMD.fa
c= lines(24);
figure; hold on;

for i = 1:9;
    X = 1:100;
    Y = afq.vals.fa{21}(i,:);
    plot(X,Y,'Color',c(i,:))
end

JMDmean = plot(X,JMD.fa);
set(JMDmean,'Linewidth',2, 'Color',c(24,:));


% legend('JMD', 'LHON', 'Ctl');
xlabel('Location','fontName','Times','fontSize',14);
ylabel('Fractional Anisotropy','fontName','Times','fontSize',14);
title('R-Optic Radiation all_9JMD','fontName','Times','fontSize',14);
hold off;

%% plot JMD.fa
c= lines(24);
figure; hold on;

for i = 1:9;
    X = 1:100;
    Y = afq.vals.fa{21}(i,:);
    pl(i)=plot(X,Y,'Color',c(i,:));
end
set(pl(1),'Linewidth',2);
set(pl(2),'Linewidth',2);
set(pl(6),'Linewidth',2);


JMDmean = plot(X,JMD.fa);
set(JMDmean,'Linewidth',2, 'Color',c(24,:));


legend('JMD1', 'JMD3', 'Mean');
xlabel('Location','fontName','Times','fontSize',14);
ylabel('Fractional Anisotropy','fontName','Times','fontSize',14);
title('R-Optic Radiation all_9JMD','fontName','Times','fontSize',14);


%% plot congenital MD individual
c= lines(24);
figure; hold on;
for i = 3:4;
    X = 1:100;
    Y = afq.vals.fa{21}(i,:);
    plot(X,Y,'Color',c(i,:))
end


congMDmean = plot(X,congMD.fa);
set(congMDmean,'Linewidth',2, 'Color',c(24,:));

% legend('JMD', 'LHON', 'Ctl');
xlabel('Location','fontName','Times','fontSize',14);
ylabel('Fractional Anisotropy','fontName','Times','fontSize',14);
title('R-Optic Radiation congenitalMD 1:4','fontName','Times','fontSize',14);
hold off;

%% CRD 5:9 plot
c= lines(24);
figure; hold on;
for i = 5:9;
    X = 1:100;
    Y = afq.vals.fa{21}(i,:);
    plot(X,Y,'Color',c(i,:))
end
CRDmean = plot(X,CRD.fa);
set(CRDmean,'Linewidth',2, 'Color',c(24,:));


% legend('JMD', 'LHON', 'Ctl');
xlabel('Location','fontName','Times','fontSize',14);
ylabel('FA','fontName','Times','fontSize',14);
title('R-Optic Radiation CRD','fontName','Times','fontSize',14);
hold off;


%% plot LHON
c= lines(24);
figure; hold on;
for i = 10:15;
    X = 1:100;
    Y = afq.vals.fa{21}(i,:);
    plot(X,Y,'Color',c(i,:))
end

LHONmean = plot(X,LHON.fa);
set(LHONmean,'Linewidth',2, 'Color',c(24,:));



% legend('JMD', 'LHON', 'Ctl');
xlabel('Location','fontName','Times','fontSize',14);
ylabel('FA','fontName','Times','fontSize',14);
title('R-Optic Radiation LHON','fontName','Times','fontSize',14);
hold off;

%% plot Ctr

c= lines(24);
figure; hold on;
for i = 16:23;
    X = 1:100;
    Y = afq.vals.fa{21}(i,:);
    plot(X,Y,'Color',c(i,:))
end

Ctlmean = plot(X,Ctl.fa);
set(Ctlmean,'Linewidth',2, 'Color',c(24,:));

% legend('JMD', 'LHON', 'Ctl');
xlabel('Location','fontName','Times','fontSize',14);
ylabel('FA','fontName','Times','fontSize',14);
title('R-Optic Radiation Control','fontName','Times','fontSize',14);
hold off;


%%%%%%%%%%%%%
%% Group 9JMD
%%%%%%%%%%%%%
%% FA group comparison across 6LHON, 9JMD, and 8Control

figure; hold on;

JMDmean   = plot(X,JMD.fa,'Color',c(1,:),'Linewidth',2);
congMDmean = plot(X,congMD.fa,'Color',c(2,:),'Linewidth',2);
CRDmean    = plot(X,CRD.fa,'Color',c(3,:),'Linewidth',2);
% LHONmean   = plot(X,LHON.fa,'Color',c(4,:),'Linewidth',2);
Ctlmean    = plot(X,Ctl.fa,'Color',[0.5,0.5,0.5],'Linewidth',2);

legend('JMDmean','LHONmean','Ctlmean');
legend('congenitalMD','CRD','Ctl');



JMDerror    = errorbar(X, JMD.fa,JMD.FAse ,'Color',c(1,:));
congMDerror = errorbar(X, congMD.fa,congMD.FAse ,'Color',c(2,:));
CRDerror    = errorbar(X, CRD.fa, CRD.FAse ,'Color',c(3,:));
LHONerror   = errorbar(X, LHON.fa, LHON.FAse ,'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl.fa, Ctl.FAse ,'Color',[0.5,0.5,0.5]);

axis([0,100,0.25,0.65]);
% set(gcf, )
xlabel('Location','fontName','Times','fontSize',14);
ylabel('FA','fontName','Times','fontSize',14);
title('R-Optic Radiation across groups','fontName','Times','fontSize',14);

hold off;

%% save the figure in .eps
% Figure を 1024x768 のeps形式で
% "fig.eps" に保存する例
width  = 512;
height =384;
set(gcf,'PaperPositionMode','auto')
pos=get(gcf,'Position');
pos(3)=width-1; %なぜか幅が1px増えるので対処
pos(4)=height;
set(gcf,'Position',pos);
print('-r0','-depsc','R-OR_FA_group_comaprison_4congMD_5CRD_8Ctl.eps');

%% MD group comparison across 6LHON, 9JMD, and 8Control

figure; hold on;

JMDmean   = plot(X,JMD.md,'Color',c(1,:),'Linewidth',2);
% congMDmean = plot(X,congMD.fa,'Color',c(2,:),'Linewidth',2);
% CRDmean    = plot(X,CRD.fa,'Color',c(3,:),'Linewidth',2);
LHONmean   = plot(X,LHON.md,'Color',c(4,:),'Linewidth',2);
Ctlmean    = plot(X,Ctl.md,'Color',[0.5,0.5,0.5],'Linewidth',2);

legend('JMDmean','LHONmean','Ctlmean');

JMDerror    = errorbar(X, JMD.md,JMD.MDse ,'Color',c(1,:));
% congMDerror = errorbar(X, congMD.fa,congMD.FAse ,'Color',c(2,:));
% CRDerror    = errorbar(X, CRD.fa, CRD.FAse ,'Color',c(3,:));
LHONerror   = errorbar(X, LHON.md, LHON.MDse ,'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl.md, Ctl.MDse ,'Color',[0.5,0.5,0.5]);

axis([0,100,0.65, 0.95]);
% set(gcf, )
xlabel('Location','fontName','Times','fontSize',14);
ylabel('MD','fontName','Times','fontSize',14);
title('R-Optic Radiation across groups','fontName','Times','fontSize',14);

hold off;

%% AD group comparison across 6LHON, 9JMD, and 8Control

figure; hold on;

JMDmean   = plot(X,JMD.ad,'Color',c(1,:),'Linewidth',2);
% congMDmean = plot(X,congMD.fa,'Color',c(2,:),'Linewidth',2);
% CRDmean    = plot(X,CRD.fa,'Color',c(3,:),'Linewidth',2);
LHONmean   = plot(X,LHON.ad,'Color',c(4,:),'Linewidth',2);
Ctlmean    = plot(X,Ctl.ad,'Color',[0.5,0.5,0.5],'Linewidth',2);

legend('JMDmean','LHONmean','Ctlmean');

JMDerror    = errorbar(X, JMD.ad ,JMD.ADse ,'Color',c(1,:));
% congMDerror = errorbar(X, congMD.fa,congMD.FAse ,'Color',c(2,:));
% CRDerror    = errorbar(X, CRD.fa, CRD.FAse ,'Color',c(3,:));
LHONerror   = errorbar(X, LHON.ad, LHON.ADse ,'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl.ad, Ctl.ADse ,'Color',[0.5,0.5,0.5]);

axis([0,100,0.9, 1.5]);
% set(gcf, )
xlabel('Location','fontName','Times','fontSize',14);
ylabel('AD','fontName','Times','fontSize',14);
title('R-Optic Radiation across groups','fontName','Times','fontSize',14);

hold off;

%% RD group comparison across 6LHON, 9JMD, and 8Control

figure; hold on;

JMDmean   = plot(X,JMD.rd,'Color',c(1,:),'Linewidth',2);
% congMDmean = plot(X,congMD.fa,'Color',c(2,:),'Linewidth',2);
% CRDmean    = plot(X,CRD.fa,'Color',c(3,:),'Linewidth',2);
LHONmean   = plot(X,LHON.rd,'Color',c(4,:),'Linewidth',2);
Ctlmean    = plot(X,Ctl.rd,'Color',[0.5,0.5,0.5],'Linewidth',2);

legend('JMDmean','LHONmean','Ctlmean');

JMDerror    = errorbar(X, JMD.rd ,JMD.RDse ,'Color',c(1,:));
% congMDerror = errorbar(X, congMD.fa,congMD.FAse ,'Color',c(2,:));
% CRDerror    = errorbar(X, CRD.fa, CRD.FAse ,'Color',c(3,:));
LHONerror   = errorbar(X, LHON.rd, LHON.RDse ,'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl.rd, Ctl.RDse ,'Color',[0.5,0.5,0.5]);

axis([0,100,0.4, 0.75]);
% set(gcf, )
xlabel('Location','fontName','Times','fontSize',14);
ylabel('RD','fontName','Times','fontSize',14);
title('R-Optic Radiation across groups','fontName','Times','fontSize',14);

hold off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Group CRD
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% FA 6LHON_5CRD_8Ctl group comparison across LHON, 5CRD, and Control

figure; hold on;
X=1:100;
c=lines(100);
% JMD9mean   = plot(X,JMD.fa,'Color',c(1,:),'Linewidth',2);
% congMDmean = plot(X,congMD.fa,'Color',c(2,:),'Linewidth',2);
CRDmean    = plot(X,CRD.fa,'Color',c(3,:),'Linewidth',2);
LHONmean   = plot(X,LHON.fa,'Color',c(4,:),'Linewidth',2);
Ctlmean    = plot(X,Ctl.fa,'Color',[0.5,0.5,0.5],'Linewidth',2);

% legend('CRDmean','LHONmean','Ctlmean');

% JMDerror    = errorbar(X, JMD.fa,JMD.FAse ,'Color',c(1,:));
% congMDerror = errorbar(X, congMD.fa,congMD.FAse ,'Color',c(2,:));
CRDerror    = errorbar(X, CRD.fa, CRD.FAse ,'Color',c(3,:));
LHONerror   = errorbar(X, LHON.fa, LHON.FAse ,'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl.fa, Ctl.FAse ,'Color',[0.5,0.5,0.5]);
axis([0,100,0.25,0.65]);
% set(gcf, )
xlabel('Location','fontName','Times','fontSize',14);
ylabel('FA','fontName','Times','fontSize',14);
title('R-Optic Radiation across groups','fontName','Times','fontSize',14);

hold off;

%% save the figure in .eps
print(gcf, '-depsc', '-noui', 'R-OR_FA_group_comaprison_6LHON_5CRD_8Ctl.eps')


%% save the figure in .eps
% width  = 512;
% height =384;
% set(gcf,'PaperPositionMode','auto')
% pos=get(gcf,'Position');
% pos(3)=width-1;
% pos(4)=height;
% set(gcf,'Position',pos);
% print('-r0','-depcs','R-OR_FA_group_comaprison_6LHON_5CRD_8Ctl.eps');
%% MD 6LHON_5CRD_8Ctl group comparison across LHON, 5CRD, and Control

figure; hold on;

% JMD9mean   = plot(X,JMD.fa,'Color',c(1,:),'Linewidth',2);
% congMDmean = plot(X,congMD.fa,'Color',c(2,:),'Linewidth',2);
CRDmean    = plot(X,CRD.md,'Color',c(3,:),'Linewidth',2);
LHONmean   = plot(X,LHON.md,'Color',c(4,:),'Linewidth',2);
Ctlmean    = plot(X,Ctl.md,'Color',[0.5,0.5,0.5],'Linewidth',2);

legend('CRDmean','LHONmean','Ctlmean');

% JMDerror    = errorbar(X, JMD.fa,JMD.FAse ,'Color',c(1,:));
% congMDerror = errorbar(X, congMD.fa,congMD.FAse ,'Color',c(2,:));
CRDerror    = errorbar(X, CRD.md, CRD.MDse ,'Color',c(3,:));
LHONerror   = errorbar(X, LHON.md, LHON.MDse ,'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl.md, Ctl.MDse ,'Color',[0.5,0.5,0.5]);
axis([0, 100, 0.65, 1]);
% set(gcf, )
xlabel('Location','fontName','Times','fontSize',14);
ylabel('MD','fontName','Times','fontSize',14);
title('R-Optic Radiation across groups','fontName','Times','fontSize',14);

hold off;

%%
print(gcf, '-depsc', '-noui', 'R-OR_MD_group_comaprison_6LHON_5CRD_8Ctl.eps')


%
% %% save the figure in .eps
% width  = 512;
% height =384;
% set(gcf,'PaperPositionMode','auto')
% pos=get(gcf,'Position');
% pos(3)=width-1;
% pos(4)=height;
% set(gcf,'Position',pos);
% print('-r0','-depsc','R-OR_MD_group_comaprison_6LHON_5CRD_8Ctl.eps');

%% AD 6LHON_5CRD_8Ctl group comparison across LHON, 5CRD, and Control

figure; hold on;

% JMD9mean   = plot(X,JMD.fa,'Color',c(1,:),'Linewidth',2);
% congMDmean = plot(X,congMD.fa,'Color',c(2,:),'Linewidth',2);
CRDmean    = plot(X,CRD.ad,'Color',c(3,:),'Linewidth',2);
LHONmean   = plot(X,LHON.ad,'Color',c(4,:),'Linewidth',2);
Ctlmean    = plot(X,Ctl.ad,'Color',[0.5,0.5,0.5],'Linewidth',2);

legend('CRDmean','LHONmean','Ctlmean');

% JMDerror    = errorbar(X, JMD.fa,JMD.FAse ,'Color',c(1,:));
% congMDerror = errorbar(X, congMD.fa,congMD.FAse ,'Color',c(2,:));
CRDerror    = errorbar(X, CRD.ad, CRD.ADse ,'Color',c(3,:));
LHONerror   = errorbar(X, LHON.ad, LHON.ADse ,'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl.ad, Ctl.ADse ,'Color',[0.5,0.5,0.5]);
axis([0, 100, 0.9, 1.5]);
% set(gcf, )
xlabel('Location','fontName','Times','fontSize',14);
ylabel('AD','fontName','Times','fontSize',14);
title('R-Optic Radiation across groups','fontName','Times','fontSize',14);

hold off;

%% save the figure in .eps

print(gcf, '-depsc', '-noui', 'R-OR_AD_group_comaprison_6LHON_5CRD_8Ctl.eps')



% % Figure を 1024x768 のeps形式で
% % "fig.eps" に保存する例
% width  = 512;
% height =384;
% set(gcf,'PaperPositionMode','auto')
% pos=get(gcf,'Position');
% pos(3)=width-1; %なぜか幅が1px増えるので対処
% pos(4)=height;
% set(gcf,'Position',pos);
% print('-r0','-depsc','R-OR_AD_group_comaprison_6LHON_5CRD_8Ctl.eps');


%% RD 6LHON_5CRD_8Ctl group comparison across LHON, 5CRD, and Control

figure; hold on;

% JMD9mean   = plot(X,JMD.fa,'Color',c(1,:),'Linewidth',2);
% congMDmean = plot(X,congMD.fa,'Color',c(2,:),'Linewidth',2);
CRDmean    = plot(X,CRD.rd,'Color',c(3,:),'Linewidth',2);
LHONmean   = plot(X,LHON.rd,'Color',c(4,:),'Linewidth',2);
Ctlmean    = plot(X,Ctl.rd,'Color',[0.5,0.5,0.5],'Linewidth',2);

legend('CRDmean','LHONmean','Ctlmean');

% JMDerror    = errorbar(X, JMD.fa,JMD.FAse ,'Color',c(1,:));
% congMDerror = errorbar(X, congMD.fa,congMD.FAse ,'Color',c(2,:));
CRDerror    = errorbar(X, CRD.rd, CRD.RDse ,'Color',c(3,:));
LHONerror   = errorbar(X, LHON.rd, LHON.RDse ,'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl.rd, Ctl.RDse ,'Color',[0.5,0.5,0.5]);
axis([0, 100, 0.4, 0.8]);
% set(gcf, )
xlabel('Location','fontName','Times','fontSize',14);
ylabel('RD','fontName','Times','fontSize',14);
title('R-Optic Radiation across groups','fontName','Times','fontSize',14);

hold off;

%% save the figure in .eps

print(gcf,'-depsc','R-OR_RD_group_comaprison_6LHON_5CRD_8Ctl.eps');


%% RD group comparison across 6LHON, 4JMD, and 8Control

figure; hold on;

% JMD9mean   = plot(X,JMD.fa,'Color',c(1,:),'Linewidth',2);
congMDmean = plot(X,congMD.fa,'Color',c(2,:),'Linewidth',2);
% CRDmean    = plot(X,CRD.fa,'Color',c(3,:),'Linewidth',2);
LHONmean   = plot(X,LHON.fa,'Color',c(4,:),'Linewidth',2);
Ctlmean    = plot(X,Ctl.fa,'Color',[0.5,0.5,0.5],'Linewidth',2);




legend('congMDmean','LHONmean','Ctlmean');

% JMDerror    = errorbar(X, JMD.fa,JMD.FAse ,'Color',c(1,:));
congMDerror = errorbar(X, congMD.fa,congMD.FAse ,'Color',c(2,:));
% CRDerror    = errorbar(X, CRD.fa, CRD.FAse ,'Color',c(3,:));
LHONerror   = errorbar(X, LHON.fa, LHON.FAse ,'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl.fa, Ctl.FAse ,'Color',[0.5,0.5,0.5]);
axis([0,100,0.25,0.65]);
% set(gcf, )
xlabel('Location','fontName','Times','fontSize',14);
ylabel('FA','fontName','Times','fontSize',14);
title('R-Optic Radiation across groups','fontName','Times','fontSize',14);

hold off;

%% save the figure in .eps
% Figure を 1024x768 のeps形式で
% "fig.eps" に保存する例
width  = 512;
height =384;
set(gcf,'PaperPositionMode','auto')
pos=get(gcf,'Position');
pos(3)=width-1; %なぜか幅が1px増えるので対処
pos(4)=height;
set(gcf,'Position',pos);
print('-r0','-depsc','R-OR_FA_group_comaprison_6LHON_5CRD_4JMD_8Ctl.eps');


%% group comparison across LHON, JMD, CRD, and Control

figure; hold on;
X = 50:85;

% JMD9mean = plot(X,JMD.fa(50:85),'Color',c(1,:),'Linewidth',2);
congMDmean = plot(X,congMD.fa(50:85),'Color',c(2,:),'Linewidth',2);
CRDmean = plot(X,CRD.fa(50:85),'Color',c(3,:),'Linewidth',2);
LHONmean = plot(X,LHON.fa(50:85),'Color',c(4,:),'Linewidth',2);
Ctlmean = plot(X,Ctl.fa(50:85),'Color',[0.5,0.5,0.5],'Linewidth',2);
legend('congMDmean','CRDmean','LHONmean','Ctlmean');

% JMDerror    = errorbar(X, JMD.fa(50:85),JMD.FAse(50:85) ,'Color',c(1,:));
congMDerror = errorbar(X, congMD.fa(50:85),congMD.FAse(50:85) ,'Color',c(2,:));
CRDerror    = errorbar(X, CRD.fa(50:85), CRD.FAse(50:85) ,'Color',c(3,:));
LHONerror   = errorbar(X, LHON.fa(50:85), LHON.FAse(50:85) ,'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl.fa(50:85), Ctl.FAse(50:85) ,'Color',[0.5,0.5,0.5]);

axis([50,85,0.35,0.65]);
xlabel('Location','fontName','Times','fontSize',14);
ylabel('FA','fontName','Times','fontSize',14);
title('R-Optic Radiation across groups','fontName','Times','fontSize',14);


% set(gcf, )
hold off;

%% save the figure in .eps
% Figure を 1024x768 のeps形式で
% "fig.eps" に保存する例
width  = 512;
height =384;
set(gcf,'PaperPositionMode','auto')
pos=get(gcf,'Position');
pos(3)=width-1; %なぜか幅が1px増えるので対処
pos(4)=height;
set(gcf,'Position',pos);
print('-r0','-depsc','R-OR_FA_group_partial_6LHON_5CRD_4JMD_8Ctl.eps');

return

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% L_OR indivisual
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% all 9 JMD

% JMD
JMD.fa = nansum(afq.vals.fa{22}(1:9,:),1)/9;
JMD.md = nansum(afq.vals.md{22}(1:9,:),1)/9;
JMD.ad = nansum(afq.vals.ad{22}(1:9,:),1)/9;
JMD.rd = nansum(afq.vals.rd{22}(1:9,:),1)/9;
% se
JMD.FAse = nanstd(afq.vals.fa{22}(1:9,:),1)/sqrt(9);
JMD.MDse = nanstd(afq.vals.md{22}(1:9,:),1)/sqrt(9);
JMD.ADse = nanstd(afq.vals.ad{22}(1:9,:),1)/sqrt(9);
JMD.RDse = nanstd(afq.vals.rd{22}(1:9,:),1)/sqrt(9);

% congenital MD
congMD.fa = nansum(afq.vals.fa{22}(1:4,:),1)/4;
congMD.md = nansum(afq.vals.md{22}(1:4,:),1)/4;
congMD.ad = nansum(afq.vals.ad{22}(1:4,:),1)/4;
congMD.rd = nansum(afq.vals.rd{22}(1:4,:),1)/4;

% se
congMD.FAse = nanstd(afq.vals.fa{22}(1:4,:),1)/sqrt(4);
congMD.MDse = nanstd(afq.vals.md{22}(1:4,:),1)/sqrt(4);
congMD.ADse = nanstd(afq.vals.ad{22}(1:4,:),1)/sqrt(4);
congMD.RDse = nanstd(afq.vals.rd{22}(1:4,:),1)/sqrt(4);

% CRD
CRD.fa = nansum(afq.vals.fa{22}(5:9,:),1)/5;
CRD.md = nansum(afq.vals.md{22}(5:9,:),1)/5;
CRD.ad = nansum(afq.vals.ad{22}(5:9,:),1)/5;
CRD.rd = nansum(afq.vals.rd{22}(5:9,:),1)/5;
% se
CRD.FAse = nanstd(afq.vals.fa{22}(5:9,:),1)/sqrt(5);
CRD.MDse = nanstd(afq.vals.md{22}(5:9,:),1)/sqrt(5);
CRD.ADse = nanstd(afq.vals.ad{22}(5:9,:),1)/sqrt(5);
CRD.RDse = nanstd(afq.vals.rd{22}(5:9,:),1)/sqrt(5);

% LHON
LHON.fa = nansum(afq.vals.fa{22}(10:15,:),1)/6;
LHON.md = nansum(afq.vals.md{22}(10:15,:),1)/6;
LHON.ad = nansum(afq.vals.ad{22}(10:15,:),1)/6;
LHON.rd = nansum(afq.vals.rd{22}(10:15,:),1)/6;
% se
LHON.FAse = nanstd(afq.vals.fa{22}(10:15,:),1)/sqrt(6);
LHON.MDse = nanstd(afq.vals.md{22}(10:15,:),1)/sqrt(6);
LHON.ADse = nanstd(afq.vals.ad{22}(10:15,:),1)/sqrt(6);
LHON.RDse = nanstd(afq.vals.rd{22}(10:15,:),1)/sqrt(6);

% control
Ctl.fa = nansum(afq.vals.fa{22}(16:23,:),1)/8;
Ctl.md = nansum(afq.vals.md{22}(16:23,:),1)/8;
Ctl.ad = nansum(afq.vals.ad{22}(16:23,:),1)/8;
Ctl.rd = nansum(afq.vals.rd{22}(16:23,:),1)/8;
% se
Ctl.FAse = nanstd(afq.vals.fa{22}(16:23,:),1)/sqrt(8);
Ctl.MDse = nanstd(afq.vals.md{22}(16:23,:),1)/sqrt(8);
Ctl.ADse = nanstd(afq.vals.ad{22}(16:23,:),1)/sqrt(8);
Ctl.RDse = nanstd(afq.vals.rd{22}(16:23,:),1)/sqrt(8);

%% plot JMDindividual
c= lines(24);
figure; hold on;

for i = 1:9;
    X = 1:100;
    Y = afq.vals.fa{22}(i,:);
    plot(X,Y,'Color',c(i,:))
end

JMDmean = plot(X,JMD.fa);
set(JMDmean,'Linewidth',2, 'Color',c(24,:));


% legend('JMD', 'LHON', 'Ctl');
xlabel('Location','fontName','Times','fontSize',14);
ylabel('FA','fontName','Times','fontSize',14);
title('L-Optic Radiation all_9JMD','fontName','Times','fontSize',14);
hold off;

%% congenitalMD 1:4
c= lines(24);
figure; hold on;
for i = 1:4;
    X = 1:100;
    Y = afq.vals.fa{22}(i,:);
    plot(X,Y,'Color',c(i,:))
end


congMDmean = plot(X,congMD.fa);
set(congMDmean,'Linewidth',2, 'Color',c(24,:));

% legend('JMD', 'LHON', 'Ctl');
xlabel('Location','fontName','Times','fontSize',14);
ylabel('FA','fontName','Times','fontSize',14);
title('L-Optic Radiation congenitalMD 1:4','fontName','Times','fontSize',14);
hold off;

%% CRD 5:9
c= lines(24);
figure; hold on;
for i = 5:9;
    X = 1:100;
    Y = afq.vals.fa{22}(i,:);
    plot(X,Y,'Color',c(i,:))
end

CRDmean = plot(X,CRD.fa);
set(CRDmean,'Linewidth',2, 'Color',c(24,:));

% legend('JMD', 'LHON', 'Ctl');
xlabel('Location','fontName','Times','fontSize',14);
ylabel('FA','fontName','Times','fontSize',14);
title('L-Optic Radiation CRD','fontName','Times','fontSize',14);
hold off;


%% LHON

c= lines(24);
figure; hold on;
for i = 10:15;
    X = 1:100;
    Y = afq.vals.fa{22}(i,:);
    plot(X,Y,'Color',c(i,:))
end

LHONmean = plot(X,LHON.fa);
set(LHONmean,'Linewidth',2, 'Color',c(24,:));

% legend('JMD', 'LHON', 'Ctl');
xlabel('Location','fontName','Times','fontSize',14);
ylabel('FA','fontName','Times','fontSize',14);
title('L-Optic Radiation LHON','fontName','Times','fontSize',14);
hold off;

%% Control

c= lines(24);
figure; hold on;
for i = 16:23;
    X = 1:100;
    Y = afq.vals.fa{22}(i,:);
    plot(X,Y,'Color',c(i,:))
end

Ctlmean = plot(X,Ctl.fa);
set(Ctlmean,'Linewidth',2, 'Color',c(24,:));

% legend('JMD', 'LHON', 'Ctl');
xlabel('Location','fontName','Times','fontSize',14);
ylabel('FA','fontName','Times','fontSize',14);
title('L-Optic Radiation Control','fontName','Times','fontSize',14);
hold off;

% %% group comparison across 6LHON, 4JMD, 5CRD, and 8Control
%
% figure; hold on;
%
% JMD9mean   = plot(X,JMD.fa,'Color',c(1,:),'Linewidth',2);
% congMDmean = plot(X,congMD.fa,'Color',c(2,:),'Linewidth',2);
% CRDmean    = plot(X,CRD.fa,'Color',c(3,:),'Linewidth',2);
% LHONmean   = plot(X,LHON.fa,'Color',c(4,:),'Linewidth',2);
% Ctlmean    = plot(X,Ctl.fa,'Color',[0.5,0.5,0.5],'Linewidth',2);
%
%
%
%
% legend('JMD9mean','congMDmean','CRDmean','LHONmean','Ctlmean');
%
% JMDerror    = errorbar(X, JMD.fa,JMD.FAse ,'Color',c(1,:));
% congMDerror = errorbar(X, congMD.fa,congMD.FAse ,'Color',c(2,:));
% CRDerror    = errorbar(X, CRD.fa, CRD.FAse ,'Color',c(3,:));
% LHONerror   = errorbar(X, LHON.fa, LHON.FAse ,'Color',c(4,:));
% Ctlerror    = errorbar(X, Ctl.fa, Ctl.FAse ,'Color',[0.5,0.5,0.5]);
% axis([0,100,0.25,0.65]);
% % set(gcf, )
% xlabel('Location','fontName','Times','fontSize',14);
% ylabel('FA','fontName','Times','fontSize',14);
% title('L-Optic Radiation across groups','fontName','Times','fontSize',14);
%
% hold off;

%% FA 6LHON_5CRD_8Ctl group comparison across LHON, 5CRD, and Control

figure; hold on;

% JMD9mean   = plot(X,JMD.fa,'Color',c(1,:),'Linewidth',2);
% congMDmean = plot(X,congMD.fa,'Color',c(2,:),'Linewidth',2);
CRDmean    = plot(X,CRD.fa,'Color',c(3,:),'Linewidth',2);
LHONmean   = plot(X,LHON.fa,'Color',c(4,:),'Linewidth',2);
Ctlmean    = plot(X,Ctl.fa,'Color',[0.5,0.5,0.5],'Linewidth',2);

legend('CRDmean','LHONmean','Ctlmean');
legend('congenitalMD','CRD','Ctl');

% JMDerror    = errorbar(X, JMD.fa,JMD.FAse ,'Color',c(1,:));
% congMDerror = errorbar(X, congMD.fa,congMD.FAse ,'Color',c(2,:));
CRDerror    = errorbar(X, CRD.fa, CRD.FAse ,'Color',c(3,:));
LHONerror   = errorbar(X, LHON.fa, LHON.FAse ,'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl.fa, Ctl.FAse ,'Color',[0.5,0.5,0.5]);
axis([0,100,0.25,0.65]);
% set(gcf, )
xlabel('Location','fontName','Times','fontSize',14);
ylabel('FA','fontName','Times','fontSize',14);
title('L-Optic Radiation across groups','fontName','Times','fontSize',14);

hold off;

%% save the figure in .eps
% Figure を 1024x768 のeps形式で
% "fig.eps" に保存する例
width  = 512;
height =384;
set(gcf,'PaperPositionMode','auto')
pos=get(gcf,'Position');
pos(3)=width-1; %なぜか幅が1px増えるので対処
pos(4)=height;
set(gcf,'Position',pos);
% print('-r0','-depsc','L-OR_FA_group_comaprison_6LHON_5CRD_8Ctl.eps');
print('-r0','-depsc','L-OR_FA_group_comaprison_4cong_5CRD_8Ctl.eps');


%% MD 6LHON_5CRD_8Ctl group comparison across LHON, 5CRD, and Control

figure; hold on;

% JMD9mean   = plot(X,JMD.fa,'Color',c(1,:),'Linewidth',2);
% congMDmean = plot(X,congMD.fa,'Color',c(2,:),'Linewidth',2);
CRDmean    = plot(X,CRD.md,'Color',c(3,:),'Linewidth',2);
LHONmean   = plot(X,LHON.md,'Color',c(4,:),'Linewidth',2);
Ctlmean    = plot(X,Ctl.md,'Color',[0.5,0.5,0.5],'Linewidth',2);

legend('CRDmean','LHONmean','Ctlmean');

% JMDerror    = errorbar(X, JMD.fa,JMD.FAse ,'Color',c(1,:));
% congMDerror = errorbar(X, congMD.fa,congMD.FAse ,'Color',c(2,:));
CRDerror    = errorbar(X, CRD.md, CRD.MDse ,'Color',c(3,:));
LHONerror   = errorbar(X, LHON.md, LHON.MDse ,'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl.md, Ctl.MDse ,'Color',[0.5,0.5,0.5]);
axis([0, 100, 0.65, 1.1]);
% set(gcf, )
xlabel('Location','fontName','Times','fontSize',14);
ylabel('MD','fontName','Times','fontSize',14);
title('L-Optic Radiation across groups','fontName','Times','fontSize',14);

hold off;

%% save the figure in .eps
% Figure を 1024x768 のeps形式で
% "fig.eps" に保存する例
width  = 512;
height =384;
set(gcf,'PaperPositionMode','auto')
pos=get(gcf,'Position');
pos(3)=width-1; %なぜか幅が1px増えるので対処
pos(4)=height;
set(gcf,'Position',pos);
print('-r0','-depsc','L-OR_MD_group_comaprison_6LHON_5CRD_8Ctl.eps');

%% AD 6LHON_5CRD_8Ctl group comparison across LHON, 5CRD, and Control

figure; hold on;

% JMD9mean   = plot(X,JMD.fa,'Color',c(1,:),'Linewidth',2);
% congMDmean = plot(X,congMD.fa,'Color',c(2,:),'Linewidth',2);
CRDmean    = plot(X,CRD.ad,'Color',c(3,:),'Linewidth',2);
LHONmean   = plot(X,LHON.ad,'Color',c(4,:),'Linewidth',2);
Ctlmean    = plot(X,Ctl.ad,'Color',[0.5,0.5,0.5],'Linewidth',2);

legend('CRDmean','LHONmean','Ctlmean');

% JMDerror    = errorbar(X, JMD.fa,JMD.FAse ,'Color',c(1,:));
% congMDerror = errorbar(X, congMD.fa,congMD.FAse ,'Color',c(2,:));
CRDerror    = errorbar(X, CRD.ad, CRD.ADse ,'Color',c(3,:));
LHONerror   = errorbar(X, LHON.ad, LHON.ADse ,'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl.ad, Ctl.ADse ,'Color',[0.5,0.5,0.5]);
axis([0, 100, 0.9, 1.6]);
% set(gcf, )
xlabel('Location','fontName','Times','fontSize',14);
ylabel('AD','fontName','Times','fontSize',14);
title('L-Optic Radiation across groups','fontName','Times','fontSize',14);

hold off;

%% save the figure in .eps
% Figure を 1024x768 のeps形式で
% "fig.eps" に保存する例
width  = 512;
height =384;
set(gcf,'PaperPositionMode','auto')
pos=get(gcf,'Position');
pos(3)=width-1; %なぜか幅が1px増えるので対処
pos(4)=height;
set(gcf,'Position',pos);
print('-r0','-depsc','L-OR_AD_group_comaprison_6LHON_5CRD_8Ctl.eps');


%% RD 6LHON_5CRD_8Ctl group comparison across LHON, 5CRD, and Control

figure; hold on;

% JMD9mean   = plot(X,JMD.fa,'Color',c(1,:),'Linewidth',2);
% congMDmean = plot(X,congMD.fa,'Color',c(2,:),'Linewidth',2);
CRDmean    = plot(X,CRD.rd,'Color',c(3,:),'Linewidth',2);
LHONmean   = plot(X,LHON.rd,'Color',c(4,:),'Linewidth',2);
Ctlmean    = plot(X,Ctl.rd,'Color',[0.5,0.5,0.5],'Linewidth',2);

legend('CRDmean','LHONmean','Ctlmean');

% JMDerror    = errorbar(X, JMD.fa,JMD.FAse ,'Color',c(1,:));
% congMDerror = errorbar(X, congMD.fa,congMD.FAse ,'Color',c(2,:));
CRDerror    = errorbar(X, CRD.rd, CRD.RDse ,'Color',c(3,:));
LHONerror   = errorbar(X, LHON.rd, LHON.RDse ,'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl.rd, Ctl.RDse ,'Color',[0.5,0.5,0.5]);
axis([0, 100, 0.4, 0.86]);
% set(gcf, )
xlabel('Location','fontName','Times','fontSize',14);
ylabel('RD','fontName','Times','fontSize',14);
title('L-Optic Radiation across groups','fontName','Times','fontSize',14);

hold off;

%% save the figure in .eps
% Figure を 1024x768 のeps形式で
% "fig.eps" に保存する例
width  = 512;
height =384;
set(gcf,'PaperPositionMode','auto')
pos=get(gcf,'Position');
pos(3)=width-1; %なぜか幅が1px増えるので対処
pos(4)=height;
set(gcf,'Position',pos);
print('-r0','-depsc','L-OR_RD_group_comaprison_6LHON_5CRD_8Ctl.eps');


%% RD group comparison across 6LHON, 4JMD, and 8Control

figure; hold on;

% JMD9mean   = plot(X,JMD.fa,'Color',c(1,:),'Linewidth',2);
congMDmean = plot(X,congMD.fa,'Color',c(2,:),'Linewidth',2);
% CRDmean    = plot(X,CRD.fa,'Color',c(3,:),'Linewidth',2);
LHONmean   = plot(X,LHON.fa,'Color',c(4,:),'Linewidth',2);
Ctlmean    = plot(X,Ctl.fa,'Color',[0.5,0.5,0.5],'Linewidth',2);




legend('congMDmean','LHONmean','Ctlmean');

% JMDerror    = errorbar(X, JMD.fa,JMD.FAse ,'Color',c(1,:));
congMDerror = errorbar(X, congMD.fa,congMD.FAse ,'Color',c(2,:));
% CRDerror    = errorbar(X, CRD.fa, CRD.FAse ,'Color',c(3,:));
LHONerror   = errorbar(X, LHON.fa, LHON.FAse ,'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl.fa, Ctl.FAse ,'Color',[0.5,0.5,0.5]);
axis([0,100,0.25,0.65]);
% set(gcf, )
xlabel('Location','fontName','Times','fontSize',14);
ylabel('FA','fontName','Times','fontSize',14);
title('L-Optic Radiation across groups','fontName','Times','fontSize',14);

hold off;

%% save the figure in .eps
% Figure を 1024x768 のeps形式で
% "fig.eps" に保存する例
width  = 512;
height =384;
set(gcf,'PaperPositionMode','auto')
pos=get(gcf,'Position');
pos(3)=width-1; %なぜか幅が1px増えるので対処
pos(4)=height;
set(gcf,'Position',pos);
print('-r0','-depsc','L-OR_FA_group_comaprison_6LHON_5CRD_4JMD_8Ctl.eps');


%% group comparison across LHON, JMD, CRD, and Control

figure; hold on;
X = 50:85;

% JMD9mean = plot(X,JMD.fa(50:85),'Color',c(1,:),'Linewidth',2);
congMDmean = plot(X,congMD.fa(50:85),'Color',c(2,:),'Linewidth',2);
CRDmean = plot(X,CRD.fa(50:85),'Color',c(3,:),'Linewidth',2);
LHONmean = plot(X,LHON.fa(50:85),'Color',c(4,:),'Linewidth',2);
Ctlmean = plot(X,Ctl.fa(50:85),'Color',[0.5,0.5,0.5],'Linewidth',2);
legend('congMDmean','CRDmean','LHONmean','Ctlmean');

% JMDerror    = errorbar(X, JMD.fa(50:85),JMD.FAse(50:85) ,'Color',c(1,:));
congMDerror = errorbar(X, congMD.fa(50:85),congMD.FAse(50:85) ,'Color',c(2,:));
CRDerror    = errorbar(X, CRD.fa(50:85), CRD.FAse(50:85) ,'Color',c(3,:));
LHONerror   = errorbar(X, LHON.fa(50:85), LHON.FAse(50:85) ,'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl.fa(50:85), Ctl.FAse(50:85) ,'Color',[0.5,0.5,0.5]);

axis([50,85,0.35,0.65]);
xlabel('Location','fontName','Times','fontSize',14);
ylabel('FA','fontName','Times','fontSize',14);
title('L-Optic Radiation across groups','fontName','Times','fontSize',14);

% set(gcf, )
hold off;

%% save the figure in .eps
% Figure を 1024x768 のeps形式で
% "fig.eps" に保存する例
width  = 512;
height =384;
set(gcf,'PaperPositionMode','auto')
pos=get(gcf,'Position');
pos(3)=width-1; %なぜか幅が1px増えるので対処
pos(4)=height;
set(gcf,'Position',pos);
print('-r0','-depsc','L-OR_FA_group_partial_6LHON_5CRD_4JMD_8Ctl.eps');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% R_OT indivisual
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% all 9 JMD
c= lines(24);
figure; hold on;

for i = 1:9;
    X = 1:100;
    Y = afq.vals.fa{24}(i,:);
    plot(X,Y,'Color',c(i,:))
end

JMD.fa = nansum(afq.vals.fa{24}(1:9,:),1)/8;
JMD.md = nansum(afq.vals.md{24}(1:9,:),1)/8;
JMD.ad = nansum(afq.vals.ad{24}(1:9,:),1)/8;
JMD.rd = nansum(afq.vals.rd{24}(1:9,:),1)/8;
% se
JMD.FAse = nanstd(afq.vals.fa{24}(1:9,:),1)/sqrt(8);
JMD.MDse = nanstd(afq.vals.md{24}(1:9,:),1)/sqrt(8);
JMD.ADse = nanstd(afq.vals.ad{24}(1:9,:),1)/sqrt(8);
JMD.RDse = nanstd(afq.vals.rd{24}(1:9,:),1)/sqrt(8);


JMDmean = plot(X,JMD.fa);
set(JMDmean,'Linewidth',2, 'Color',c(24,:));


% legend('JMD', 'LHON', 'Ctl');
xlabel('Location','fontName','Times','fontSize',14);
ylabel('FA','fontName','Times','fontSize',14);
title('R-Optic Tract all_9JMD','fontName','Times','fontSize',14);
hold off;

%% congenitalMD 1:4
c= lines(24);
figure; hold on;
for i = 1:4;
    X = 1:100;
    Y = afq.vals.fa{24}(i,:);
    plot(X,Y,'Color',c(i,:))
end

congMD.fa = nansum(afq.vals.fa{24}(1:4,:),1)/4;
congMD.md = nansum(afq.vals.md{24}(1:4,:),1)/4;
congMD.ad = nansum(afq.vals.ad{24}(1:4,:),1)/4;
congMD.rd = nansum(afq.vals.rd{24}(1:4,:),1)/4;

% se
congMD.FAse = nanstd(afq.vals.fa{24}(1:4,:),1)/sqrt(4);
congMD.MDse = nanstd(afq.vals.md{24}(1:4,:),1)/sqrt(4);
congMD.ADse = nanstd(afq.vals.ad{24}(1:4,:),1)/sqrt(4);
congMD.RDse = nanstd(afq.vals.rd{24}(1:4,:),1)/sqrt(4);

congMDmean = plot(X,congMD.fa);
set(congMDmean,'Linewidth',2, 'Color',c(24,:));

% legend('JMD', 'LHON', 'Ctl');
xlabel('Location','fontName','Times','fontSize',14);
ylabel('FA','fontName','Times','fontSize',14);
title('R-Optic Tract congenitalMD 1:4','fontName','Times','fontSize',14);
hold off;

%% CRD 5:9
c= lines(24);
figure; hold on;
for i = 5:9;
    X = 1:100;
    Y = afq.vals.fa{24}(i,:);
    plot(X,Y,'Color',c(i,:))
end

CRD.fa = nansum(afq.vals.fa{24}(5:9,:),1)/4;
CRD.md = nansum(afq.vals.md{24}(5:9,:),1)/4;
CRD.ad = nansum(afq.vals.ad{24}(5:9,:),1)/4;
CRD.rd = nansum(afq.vals.rd{24}(5:9,:),1)/4;

CRDmean = plot(X,CRD.fa);
set(CRDmean,'Linewidth',2, 'Color',c(24,:));

% se
CRD.FAse = nanstd(afq.vals.fa{24}(5:9,:),1)/sqrt(4);
CRD.MDse = nanstd(afq.vals.md{24}(5:9,:),1)/sqrt(4);
CRD.ADse = nanstd(afq.vals.ad{24}(5:9,:),1)/sqrt(4);
CRD.RDse = nanstd(afq.vals.rd{24}(5:9,:),1)/sqrt(4);



%% save the figure in .eps
% Figure を 1024x768 のeps形式で
% "fig.eps"
width  = 512;
height =384;
set(gcf,'PaperPositionMode','auto')
pos=get(gcf,'Position');
pos(3)=width-1; %
pos(4)=height;
set(gcf,'Position',pos);
print('-r0','-depsc','R-OT_AD_group_comaprison_6LHON_5CRD_8Ctl.eps');


%% LHON

c= lines(24);
figure; hold on;
for i = 10:15;
    X = 1:100;
    Y = afq.vals.fa{24}(i,:);
    plot(X,Y,'Color',c(i,:))
end

LHON.fa = nansum(afq.vals.fa{24}(10:15,:),1)/6;
LHON.md = nansum(afq.vals.md{24}(10:15,:),1)/6;
LHON.ad = nansum(afq.vals.ad{24}(10:15,:),1)/6;
LHON.rd = nansum(afq.vals.rd{24}(10:15,:),1)/6;

LHONmean = plot(X,LHON.fa);
set(LHONmean,'Linewidth',2, 'Color',c(24,:));

% se
LHON.FAse = nanstd(afq.vals.fa{24}(10:15,:),1)/sqrt(6);
LHON.MDse = nanstd(afq.vals.md{24}(10:15,:),1)/sqrt(6);
LHON.ADse = nanstd(afq.vals.ad{24}(10:15,:),1)/sqrt(6);
LHON.RDse = nanstd(afq.vals.rd{24}(10:15,:),1)/sqrt(6);

% legend('JMD', 'LHON', 'Ctl');
xlabel('Location','fontName','Times','fontSize',14);
ylabel('FA','fontName','Times','fontSize',14);
title('R-Optic Tract LHON','fontName','Times','fontSize',14);
hold off;

%% Control

c= lines(24);
figure; hold on;
for i = 16:23;
    X = 1:100;
    Y = afq.vals.fa{24}(i,:);
    plot(X,Y,'Color',c(i,:))
end

Ctl.fa = nansum(afq.vals.fa{24}(16:23,:),1)/8;
Ctl.md = nansum(afq.vals.md{24}(16:23,:),1)/8;
Ctl.ad = nansum(afq.vals.ad{24}(16:23,:),1)/8;
Ctl.rd = nansum(afq.vals.rd{24}(16:23,:),1)/8;

Ctlmean = plot(X,Ctl.fa);
set(Ctlmean,'Linewidth',2, 'Color',c(24,:));

% se
Ctl.FAse = nanstd(afq.vals.fa{24}(16:23,:),1)/sqrt(8);
Ctl.MDse = nanstd(afq.vals.md{24}(16:23,:),1)/sqrt(8);
Ctl.ADse = nanstd(afq.vals.ad{24}(16:23,:),1)/sqrt(8);
Ctl.RDse = nanstd(afq.vals.rd{24}(16:23,:),1)/sqrt(8);

% legend('JMD', 'LHON', 'Ctl');
xlabel('Location','fontName','Times','fontSize',14);
ylabel('FA','fontName','Times','fontSize',14);
title('R-Optic Tract Control','fontName','Times','fontSize',14);
hold off;

% %% group comparison across 6LHON, 4JMD, 5CRD, and 8Control
%
% figure; hold on;
%
% JMD9mean   = plot(X,JMD.fa,'Color',c(1,:),'Linewidth',2);
% congMDmean = plot(X,congMD.fa,'Color',c(2,:),'Linewidth',2);
% CRDmean    = plot(X,CRD.fa,'Color',c(3,:),'Linewidth',2);
% LHONmean   = plot(X,LHON.fa,'Color',c(4,:),'Linewidth',2);
% Ctlmean    = plot(X,Ctl.fa,'Color',[0.5,0.5,0.5],'Linewidth',2);
%
%
%
%
% legend('JMD9mean','congMDmean','CRDmean','LHONmean','Ctlmean');
%
% JMDerror    = errorbar(X, JMD.fa,JMD.FAse ,'Color',c(1,:));
% congMDerror = errorbar(X, congMD.fa,congMD.FAse ,'Color',c(2,:));
% CRDerror    = errorbar(X, CRD.fa, CRD.FAse ,'Color',c(3,:));
% LHONerror   = errorbar(X, LHON.fa, LHON.FAse ,'Color',c(4,:));
% Ctlerror    = errorbar(X, Ctl.fa, Ctl.FAse ,'Color',[0.5,0.5,0.5]);
% axis([0,100,0.25,0.65]);
% % set(gcf, )
% xlabel('Location','fontName','Times','fontSize',14);
% ylabel('FA','fontName','Times','fontSize',14);
% title('R-Optic Tract across groups','fontName','Times','fontSize',14);
%
% hold off;

%% FA 6LHON_5CRD_8Ctl group comparison across LHON, 5CRD, and Control

figure; hold on;

% JMD9mean   = plot(X,JMD.fa,'Color',c(1,:),'Linewidth',2);
% congMDmean = plot(X,congMD.fa,'Color',c(2,:),'Linewidth',2);
CRDmean    = plot(X,CRD.fa,'Color',c(3,:),'Linewidth',2);
LHONmean   = plot(X,LHON.fa,'Color',c(4,:),'Linewidth',2);
Ctlmean    = plot(X,Ctl.fa,'Color',[0.5,0.5,0.5],'Linewidth',2);

legend('CRDmean','LHONmean','Ctlmean');

% JMDerror    = errorbar(X, JMD.fa,JMD.FAse ,'Color',c(1,:));
% congMDerror = errorbar(X, congMD.fa,congMD.FAse ,'Color',c(2,:));
CRDerror    = errorbar(X, CRD.fa, CRD.FAse ,'Color',c(3,:));
LHONerror   = errorbar(X, LHON.fa, LHON.FAse ,'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl.fa, Ctl.FAse ,'Color',[0.5,0.5,0.5]);
axis([0, 100, 0.1,0.60]);
% set(gcf, )
xlabel('Location','fontName','Times','fontSize',14);
ylabel('FA','fontName','Times','fontSize',14);
title('R-Optic Tract across groups','fontName','Times','fontSize',14);

hold off;

%% save the figure in .eps
% Figure を 1024x768 のeps形式で
% "fig.eps" に保存する例
width  = 512;
height =384;
set(gcf,'PaperPositionMode','auto')
pos=get(gcf,'Position');
pos(3)=width-1; %なぜか幅が1px増えるので対処
pos(4)=height;
set(gcf,'Position',pos);
print('-r0','-depsc','R-OT_FA_group_comaprison_6LHON_5CRD_8Ctl.eps');

%% MD 6LHON_5CRD_8Ctl group comparison across LHON, 5CRD, and Control

figure; hold on;

% JMD9mean   = plot(X,JMD.fa,'Color',c(1,:),'Linewidth',2);
% congMDmean = plot(X,congMD.fa,'Color',c(2,:),'Linewidth',2);
CRDmean    = plot(X,CRD.md,'Color',c(3,:),'Linewidth',2);
LHONmean   = plot(X,LHON.md,'Color',c(4,:),'Linewidth',2);
Ctlmean    = plot(X,Ctl.md,'Color',[0.5,0.5,0.5],'Linewidth',2);

legend('CRDmean','LHONmean','Ctlmean');

% JMDerror    = errorbar(X, JMD.fa,JMD.FAse ,'Color',c(1,:));
% congMDerror = errorbar(X, congMD.fa,congMD.FAse ,'Color',c(2,:));
CRDerror    = errorbar(X, CRD.md, CRD.MDse ,'Color',c(3,:));
LHONerror   = errorbar(X, LHON.md, LHON.MDse ,'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl.md, Ctl.MDse ,'Color',[0.5,0.5,0.5]);
axis([0, 100, 0.70, 1.6]);
% set(gcf, )
xlabel('Location','fontName','Times','fontSize',14);
ylabel('MD','fontName','Times','fontSize',14);
title('R-Optic Tract across groups','fontName','Times','fontSize',14);

hold off;

%% save the figure in .eps
% Figure を 1024x768 のeps形式で
% "fig.eps" に保存する例
width  = 512;
height =384;
set(gcf,'PaperPositionMode','auto')
pos=get(gcf,'Position');
pos(3)=width-1; %なぜか幅が1px増えるので対処
pos(4)=height;
set(gcf,'Position',pos);
print('-r0','-depsc','R-OT_MD_group_comaprison_6LHON_5CRD_8Ctl.eps');

%% AD 6LHON_5CRD_8Ctl group comparison across LHON, 5CRD, and Control

figure; hold on;

% JMD9mean   = plot(X,JMD.fa,'Color',c(1,:),'Linewidth',2);
% congMDmean = plot(X,congMD.fa,'Color',c(2,:),'Linewidth',2);
CRDmean    = plot(X,CRD.ad,'Color',c(3,:),'Linewidth',2);
LHONmean   = plot(X,LHON.ad,'Color',c(4,:),'Linewidth',2);
Ctlmean    = plot(X,Ctl.ad,'Color',[0.5,0.5,0.5],'Linewidth',2);

legend('CRDmean','LHONmean','Ctlmean');

% JMDerror    = errorbar(X, JMD.fa,JMD.FAse ,'Color',c(1,:));
% congMDerror = errorbar(X, congMD.fa,congMD.FAse ,'Color',c(2,:));
CRDerror    = errorbar(X, CRD.ad, CRD.ADse ,'Color',c(3,:));
LHONerror   = errorbar(X, LHON.ad, LHON.ADse ,'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl.ad, Ctl.ADse ,'Color',[0.5,0.5,0.5]);
axis([0, 100, 1.1, 1.81]);
% set(gcf, )
xlabel('Location','fontName','Times','fontSize',14);
ylabel('AD','fontName','Times','fontSize',14);
title('R-Optic Tract across groups','fontName','Times','fontSize',14);

hold off;

%% save the figure in .eps
% Figure を 1024x768 のeps形式で
% "fig.eps" に保存する例
width  = 512;
height =384;
set(gcf,'PaperPositionMode','auto')
pos=get(gcf,'Position');
pos(3)=width-1; %なぜか幅が1px増えるので対処
pos(4)=height;
set(gcf,'Position',pos);
print('-r0','-depsc','R-OT_AD_group_comaprison_6LHON_5CRD_8Ctl.eps');


%% RD 6LHON_5CRD_8Ctl group comparison across LHON, 5CRD, and Control

figure; hold on;

% JMD9mean   = plot(X,JMD.fa,'Color',c(1,:),'Linewidth',2);
% congMDmean = plot(X,congMD.fa,'Color',c(2,:),'Linewidth',2);
CRDmean    = plot(X,CRD.rd,'Color',c(3,:),'Linewidth',2);
LHONmean   = plot(X,LHON.rd,'Color',c(4,:),'Linewidth',2);
Ctlmean    = plot(X,Ctl.rd,'Color',[0.5,0.5,0.5],'Linewidth',2);

legend('CRDmean','LHONmean','Ctlmean');

% JMDerror    = errorbar(X, JMD.fa,JMD.FAse ,'Color',c(1,:));
% congMDerror = errorbar(X, congMD.fa,congMD.FAse ,'Color',c(2,:));
CRDerror    = errorbar(X, CRD.rd, CRD.RDse ,'Color',c(3,:));
LHONerror   = errorbar(X, LHON.rd, LHON.RDse ,'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl.rd, Ctl.RDse ,'Color',[0.5,0.5,0.5]);
axis([0, 100, 0.4, 1.6]);
% set(gcf, )
xlabel('Location','fontName','Times','fontSize',14);
ylabel('RD','fontName','Times','fontSize',14);
title('R-Optic Tract across groups','fontName','Times','fontSize',14);

hold off;

%% save the figure in .eps
% Figure を 1024x768 のeps形式で
% "fig.eps" に保存する例
width  = 512;
height =384;
set(gcf,'PaperPositionMode','auto')
pos=get(gcf,'Position');
pos(3)=width-1; %なぜか幅が1px増えるので対処
pos(4)=height;
set(gcf,'Position',pos);
print('-r0','-depsc','R-OT_RD_group_comaprison_6LHON_5CRD_8Ctl.eps');


%% RD group comparison across 6LHON, 4JMD, and 8Control

figure; hold on;

% JMD9mean   = plot(X,JMD.fa,'Color',c(1,:),'Linewidth',2);
congMDmean = plot(X,congMD.fa,'Color',c(2,:),'Linewidth',2);
% CRDmean    = plot(X,CRD.fa,'Color',c(3,:),'Linewidth',2);
LHONmean   = plot(X,LHON.fa,'Color',c(4,:),'Linewidth',2);
Ctlmean    = plot(X,Ctl.fa,'Color',[0.5,0.5,0.5],'Linewidth',2);

legend('congMDmean','LHONmean','Ctlmean');

% JMDerror    = errorbar(X, JMD.fa,JMD.FAse ,'Color',c(1,:));
congMDerror = errorbar(X, congMD.fa,congMD.FAse ,'Color',c(2,:));
% CRDerror    = errorbar(X, CRD.fa, CRD.FAse ,'Color',c(3,:));
LHONerror   = errorbar(X, LHON.fa, LHON.FAse ,'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl.fa, Ctl.FAse ,'Color',[0.5,0.5,0.5]);
axis([0,100,0.1,0.6]);
% set(gcf, )
xlabel('Location','fontName','Times','fontSize',14);
ylabel('FA','fontName','Times','fontSize',14);
title('R-Optic Tract across groups','fontName','Times','fontSize',14);

hold off;

%% save the figure in .eps
% Figure を 1024x768 のeps形式で
% "fig.eps" に保存する例
width  = 512;
height =384;
set(gcf,'PaperPositionMode','auto')
pos=get(gcf,'Position');
pos(3)=width-1; %なぜか幅が1px増えるので対処
pos(4)=height;
set(gcf,'Position',pos);
print('-r0','-depsc','R-OT_FA_group_comaprison_6LHON_5CRD_4JMD_8Ctl.eps');


%% group comparison across LHON, JMD, CRD, and Control

figure; hold on;
X = 50:85;

% JMD9mean = plot(X,JMD.fa(50:85),'Color',c(1,:),'Linewidth',2);
congMDmean = plot(X,congMD.fa(50:85),'Color',c(2,:),'Linewidth',2);
CRDmean = plot(X,CRD.fa(50:85),'Color',c(3,:),'Linewidth',2);
LHONmean = plot(X,LHON.fa(50:85),'Color',c(4,:),'Linewidth',2);
Ctlmean = plot(X,Ctl.fa(50:85),'Color',[0.5,0.5,0.5],'Linewidth',2);
legend('congMDmean','CRDmean','LHONmean','Ctlmean');

% JMDerror    = errorbar(X, JMD.fa(50:85),JMD.FAse(50:85) ,'Color',c(1,:));
congMDerror = errorbar(X, congMD.fa(50:85),congMD.FAse(50:85) ,'Color',c(2,:));
CRDerror    = errorbar(X, CRD.fa(50:85), CRD.FAse(50:85) ,'Color',c(3,:));
LHONerror   = errorbar(X, LHON.fa(50:85), LHON.FAse(50:85) ,'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl.fa(50:85), Ctl.FAse(50:85) ,'Color',[0.5,0.5,0.5]);

axis([50,85,0.1,0.65]);
xlabel('Location','fontName','Times','fontSize',14);
ylabel('FA','fontName','Times','fontSize',14);
title('R-Optic Tract across groups','fontName','Times','fontSize',14);

% set(gcf, )
hold off;

%% save the figure in .eps
% Figure を 1024x768 のeps形式で
% "fig.eps" に保存する例
width  = 512;
height =384;
set(gcf,'PaperPositionMode','auto')
pos=get(gcf,'Position');
pos(3)=width-1; %なぜか幅が1px増えるので対処
pos(4)=height;
set(gcf,'Position',pos);
print('-r0','-depsc','R-OT_FA_group_partial_6LHON_5CRD_4JMD_8Ctl.eps');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% L_OT Tract indivisual
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% all 9 JMD
c= lines(24);
figure; hold on;

for i = 1:9;
    X = 1:100;
    Y = afq.vals.fa{25}(i,:);
    plot(X,Y,'Color',c(i,:))
end

JMD.fa = nansum(afq.vals.fa{25}(1:9,:),1)/9;
JMD.md = nansum(afq.vals.md{25}(1:9,:),1)/9;
JMD.ad = nansum(afq.vals.ad{25}(1:9,:),1)/9;
JMD.rd = nansum(afq.vals.rd{25}(1:9,:),1)/9;
% se
JMD.FAse = nanstd(afq.vals.fa{25}(1:9,:),1)/sqrt(9);
JMD.MDse = nanstd(afq.vals.md{25}(1:9,:),1)/sqrt(9);
JMD.ADse = nanstd(afq.vals.ad{25}(1:9,:),1)/sqrt(9);
JMD.RDse = nanstd(afq.vals.rd{25}(1:9,:),1)/sqrt(9);


JMD9mean = plot(X,JMD.fa);
set(JMD9mean,'Linewidth',2, 'Color',c(24,:));


% legend('JMD', 'LHON', 'Ctl');
xlabel('Location','fontName','Times','fontSize',14);
ylabel('FA','fontName','Times','fontSize',14);
title('L-Optic Tract all_9JMD','fontName','Times','fontSize',14);
hold off;

%% congenitalMD 1:4
c= lines(24);
figure; hold on;
for i = 1:4;
    X = 1:100;
    Y = afq.vals.fa{25}(i,:);
    plot(X,Y,'Color',c(i,:))
end

congMD.fa = nansum(afq.vals.fa{25}(1:4,:),1)/4;
congMD.md = nansum(afq.vals.md{25}(1:4,:),1)/4;
congMD.ad = nansum(afq.vals.ad{25}(1:4,:),1)/4;
congMD.rd = nansum(afq.vals.rd{25}(1:4,:),1)/4;

% se
congMD.FAse = nanstd(afq.vals.fa{25}(1:4,:),1)/sqrt(4);
congMD.MDse = nanstd(afq.vals.md{25}(1:4,:),1)/sqrt(4);
congMD.ADse = nanstd(afq.vals.ad{25}(1:4,:),1)/sqrt(4);
congMD.RDse = nanstd(afq.vals.rd{25}(1:4,:),1)/sqrt(4);

congMDmean = plot(X,congMD.fa);
set(congMDmean,'Linewidth',2, 'Color',c(24,:));

% legend('JMD', 'LHON', 'Ctl');
xlabel('Location','fontName','Times','fontSize',14);
ylabel('FA','fontName','Times','fontSize',14);
title('L-Optic Tract congenitalMD 1:4','fontName','Times','fontSize',14);
hold off;

%% CRD 5:9
c= lines(24);
figure; hold on;
for i = 5:9;
    X = 1:100;
    Y = afq.vals.fa{25}(i,:);
    plot(X,Y,'Color',c(i,:))
end

CRD.fa = nansum(afq.vals.fa{25}(5:9,:),1)/5;
CRD.md = nansum(afq.vals.md{25}(5:9,:),1)/5;
CRD.ad = nansum(afq.vals.ad{25}(5:9,:),1)/5;
CRD.rd = nansum(afq.vals.rd{25}(5:9,:),1)/5;

CRDmean = plot(X,CRD.fa);
set(CRDmean,'Linewidth',2, 'Color',c(24,:));

% se
CRD.FAse = nanstd(afq.vals.fa{25}(5:9,:),1)/sqrt(5);
CRD.MDse = nanstd(afq.vals.md{25}(5:9,:),1)/sqrt(5);% save the figure in .eps
% Figure を 1024x768 のeps形式で
% "fig.eps" に保存する例
width  = 512;
height =384;
set(gcf,'PaperPositionMode','auto')
pos=get(gcf,'Position');
pos(3)=width-1; %なぜか幅が1px増えるので対処
pos(4)=height;
set(gcf,'Position',pos);
print('-r0','-depsc','L-OR_AD_group_comaprison_6LHON_5CRD_8Ctl.eps');
CRD.ADse = nanstd(afq.vals.ad{25}(5:9,:),1)/sqrt(5);
CRD.RDse = nanstd(afq.vals.rd{25}(5:9,:),1)/sqrt(5);



% legend('JMD', 'LHON', 'Ctl');
xlabel('Location','fontName','Times','fontSize',14);
ylabel('FA','fontName','Times','fontSize',14);
title('L-Optic Tract CRD','fontName','Times','fontSize',14);
hold off;


%% LHON

c= lines(24);
figure; hold on;
for i = 10:15;
    X = 1:100;
    Y = afq.vals.fa{25}(i,:);
    plot(X,Y,'Color',c(i,:))
end

LHON.fa = nansum(afq.vals.fa{25}(10:15,:),1)/6;
LHON.md = nansum(afq.vals.md{25}(10:15,:),1)/6;
LHON.ad = nansum(afq.vals.ad{25}(10:15,:),1)/6;
LHON.rd = nansum(afq.vals.rd{25}(10:15,:),1)/6;

LHONmean = plot(X,LHON.fa);
set(LHONmean,'Linewidth',2, 'Color',c(24,:));

% se
LHON.FAse = nanstd(afq.vals.fa{25}(10:15,:),1)/sqrt(6);
LHON.MDse = nanstd(afq.vals.md{25}(10:15,:),1)/sqrt(6);
LHON.ADse = nanstd(afq.vals.ad{25}(10:15,:),1)/sqrt(6);
LHON.RDse = nanstd(afq.vals.rd{25}(10:15,:),1)/sqrt(6);

% legend('JMD', 'LHON', 'Ctl');
xlabel('Location','fontName','Times','fontSize',14);
ylabel('FA','fontName','Times','fontSize',14);
title('L-Optic Tract LHON','fontName','Times','fontSize',14);
hold off;

%% Control

c= lines(24);
figure; hold on;
for i = 16:23;
    X = 1:100;
    Y = afq.vals.fa{25}(i,:);
    plot(X,Y,'Color',c(i,:))
end

Ctl.fa = nansum(afq.vals.fa{25}(16:23,:),1)/8;
Ctl.md = nansum(afq.vals.md{25}(16:23,:),1)/8;
Ctl.ad = nansum(afq.vals.ad{25}(16:23,:),1)/8;
Ctl.rd = nansum(afq.vals.rd{25}(16:23,:),1)/8;

Ctlmean = plot(X,Ctl.fa);
set(Ctlmean,'Linewidth',2, 'Color',c(24,:));

% se
Ctl.FAse = nanstd(afq.vals.fa{25}(16:23,:),1)/sqrt(8);
Ctl.MDse = nanstd(afq.vals.md{25}(16:23,:),1)/sqrt(8);
Ctl.ADse = nanstd(afq.vals.ad{25}(16:23,:),1)/sqrt(8);
Ctl.RDse = nanstd(afq.vals.rd{25}(16:23,:),1)/sqrt(8);

% legend('JMD', 'LHON', 'Ctl');
xlabel('Location','fontName','Times','fontSize',14);
ylabel('FA','fontName','Times','fontSize',14);
title('L-Optic Tract Control','fontName','Times','fontSize',14);
hold off;

% %% group comparison across 6LHON, 4JMD, 5CRD, and 8Control
%
% figure; hold on;
%
% JMD9mean   = plot(X,JMD.fa,'Color',c(1,:),'Linewidth',2);
% congMDmean = plot(X,congMD.fa,'Color',c(2,:),'Linewidth',2);
% CRDmean    = plot(X,CRD.fa,'Color',c(3,:),'Linewidth',2);
% LHONmean   = plot(X,LHON.fa,'Color',c(4,:),'Linewidth',2);
% Ctlmean    = plot(X,Ctl.fa,'Color',[0.5,0.5,0.5],'Linewidth',2);
%
%
%
%
% legend('JMD9mean','congMDmean','CRDmean','LHONmean','Ctlmean');
%
% JMDerror    = errorbar(X, JMD.fa,JMD.FAse ,'Color',c(1,:));
% congMDerror = errorbar(X, congMD.fa,congMD.FAse ,'Color',c(2,:));
% CRDerror    = errorbar(X, CRD.fa, CRD.FAse ,'Color',c(3,:));
% LHONerror   = errorbar(X, LHON.fa, LHON.FAse ,'Color',c(4,:));
% Ctlerror    = errorbar(X, Ctl.fa, Ctl.FAse ,'Color',[0.5,0.5,0.5]);
% axis([0,100,0.25,0.65]);
% % set(gcf, )
% xlabel('Location','fontName','Times','fontSize',14);
% ylabel('FA','fontName','Times','fontSize',14);
% title('L-Optic Tract across groups','fontName','Times','fontSize',14);
%
% hold off;

%% FA 6LHON_5CRD_8Ctl group comparison across LHON, 5CRD, and Control

figure; hold on;

% JMD9mean   = plot(X,JMD.fa,'Color',c(1,:),'Linewidth',2);
% congMDmean = plot(X,congMD.fa,'Color',c(2,:),'Linewidth',2);
CRDmean    = plot(X,CRD.fa,'Color',c(3,:),'Linewidth',2);
LHONmean   = plot(X,LHON.fa,'Color',c(4,:),'Linewidth',2);
Ctlmean    = plot(X,Ctl.fa,'Color',[0.5,0.5,0.5],'Linewidth',2);

legend('CRDmean','LHONmean','Ctlmean');

% JMDerror    = errorbar(X, JMD.fa,JMD.FAse ,'Color',c(1,:));
% congMDerror = errorbar(X, congMD.fa,congMD.FAse ,'Color',c(2,:));
CRDerror    = errorbar(X, CRD.fa, CRD.FAse ,'Color',c(3,:));
LHONerror   = errorbar(X, LHON.fa, LHON.FAse ,'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl.fa, Ctl.FAse ,'Color',[0.5,0.5,0.5]);
axis([0,100,0.1,0.6]);
% set(gcf, )
xlabel('Location','fontName','Times','fontSize',14);
ylabel('Fractional Anisotropy','fontName','Times','fontSize',14);
title('L-Optic Tract across groups','fontName','Times','fontSize',14);

hold off;

%% save the figure in .eps
% Figure を 1024x768 のeps形式で
% "fig.eps"
width  = 512;
height =384;
set(gcf,'PaperPositionMode','auto')
pos=get(gcf,'Position');
pos(3)=width-1;
pos(4)=height;
set(gcf,'Position',pos);
print('-r0','-depsc','L-OT_FA_group_comaprison_6LHON_5CRD_8Ctl.eps');

%% MD 6LHON_5CRD_8Ctl group comparison across LHON, 5CRD, and Control

figure; hold on;

% JMD9mean   = plot(X,JMD.fa,'Color',c(1,:),'Linewidth',2);
% congMDmean = plot(X,congMD.fa,'Color',c(2,:),'Linewidth',2);
CRDmean    = plot(X,CRD.md,'Color',c(3,:),'Linewidth',2);
LHONmean   = plot(X,LHON.md,'Color',c(4,:),'Linewidth',2);
Ctlmean    = plot(X,Ctl.md,'Color',[0.5,0.5,0.5],'Linewidth',2);

legend('CRDmean','LHONmean','Ctlmean');

% JMDerror    = errorbar(X, JMD.fa,JMD.FAse ,'Color',c(1,:));
% congMDerror = errorbar(X, congMD.fa,congMD.FAse ,'Color',c(2,:));
CRDerror    = errorbar(X, CRD.md, CRD.MDse ,'Color',c(3,:));
LHONerror   = errorbar(X, LHON.md, LHON.MDse ,'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl.md, Ctl.MDse ,'Color',[0.5,0.5,0.5]);
axis([0, 100, 0.7, 1.9]);
% set(gcf, )
xlabel('Location','fontName','Times','fontSize',14);
ylabel('MD','fontName','Times','fontSize',14);
title('L-Optic Tract across groups','fontName','Times','fontSize',14);

hold off;

%% save the figure in .eps
% Figure を 1024x768 のeps形式で
% "fig.eps" に保存する例
width  = 512;
height =384;
set(gcf,'PaperPositionMode','auto')
pos=get(gcf,'Position');
pos(3)=width-1; %なぜか幅が1px増えるので対処
pos(4)=height;
set(gcf,'Position',pos);
print('-r0','-depsc','L-OT_MD_group_comaprison_6LHON_5CRD_8Ctl.eps');

%% AD 6LHON_5CRD_8Ctl group comparison across LHON, 5CRD, and Control

figure; hold on;

% JMD9mean   = plot(X,JMD.fa,'Color',c(1,:),'Linewidth',2);
% congMDmean = plot(X,congMD.fa,'Color',c(2,:),'Linewidth',2);
CRDmean    = plot(X,CRD.ad,'Color',c(3,:),'Linewidth',2);
LHONmean   = plot(X,LHON.ad,'Color',c(4,:),'Linewidth',2);
Ctlmean    = plot(X,Ctl.ad,'Color',[0.5,0.5,0.5],'Linewidth',2);

legend('CRDmean','LHONmean','Ctlmean');

% JMDerror    = errorbar(X, JMD.fa,JMD.FAse ,'Color',c(1,:));
% congMDerror = errorbar(X, congMD.fa,congMD.FAse ,'Color',c(2,:));
CRDerror    = errorbar(X, CRD.ad, CRD.ADse ,'Color',c(3,:));
LHONerror   = errorbar(X, LHON.ad, LHON.ADse ,'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl.ad, Ctl.ADse ,'Color',[0.5,0.5,0.5]);
axis([0, 100, 1.1, 2]);
% set(gcf, )
xlabel('Location','fontName','Times','fontSize',14);
ylabel('AD','fontName','Times','fontSize',14);
title('L-Optic Tract across groups','fontName','Times','fontSize',14);

hold off;

%% save the figure in .eps
% Figure を 1024x768 のeps形式で
% "fig.eps"
width  = 512;
height =384;
set(gcf,'PaperPositionMode','auto')
pos=get(gcf,'Position');
pos(3)=width-1;
pos(4)=height;
set(gcf,'Position',pos);
print('-r0','-depsc','L-OT_AD_group_comaprison_6LHON_5CRD_8Ctl.eps');


%% RD 6LHON_5CRD_8Ctl group comparison across LHON, 5CRD, and Control

figure; hold on;

% JMD9mean   = plot(X,JMD.fa,'Color',c(1,:),'Linewidth',2);
% congMDmean = plot(X,congMD.fa,'Color',c(2,:),'Linewidth',2);
CRDmean    = plot(X,CRD.rd,'Color',c(3,:),'Linewidth',2);
LHONmean   = plot(X,LHON.rd,'Color',c(4,:),'Linewidth',2);
Ctlmean    = plot(X,Ctl.rd,'Color',[0.5,0.5,0.5],'Linewidth',2);

legend('CRDmean','LHONmean','Ctlmean');

% JMDerror    = errorbar(X, JMD.fa,JMD.FAse ,'Color',c(1,:));
% congMDerror = errorbar(X, congMD.fa,congMD.FAse ,'Color',c(2,:));
CRDerror    = errorbar(X, CRD.rd, CRD.RDse ,'Color',c(3,:));
LHONerror   = errorbar(X, LHON.rd, LHON.RDse ,'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl.rd, Ctl.RDse ,'Color',[0.5,0.5,0.5]);
axis([0, 100, 0.5, 1.7]);
% set(gcf, )
xlabel('Location','fontName','Times','fontSize',14);
ylabel('RD','fontName','Times','fontSize',14);
title('L-Optic Tract across groups','fontName','Times','fontSize',14);

hold off;

%% save the figure in .eps
% Figure を 1024x768 のeps形式で
% "fig.eps" に保存する例
width  = 512;
height =384;
set(gcf,'PaperPositionMode','auto')
pos=get(gcf,'Position');
pos(3)=width-1; %なぜか幅が1px増えるので対処
pos(4)=height;
set(gcf,'Position',pos);
print('-r0','-depsc','L-OT_RD_group_comaprison_6LHON_5CRD_8Ctl.eps');


%% RD group comparison across 6LHON, 4JMD, and 8Control

figure; hold on;

% JMD9mean   = plot(X,JMD.fa,'Color',c(1,:),'Linewidth',2);
congMDmean = plot(X,congMD.fa,'Color',c(2,:),'Linewidth',2);
% CRDmean    = plot(X,CRD.fa,'Color',c(3,:),'Linewidth',2);
LHONmean   = plot(X,LHON.fa,'Color',c(4,:),'Linewidth',2);
Ctlmean    = plot(X,Ctl.fa,'Color',[0.5,0.5,0.5],'Linewidth',2);

legend('congMDmean','LHONmean','Ctlmean');

% JMDerror    = errorbar(X, JMD.fa,JMD.FAse ,'Color',c(1,:));
congMDerror = errorbar(X, congMD.fa,congMD.FAse ,'Color',c(2,:));
% CRDerror    = errorbar(X, CRD.fa, CRD.FAse ,'Color',c(3,:));
LHONerror   = errorbar(X, LHON.fa, LHON.FAse ,'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl.fa, Ctl.FAse ,'Color',[0.5,0.5,0.5]);
axis([0,100,0.05,0.55]);
% set(gcf, )
xlabel('Location','fontName','Times','fontSize',14);
ylabel('Fractional Anisotropy','fontName','Times','fontSize',14);
title('L-Optic Tract across groups','fontName','Times','fontSize',14);

hold off;

%% save the figure in .eps
% Figure を 1024x768 のeps形式で
% "fig.eps" に保存する例
width  = 512;
height =384;
set(gcf,'PaperPositionMode','auto')
pos=get(gcf,'Position');
pos(3)=width-1; %なぜか幅が1px増えるので対処
pos(4)=height;
set(gcf,'Position',pos);
print('-r0','-depsc','L-OT_FA_group_comaprison_6LHON_5CRD_4JMD_8Ctl.eps');


%% group comparison across LHON, JMD, CRD, and Control

figure; hold on;
X = 50:85;

% JMD9mean = plot(X,JMD.fa(50:85),'Color',c(1,:),'Linewidth',2);
congMDmean = plot(X,congMD.fa(50:85),'Color',c(2,:),'Linewidth',2);
CRDmean = plot(X,CRD.fa(50:85),'Color',c(3,:),'Linewidth',2);
LHONmean = plot(X,LHON.fa(50:85),'Color',c(4,:),'Linewidth',2);
Ctlmean = plot(X,Ctl.fa(50:85),'Color',[0.5,0.5,0.5],'Linewidth',2);
legend('congMDmean','CRDmean','LHONmean','Ctlmean');

% JMDerror    = errorbar(X, JMD.fa(50:85),JMD.FAse(50:85) ,'Color',c(1,:));
congMDerror = errorbar(X, congMD.fa(50:85),congMD.FAse(50:85) ,'Color',c(2,:));
CRDerror    = errorbar(X, CRD.fa(50:85), CRD.FAse(50:85) ,'Color',c(3,:));
LHONerror   = errorbar(X, LHON.fa(50:85), LHON.FAse(50:85) ,'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl.fa(50:85), Ctl.FAse(50:85) ,'Color',[0.5,0.5,0.5]);

axis([50,85,0.05,0.55]);
xlabel('Location','fontName','Times','fontSize',14);
ylabel('Fractional Anisotropy','fontName','Times','fontSize',14);
title('L-Optic Tract across groups','fontName','Times','fontSize',14);

% set(gcf, )
hold off;

%% save the figure in .eps
% Figure を 1024x768 のeps形式で
% "fig.eps" に保存する例
width  = 512;
height =384;
set(gcf,'PaperPositionMode','auto')
pos=get(gcf,'Position');
pos(3)=width-1; %なぜか幅が1px増えるので対処
pos(4)=height;
set(gcf,'Position',pos);
print('-r0','-depsc','L-OT_FA_group_partial_6LHON_5CRD_4JMD_8Ctl.eps');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% OCF
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
JMD.fa = nansum(afq.vals.fa{26}(1:9,:),1)/9;
JMD.md = nansum(afq.vals.md{26}(1:9,:),1)/9;
JMD.ad = nansum(afq.vals.ad{26}(1:9,:),1)/9;
JMD.rd = nansum(afq.vals.rd{26}(1:9,:),1)/9;
% se
JMD.FAse = nanstd(afq.vals.fa{26}(1:9,:),1)/sqrt(9);
JMD.MDse = nanstd(afq.vals.md{26}(1:9,:),1)/sqrt(9);
JMD.ADse = nanstd(afq.vals.ad{26}(1:9,:),1)/sqrt(9);
JMD.RDse = nanstd(afq.vals.rd{26}(1:9,:),1)/sqrt(9);

congMD.fa = nansum(afq.vals.fa{26}(1:4,:),1)/4;
congMD.md = nansum(afq.vals.md{26}(1:4,:),1)/4;
congMD.ad = nansum(afq.vals.ad{26}(1:4,:),1)/4;
congMD.rd = nansum(afq.vals.rd{26}(1:4,:),1)/4;

% se
congMD.FAse = nanstd(afq.vals.fa{26}(1:4,:),1)/sqrt(4);
congMD.MDse = nanstd(afq.vals.md{26}(1:4,:),1)/sqrt(4);
congMD.ADse = nanstd(afq.vals.ad{26}(1:4,:),1)/sqrt(4);
congMD.RDse = nanstd(afq.vals.rd{26}(1:4,:),1)/sqrt(4);


CRD.fa = nansum(afq.vals.fa{26}(5:9,:),1)/5;
CRD.md = nansum(afq.vals.md{26}(5:9,:),1)/5;
CRD.ad = nansum(afq.vals.ad{26}(5:9,:),1)/5;
CRD.rd = nansum(afq.vals.rd{26}(5:9,:),1)/5;
% se
CRD.FAse = nanstd(afq.vals.fa{26}(5:9,:),1)/sqrt(5);
CRD.MDse = nanstd(afq.vals.md{26}(5:9,:),1)/sqrt(5);
CRD.ADse = nanstd(afq.vals.ad{26}(5:9,:),1)/sqrt(5);
CRD.RDse = nanstd(afq.vals.rd{26}(5:9,:),1)/sqrt(5);

LHON.fa = nansum(afq.vals.fa{26}(10:15,:),1)/6;
LHON.md = nansum(afq.vals.md{26}(10:15,:),1)/6;
LHON.ad = nansum(afq.vals.ad{26}(10:15,:),1)/6;
LHON.rd = nansum(afq.vals.rd{26}(10:15,:),1)/6;

% se
LHON.FAse = nanstd(afq.vals.fa{26}(10:15,:),1)/sqrt(6);
LHON.MDse = nanstd(afq.vals.md{26}(10:15,:),1)/sqrt(6);
LHON.ADse = nanstd(afq.vals.ad{26}(10:15,:),1)/sqrt(6);
LHON.RDse = nanstd(afq.vals.rd{26}(10:15,:),1)/sqrt(6);

Ctl.fa = nansum(afq.vals.fa{26}(16:23,:),1)/8;
Ctl.md = nansum(afq.vals.md{26}(16:23,:),1)/8;
Ctl.ad = nansum(afq.vals.ad{26}(16:23,:),1)/8;
Ctl.rd = nansum(afq.vals.rd{26}(16:23,:),1)/8;

% se
Ctl.FAse = nanstd(afq.vals.fa{26}(16:23,:),1)/sqrt(8);
Ctl.MDse = nanstd(afq.vals.md{26}(16:23,:),1)/sqrt(8);
Ctl.ADse = nanstd(afq.vals.ad{26}(16:23,:),1)/sqrt(8);
Ctl.RDse = nanstd(afq.vals.rd{26}(16:23,:),1)/sqrt(8);


%% all 9 JMD
c= lines(24);
figure; hold on;

for i = 1:9;
    X = 1:100;
    Y = afq.vals.fa{26}(i,:);
    plot(X,Y,'Color',c(i,:))
end

% JMD.fa = nansum(afq.vals.fa{26}(1:9,:),1)/9;
% JMD.md = nansum(afq.vals.md{26}(1:9,:),1)/9;
% JMD.ad = nansum(afq.vals.ad{26}(1:9,:),1)/9;
% JMD.rd = nansum(afq.vals.rd{26}(1:9,:),1)/9;
% % se
% JMD.FAse = nanstd(afq.vals.fa{26}(1:9,:),1)/sqrt(9);
% JMD.MDse = nanstd(afq.vals.md{26}(1:9,:),1)/sqrt(9);
% JMD.ADse = nanstd(afq.vals.ad{26}(1:9,:),1)/sqrt(9);
% JMD.RDse = nanstd(afq.vals.rd{26}(1:9,:),1)/sqrt(9);


JMDmean = plot(X,JMD.fa);
set(JMDmean,'Linewidth',2, 'Color',c(24,:));


% legend('JMD', 'LHON', 'Ctl');
xlabel('Location','fontName','Times','fontSize',14);
ylabel('Fractional Anisotropy','fontName','Times','fontSize',14);
title('Occipital callosal fiber all_9JMD','fontName','Times','fontSize',14);
hold off;

%% congenitalMD 1:4
c= lines(24);
figure; hold on;
for i = 1:4;
    X = 1:100;
    Y = afq.vals.fa{26}(i,:);
    plot(X,Y,'Color',c(i,:))
end

% congMD.fa = nansum(afq.vals.fa{26}(1:4,:),1)/4;
% congMD.md = nansum(afq.vals.md{26}(1:4,:),1)/4;
% congMD.ad = nansum(afq.vals.ad{26}(1:4,:),1)/4;
% congMD.rd = nansum(afq.vals.rd{26}(1:4,:),1)/4;
%
% % se
% congMD.FAse = nanstd(afq.vals.fa{26}(1:4,:),1)/sqrt(4);
% congMD.MDse = nanstd(afq.vals.md{26}(1:4,:),1)/sqrt(4);
% congMD.ADse = nanstd(afq.vals.ad{26}(1:4,:),1)/sqrt(4);
% congMD.RDse = nanstd(afq.vals.rd{26}(1:4,:),1)/sqrt(4);

congMDmean = plot(X,congMD.fa);
set(congMDmean,'Linewidth',2, 'Color',c(24,:));

% legend('JMD', 'LHON', 'Ctl');
xlabel('Location','fontName','Times','fontSize',14);
ylabel('Fractional Anisotropy','fontName','Times','fontSize',14);
title('Occipital callosal fiber congenitalMD 1:4','fontName','Times','fontSize',14);
hold off;

%% CRD 5:9
c= lines(24);
figure; hold on;
for i = 5:9;
    X = 1:100;
    Y = afq.vals.fa{26}(i,:);
    plot(X,Y,'Color',c(i,:))
end

% CRD.fa = nansum(afq.vals.fa{26}(5:9,:),1)/5;
% CRD.md = nansum(afq.vals.md{26}(5:9,:),1)/5;
% CRD.ad = nansum(afq.vals.ad{26}(5:9,:),1)/5;
% CRD.rd = nansum(afq.vals.rd{26}(5:9,:),1)/5;
% % se
% CRD.FAse = nanstd(afq.vals.fa{26}(5:9,:),1)/sqrt(5);
% CRD.MDse = nanstd(afq.vals.md{26}(5:9,:),1)/sqrt(5);
% CRD.ADse = nanstd(afq.vals.ad{26}(5:9,:),1)/sqrt(5);
% CRD.RDse = nanstd(afq.vals.rd{26}(5:9,:),1)/sqrt(5);

CRDmean = plot(X,CRD.fa);
set(CRDmean,'Linewidth',2, 'Color',c(24,:));


% legend('JMD', 'LHON', 'Ctl');
xlabel('Location','fontName','Times','fontSize',14);
ylabel('Fractional Anisotropy','fontName','Times','fontSize',14);
title('Occipital callosal fiber CRD','fontName','Times','fontSize',14);
hold off;

%% save the figure in .eps
% Figure ? 1024x768 ?eps???
% "fig.eps" ??????
width  = 512;
height =384;
set(gcf,'PaperPositionMode','auto')
pos=get(gcf,'Position');
pos(3)=width-1; %?????1px???????
pos(4)=height;
set(gcf,'Position',pos);
print('-r0','-depsc','R-OR_AD_group_comaprison_6LHON_5CRD_8Ctl.eps');

%% LHON

c= lines(24);
figure; hold on;
for i = 10:15;
    X = 1:100;
    Y = afq.vals.fa{26}(i,:);
    plot(X,Y,'Color',c(i,:))
end

% LHON.fa = nansum(afq.vals.fa{26}(10:15,:),1)/6;
% LHON.md = nansum(afq.vals.md{26}(10:15,:),1)/6;
% LHON.ad = nansum(afq.vals.ad{26}(10:15,:),1)/6;
% LHON.rd = nansum(afq.vals.rd{26}(10:15,:),1)/6;
%
% % se
% LHON.FAse = nanstd(afq.vals.fa{26}(10:15,:),1)/sqrt(6);
% LHON.MDse = nanstd(afq.vals.md{26}(10:15,:),1)/sqrt(6);
% LHON.ADse = nanstd(afq.vals.ad{26}(10:15,:),1)/sqrt(6);
% LHON.RDse = nanstd(afq.vals.rd{26}(10:15,:),1)/sqrt(6);


LHONmean = plot(X,LHON.fa);
set(LHONmean,'Linewidth',2, 'Color',c(24,:));


% legend('JMD', 'LHON', 'Ctl');
xlabel('Location','fontName','Times','fontSize',14);
ylabel('Fractional Anisotropy','fontName','Times','fontSize',14);
title('Occipital callosal fiber LHON','fontName','Times','fontSize',14);
hold off;

%% Control

c= lines(24);
figure; hold on;
for i = 16:23;
    X = 1:100;
    Y = afq.vals.fa{26}(i,:);
    plot(X,Y,'Color',c(i,:))
end

Ctlmean = plot(X,Ctl.fa);
set(Ctlmean,'Linewidth',2, 'Color',c(24,:));


% legend('JMD', 'LHON', 'Ctl');
xlabel('Location','fontName','Times','fontSize',14);
ylabel('Fractional Anisotropy','fontName','Times','fontSize',14);
title('Occipital callosal fiber Control','fontName','Times','fontSize',14);
hold off;

%% FA comparison across 6LHON, 4JMD, 5CRD, and 8Control

figure; hold on;

JMD9mean   = plot(X,JMD.fa,'Color',c(1,:),'Linewidth',2);
congMDmean = plot(X,congMD.fa,'Color',c(2,:),'Linewidth',2);
CRDmean    = plot(X,CRD.fa,'Color',c(3,:),'Linewidth',2);
LHONmean   = plot(X,LHON.fa,'Color',c(4,:),'Linewidth',2);
Ctlmean    = plot(X,Ctl.fa,'Color',[0.5,0.5,0.5],'Linewidth',2);




% legend('JMD9mean','congMDmean','CRDmean','LHONmean','Ctlmean');
legend('congMDmean','CRDmean','Ctlmean');


JMDerror    = errorbar(X, JMD.fa,JMD.FAse ,'Color',c(1,:));
congMDerror = errorbar(X, congMD.fa,congMD.FAse ,'Color',c(2,:));
CRDerror    = errorbar(X, CRD.fa, CRD.FAse ,'Color',c(3,:));
LHONerror   = errorbar(X, LHON.fa, LHON.FAse ,'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl.fa, Ctl.FAse ,'Color',[0.5,0.5,0.5]);
axis([0,100,0.25,0.9]);
% set(gcf, )
xlabel('Location','fontName','Times','fontSize',14);
ylabel('Fractional Anisotropy','fontName','Times','fontSize',14);
title('Occipital callosal fiber across groups','fontName','Times','fontSize',14);

hold off;

%% FA 6LHON_5CRD_8Ctl group comparison across LHON, 5CRD, and Control

figure; hold on;

% JMD9mean   = plot(X,JMD.fa,'Color',c(1,:),'Linewidth',2);
% congMDmean = plot(X,congMD.fa,'Color',c(2,:),'Linewidth',2);
CRDmean    = plot(X,CRD.fa,'Color',c(3,:),'Linewidth',2);
LHONmean   = plot(X,LHON.fa,'Color',c(4,:),'Linewidth',2);
Ctlmean    = plot(X,Ctl.fa,'Color',[0.5,0.5,0.5],'Linewidth',2);

% legend('CRDmean','LHONmean','Ctlmean');

% JMDerror    = errorbar(X, JMD.fa,JMD.FAse ,'Color',c(1,:));
% congMDerror = errorbar(X, congMD.fa,congMD.FAse ,'Color',c(2,:));
CRDerror    = errorbar(X, CRD.fa, CRD.FAse ,'Color',c(3,:));
LHONerror   = errorbar(X, LHON.fa, LHON.FAse ,'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl.fa, Ctl.FAse ,'Color',[0.5,0.5,0.5]);
axis([0,100,0.1,0.9]);
% set(gcf, )
xlabel('Location','fontName','Times','fontSize',14);
ylabel('Fractional Anisotropy','fontName','Times','fontSize',14);
title('Occipital callosal fiber across groups','fontName','Times','fontSize',14);

hold off;

%% save the figure in .eps

print(gcf,'-depsc','OCF_FA_group_comaprison_6LHON_5CRD_8Ctl.eps');

%% MD 6LHON_5CRD_8Ctl group comparison across LHON, 5CRD, and Control

figure; hold on;

% JMD9mean   = plot(X,JMD.fa,'Color',c(1,:),'Linewidth',2);
% congMDmean = plot(X,congMD.fa,'Color',c(2,:),'Linewidth',2);
CRDmean    = plot(X,CRD.md,'Color',c(3,:),'Linewidth',2);
LHONmean   = plot(X,LHON.md,'Color',c(4,:),'Linewidth',2);
Ctlmean    = plot(X,Ctl.md,'Color',[0.5,0.5,0.5],'Linewidth',2);

% legend('CRDmean','LHONmean','Ctlmean');

% JMDerror    = errorbar(X, JMD.fa,JMD.FAse ,'Color',c(1,:));
% congMDerror = errorbar(X, congMD.fa,congMD.FAse ,'Color',c(2,:));
CRDerror    = errorbar(X, CRD.md, CRD.MDse ,'Color',c(3,:));
LHONerror   = errorbar(X, LHON.md, LHON.MDse ,'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl.md, Ctl.MDse ,'Color',[0.5,0.5,0.5]);
axis([0, 100, 0.65, 1]);
% set(gcf, )
xlabel('Location','fontName','Times','fontSize',14);
ylabel('Mean Diffusivity','fontName','Times','fontSize',14);
title('Occipital callosal fiber across groups','fontName','Times','fontSize',14);

hold off;
%% save the figure in .eps


print(gcf,'-depsc','OCF_MD_group_comaprison_6LHON_5CRD_8Ctl.eps');


%% AD 6LHON_5CRD_8Ctl group comparison across LHON, 5CRD, and Control

figure; hold on;

% JMD9mean   = plot(X,JMD.fa,'Color',c(1,:),'Linewidth',2);
% congMDmean = plot(X,congMD.fa,'Color',c(2,:),'Linewidth',2);
CRDmean    = plot(X,CRD.ad,'Color',c(3,:),'Linewidth',2);
LHONmean   = plot(X,LHON.ad,'Color',c(4,:),'Linewidth',2);
Ctlmean    = plot(X,Ctl.ad,'Color',[0.5,0.5,0.5],'Linewidth',2);

legend('CRDmean','LHONmean','Ctlmean');

% JMDerror    = errorbar(X, JMD.fa,JMD.FAse ,'Color',c(1,:));
% congMDerror = errorbar(X, congMD.fa,congMD.FAse ,'Color',c(2,:));
CRDerror    = errorbar(X, CRD.ad, CRD.ADse ,'Color',c(3,:));
LHONerror   = errorbar(X, LHON.ad, LHON.ADse ,'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl.ad, Ctl.ADse ,'Color',[0.5,0.5,0.5]);
axis([0, 100, 1, 1.8]);
% set(gcf, )
xlabel('Location','fontName','Times','fontSize',14);
ylabel('Axial Diffusivity','fontName','Times','fontSize',14);
title('Occipital callosal fiber across groups','fontName','Times','fontSize',14);

hold off;

%% save the figure in .eps


print(gcf,'-depsc','OCF_AD_group_comaprison_6LHON_5CRD_8Ctl.eps');



% % Figure を 1024x768 のeps形式で
% % "fig.eps" に保存する例
% width  = 512;
% height =384;
% set(gcf,'PaperPositionMode','auto')
% pos=get(gcf,'Position');
% pos(3)=width-1; %なぜか幅が1px増えるので対処
% pos(4)=height;
% set(gcf,'Position',pos);
% print('-r0','-depsc','OCF_AD_group_comaprison_6LHON_5CRD_8Ctl.eps');


%% RD 6LHON_5CRD_8Ctl group comparison across LHON, 5CRD, and Control

figure; hold on;

% JMDmean   = plot(X,JMD.fa,'Color',c(1,:),'Linewidth',2);
% congMDmean = plot(X,congMD.fa,'Color',c(2,:),'Linewidth',2);
CRDmean    = plot(X,CRD.rd,'Color',c(3,:),'Linewidth',2);
LHONmean   = plot(X,LHON.rd,'Color',c(4,:),'Linewidth',2);
Ctlmean    = plot(X,Ctl.rd,'Color',[0.5,0.5,0.5],'Linewidth',2);

legend('CRDmean','LHONmean','Ctlmean');

% JMDerror    = errorbar(X, JMD.fa,JMD.FAse ,'Color',c(1,:));
% congMDerror = errorbar(X, congMD.fa,congMD.FAse ,'Color',c(2,:));
CRDerror    = errorbar(X, CRD.rd, CRD.RDse ,'Color',c(3,:));
LHONerror   = errorbar(X, LHON.rd, LHON.RDse ,'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl.rd, Ctl.RDse ,'Color',[0.5,0.5,0.5]);
axis([0, 100, 0.2, 1]);
% set(gcf, )
xlabel('Location','fontName','Times','fontSize',14);
ylabel('Radial Diffusivity','fontName','Times','fontSize',14);
title('Occipital callosal fiber across groups','fontName','Times','fontSize',14);

hold off;

%% save the figure in .eps

print(gcf,'-depsc','OCF_RD_group_comaprison_6LHON_5CRD_8Ctl.eps');



% % Figure を 1024x768 のeps形式で
% % "fig.eps" に保存する例
% width  = 512;
% height =384;
% set(gcf,'PaperPositionMode','auto')
% pos=get(gcf,'Position');
% pos(3)=width-1; %なぜか幅が1px増えるので対処
% pos(4)=height;
% set(gcf,'Position',pos);
% print('-r0','-depsc','OCF_RD_group_comaprison_6LHON_5CRD_8Ctl.eps');


%% RD group comparison across 6LHON, 4JMD, and 8Control

figure; hold on;

% JMD9mean   = plot(X,JMD.fa,'Color',c(1,:),'Linewidth',2);
congMDmean = plot(X,congMD.fa,'Color',c(2,:),'Linewidth',2);
% CRDmean    = plot(X,CRD.fa,'Color',c(3,:),'Linewidth',2);
LHONmean   = plot(X,LHON.fa,'Color',c(4,:),'Linewidth',2);
Ctlmean    = plot(X,Ctl.fa,'Color',[0.5,0.5,0.5],'Linewidth',2);

legend('congMDmean','LHONmean','Ctlmean');

% JMDerror    = errorbar(X, JMD.fa,JMD.FAse ,'Color',c(1,:));
congMDerror = errorbar(X, congMD.fa,congMD.FAse ,'Color',c(2,:));
% CRDerror    = errorbar(X, CRD.fa, CRD.FAse ,'Color',c(3,:));
LHONerror   = errorbar(X, LHON.fa, LHON.FAse ,'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl.fa, Ctl.FAse ,'Color',[0.5,0.5,0.5]);
axis([0, 100, 0.2, 1]);
% set(gcf, )
xlabel('Location','fontName','Times','fontSize',14);
ylabel('FA','fontName','Times','fontSize',14);
title('Occipital callosal fiber across groups','fontName','Times','fontSize',14);

hold off;

%% save the figure in .eps
% Figure を 1024x768 のeps形式で
% "fig.eps" に保存する例
width  = 512;
height =384;
set(gcf,'PaperPositionMode','auto')
pos=get(gcf,'Position');
pos(3)=width-1; %なぜか幅が1px増えるので対処
pos(4)=height;
set(gcf,'Position',pos);
print('-r0','-depsc','OCF_FA_group_comaprison_6LHON_5CRD_4JMD_8Ctl.eps');


% %% group comparison across LHON, JMD, CRD, and Control
%
% figure; hold on;
% X = 50:85;
%
% % JMD9mean = plot(X,JMD.fa(50:85),'Color',c(1,:),'Linewidth',2);
% congMDmean = plot(X,congMD.fa(50:85),'Color',c(2,:),'Linewidth',2);
% CRDmean = plot(X,CRD.fa(50:85),'Color',c(3,:),'Linewidth',2);
% LHONmean = plot(X,LHON.fa(50:85),'Color',c(4,:),'Linewidth',2);
% Ctlmean = plot(X,Ctl.fa(50:85),'Color',[0.5,0.5,0.5],'Linewidth',2);
% legend('congMDmean','CRDmean','LHONmean','Ctlmean');
%
% % JMDerror    = errorbar(X, JMD.fa(50:85),JMD.FAse(50:85) ,'Color',c(1,:));
% congMDerror = errorbar(X, congMD.fa(50:85),congMD.FAse(50:85) ,'Color',c(2,:));
% CRDerror    = errorbar(X, CRD.fa(50:85), CRD.FAse(50:85) ,'Color',c(3,:));
% LHONerror   = errorbar(X, LHON.fa(50:85), LHON.FAse(50:85) ,'Color',c(4,:));
% Ctlerror    = errorbar(X, Ctl.fa(50:85), Ctl.FAse(50:85) ,'Color',[0.5,0.5,0.5]);
%
% axis([50,85,0.35,0.65]);
% xlabel('Location','fontName','Times','fontSize',14);
% ylabel('FA','fontName','Times','fontSize',14);
% title('Occipital callosal fiber across groups','fontName','Times','fontSize',14);
%
%
% % set(gcf, )
% hold off;
%
% return

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% average left and right
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% OR

%% all

JMD.fa = (nansum(afq.vals.fa{21}(1:9,:),1)+nansum(afq.vals.fa{22}(1:9,:),1))/18;
JMD.md = (nansum(afq.vals.md{21}(1:9,:),1)+nansum(afq.vals.md{22}(1:9,:),1))/18;
JMD.ad = (nansum(afq.vals.ad{21}(1:9,:),1)+nansum(afq.vals.ad{22}(1:9,:),1))/18;
JMD.rd = (nansum(afq.vals.rd{21}(1:9,:),1)+nansum(afq.vals.rd{22}(1:9,:),1))/18;

% se
JMD.FAse = nanstd(vertcat(afq.vals.fa{21}(1:9,:),afq.vals.fa{22}(1:9,:)),1)/sqrt(18);
JMD.MDse = nanstd(vertcat(afq.vals.md{21}(1:9,:),afq.vals.md{22}(1:9,:)),1)/sqrt(18);
JMD.ADse = nanstd(vertcat(afq.vals.ad{21}(1:9,:),afq.vals.ad{22}(1:9,:)),1)/sqrt(18);
JMD.RDse = nanstd(vertcat(afq.vals.rd{21}(1:9,:),afq.vals.rd{22}(1:9,:)),1)/sqrt(18);

% congenitalMD 1:4
congMD.fa = (nansum(afq.vals.fa{21}(1:4,:),1)+nansum(afq.vals.fa{22}(1:4,:),1))/8;
congMD.md = (nansum(afq.vals.md{21}(1:4,:),1)+nansum(afq.vals.md{22}(1:4,:),1))/8;
congMD.ad = (nansum(afq.vals.ad{21}(1:4,:),1)+nansum(afq.vals.ad{22}(1:4,:),1))/8;
congMD.rd = (nansum(afq.vals.rd{21}(1:4,:),1)+nansum(afq.vals.rd{22}(1:4,:),1))/8;
% se
congMD.FAse = nanstd(vertcat(afq.vals.fa{21}(1:4,:),afq.vals.fa{22}(1:4,:)),1)/sqrt(8);
congMD.MDse = nanstd(vertcat(afq.vals.md{21}(1:4,:),afq.vals.md{22}(1:4,:)),1)/sqrt(8);
congMD.ADse = nanstd(vertcat(afq.vals.ad{21}(1:4,:),afq.vals.ad{22}(1:4,:)),1)/sqrt(8);
congMD.RDse = nanstd(vertcat(afq.vals.rd{21}(1:4,:),afq.vals.rd{22}(1:4,:)),1)/sqrt(8);

% CRD 5:9
CRD.fa = (nansum(afq.vals.fa{21}(5:9,:),1)+nansum(afq.vals.fa{22}(5:9,:),1))/10;
CRD.md = (nansum(afq.vals.md{21}(5:9,:),1)+nansum(afq.vals.md{22}(5:9,:),1))/10;
CRD.ad = (nansum(afq.vals.ad{21}(5:9,:),1)+nansum(afq.vals.ad{22}(5:9,:),1))/10;
CRD.rd = (nansum(afq.vals.rd{21}(5:9,:),1)+nansum(afq.vals.rd{22}(5:9,:),1))/10;
% se
CRD.FAse = nanstd(vertcat(afq.vals.fa{21}(5:9,:),afq.vals.fa{22}(5:9,:)),1)/sqrt(10);
CRD.MDse = nanstd(vertcat(afq.vals.md{21}(5:9,:),afq.vals.md{22}(5:9,:)),1)/sqrt(10);
CRD.ADse = nanstd(vertcat(afq.vals.ad{21}(5:9,:),afq.vals.ad{22}(5:9,:)),1)/sqrt(10);
CRD.RDse = nanstd(vertcat(afq.vals.rd{21}(5:9,:),afq.vals.rd{22}(5:9,:)),1)/sqrt(10);

% LHON
LHON.fa = (nansum(afq.vals.fa{21}(10:15,:),1)+nansum(afq.vals.fa{22}(10:15,:),1))/12;
LHON.md = (nansum(afq.vals.md{21}(10:15,:),1)+nansum(afq.vals.md{22}(10:15,:),1))/12;
LHON.ad = (nansum(afq.vals.ad{21}(10:15,:),1)+nansum(afq.vals.ad{22}(10:15,:),1))/12;
LHON.rd = (nansum(afq.vals.rd{21}(10:15,:),1)+nansum(afq.vals.rd{22}(10:15,:),1))/12;
% se
LHON.FAse = nanstd(vertcat(afq.vals.fa{21}(10:15,:),afq.vals.fa{22}(10:15,:)),1)/sqrt(12);
LHON.MDse = nanstd(vertcat(afq.vals.md{21}(10:15,:),afq.vals.md{22}(10:15,:)),1)/sqrt(12);
LHON.ADse = nanstd(vertcat(afq.vals.ad{21}(10:15,:),afq.vals.ad{22}(10:15,:)),1)/sqrt(12);
LHON.RDse = nanstd(vertcat(afq.vals.rd{21}(10:15,:),afq.vals.rd{22}(10:15,:)),1)/sqrt(12);

% Control
Ctl.fa = (nansum(afq.vals.fa{21}(16:23,:),1)+nansum(afq.vals.fa{22}(16:23,:),1))/16;
Ctl.md = (nansum(afq.vals.md{21}(16:23,:),1)+nansum(afq.vals.md{22}(16:23,:),1))/16;
Ctl.ad = (nansum(afq.vals.ad{21}(16:23,:),1)+nansum(afq.vals.ad{22}(16:23,:),1))/16;
Ctl.rd = (nansum(afq.vals.rd{21}(16:23,:),1)+nansum(afq.vals.rd{22}(16:23,:),1))/16;
% se
Ctl.FAse = nanstd(vertcat(afq.vals.fa{21}(16:23,:),afq.vals.fa{22}(16:23,:)),1)/sqrt(16);
Ctl.MDse = nanstd(vertcat(afq.vals.fa{21}(16:23,:),afq.vals.fa{22}(16:23,:)),1)/sqrt(16);
Ctl.ADse = nanstd(vertcat(afq.vals.fa{21}(16:23,:),afq.vals.fa{22}(16:23,:)),1)/sqrt(16);
Ctl.RDse = nanstd(vertcat(afq.vals.fa{21}(16:23,:),afq.vals.fa{22}(16:23,:)),1)/sqrt(16);

%% FAD 6LHON_5CRD_8Ctl group comparison across LHON, 5CRD, and Control
X = 1:100;
figure; hold on;
c = lines(24);
% JMDmean   = plot(X,JMD.fa,'Color',c(1,:),'Linewidth',2);
% congMDmean = plot(X,congMD.fa,'Color',c(2,:),'Linewidth',2);
CRDmean    = plot(X,CRD.fa,'Color',c(3,:),'Linewidth',2);
LHONmean   = plot(X,LHON.fa,'Color',c(4,:),'Linewidth',2);
Ctlmean    = plot(X,Ctl.fa,'Color',[0.4,0.4,0.4] ,'Linewidth',2);

legend('JMD','LHON','Ctl');

% JMDerror    = errorbar(X, JMD.fa,JMD.FAse ,'Color',c(1,:));
% congMDerror = errorbar(X, congMD.fa,congMD.FAse ,'Color',c(2,:));
CRDerror    = errorbar(X, CRD.fa, CRD.FAse ,'Color',c(3,:));
LHONerror   = errorbar(X, LHON.fa, LHON.FAse ,'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl.fa, Ctl.FAse ,'Color',[0.4,0.4,0.4]);
axis([0, 100, 0.2, 0.7]);
% set(gcf, )
xlabel('Location','fontName','Times','fontSize',14);
ylabel('Fractional Anisotropy','fontName','Times','fontSize',14);
title('Optic Radiation across groups','fontName','Times','fontSize',14);

hold off;

%% save the figure in .eps
% % Figure を 1024x768 のeps形式で
% % "fig.eps" に保存する例
% width  = 410;
% height =307;
% set(gcf,'PaperPositionMode','auto')
% pos=get(gcf,'Position');
% pos(3)=width-1; %なぜか幅が1px増えるので対処
% pos(4)=height;
% set(gcf,'Position',pos);

print(gcf,'-depsc','B_OR_FA_group_comaprison_6LHON_5CRD_8Ctl.eps');


%% AD 6LHON_5CRD_8Ctl group comparison across LHON, 5CRD, and Control

figure; hold on;

% JMDmean   = plot(X,JMD.fa,'Color',c(1,:),'Linewidth',2);
% congMDmean = plot(X,congMD.fa,'Color',c(2,:),'Linewidth',2);
CRDmean    = plot(X,CRD.ad,'Color',c(3,:),'Linewidth',2);
LHONmean   = plot(X,LHON.ad,'Color',c(4,:),'Linewidth',2);
Ctlmean    = plot(X,Ctl.ad,'Color',[0.5,0.5,0.5],'Linewidth',2);

legend('JMD','LHON','Ctl');

% JMDerror    = errorbar(X, JMD.fa,JMD.FAse ,'Color',c(1,:));
% congMDerror = errorbar(X, congMD.fa,congMD.FAse ,'Color',c(2,:));
CRDerror    = errorbar(X, CRD.ad, CRD.ADse ,'Color',c(3,:));
LHONerror   = errorbar(X, LHON.ad, LHON.ADse ,'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl.ad, Ctl.ADse ,'Color',[0.5,0.5,0.5]);
axis([0, 100, 0.9, 1.5]);
% set(gcf, )
xlabel('Location','fontName','Times','fontSize',14);
ylabel('Axial Diffusivity','fontName','Times','fontSize',14);
title('Optic Radiation across groups','fontName','Times','fontSize',14);

hold off;

%% save the figure in .eps

print(gcf,'-depsc','B_OR_AD_group_comaprison_6LHON_5CRD_8Ctl.eps');


% % Figure を 1024x768 のeps形式で
% % "fig.eps" に保存する例
% width  = 410;
% height =307;
% set(gcf,'PaperPositionMode','auto')
% pos=get(gcf,'Position');
% pos(3)=width-1; %なぜか幅が1px増えるので対処
% pos(4)=height;
% set(gcf,'Position',pos);
% print('-r0','-depsc','B_OR_AD_group_comaprison_6LHON_5CRD_8Ctl.eps');

%% MD 6LHON_5CRD_8Ctl group comparison across LHON, 5CRD, and Control

figure; hold on;

% JMDmean   = plot(X,JMD.fa,'Color',c(1,:),'Linewidth',2);
% congMDmean = plot(X,congMD.fa,'Color',c(2,:),'Linewidth',2);
CRDmean    = plot(X,CRD.md,'Color',c(3,:),'Linewidth',2);
LHONmean   = plot(X,LHON.md,'Color',c(4,:),'Linewidth',2);
Ctlmean    = plot(X,Ctl.md,'Color',[0.5,0.5,0.5],'Linewidth',2);

% legend('JMD','LHON','Ctl');

% JMDerror    = errorbar(X, JMD.fa,JMD.FAse ,'Color',c(1,:));
% congMDerror = errorbar(X, congMD.fa,congMD.FAse ,'Color',c(2,:));
CRDerror    = errorbar(X, CRD.md, CRD.MDse ,'Color',c(3,:));
LHONerror   = errorbar(X, LHON.md, LHON.MDse ,'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl.md, Ctl.MDse ,'Color',[0.5,0.5,0.5]);
axis([0, 100, 0.65, 1]);
% set(gcf, )
xlabel('Location','fontName','Times','fontSize',14);
ylabel('Mean Diffusivity','fontName','Times','fontSize',14);
title('Optic Radiation across groups','fontName','Times','fontSize',14);

hold off;

%% save the figure in .eps
print(gcf,'-depsc','B_OR_MD_group_comaprison_6LHON_5CRD_8Ctl.eps');

% print('-r0','-depsc','B_OR_MD_group_comaprison_6LHON_5CRD_8Ctl.eps');

%% RD 6LHON_5CRD_8Ctl group comparison across LHON, 5CRD, and Control

figure; hold on;

% JMDmean   = plot(X,JMD.fa,'Color',c(1,:),'Linewidth',2);
% congMDmean = plot(X,congMD.fa,'Color',c(2,:),'Linewidth',2);
CRDmean    = plot(X,CRD.rd,'Color',c(3,:),'Linewidth',2);
LHONmean   = plot(X,LHON.rd,'Color',c(4,:),'Linewidth',2);
Ctlmean    = plot(X,Ctl.rd,'Color',[0.4,0.4,0.4],'Linewidth',2);

legend('JMD','LHON','Ctl');

% JMDerror    = errorbar(X, JMD.fa,JMD.FAse ,'Color',c(1,:));
% congMDerror = errorbar(X, congMD.fa,congMD.FAse ,'Color',c(2,:));
CRDerror    = errorbar(X, CRD.rd, CRD.RDse ,'Color',c(3,:));
LHONerror   = errorbar(X, LHON.rd, LHON.RDse ,'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl.rd, Ctl.RDse ,'Color',[0.5,0.5,0.5]);
axis([0, 100, 0.45, 0.8]);
% set(gcf, )
xlabel('Location','fontName','Times','fontSize',14);
ylabel('Radial Diffusivity','fontName','Times','fontSize',14);
title('Optic Radiation across groups','fontName','Times','fontSize',14);

hold off;

%% save the figure in .eps
% % Figure を 1024x768 のeps形式で
% % "fig.eps" に保存する例
% width  = 410;
% height =307;
% set(gcf,'PaperPositionMode','auto')
% pos=get(gcf,'Position');
% pos(3)=width-1; %なぜか幅が1px増えるので対処
% pos(4)=height;
% set(gcf,'Position',pos);
print(gcf,'-depsc','B_OR_RD_group_comaprison_6LHON_5CRD_8Ctl.eps');


%%%%%%%%%%%%%%%%
% b-optic tract
%%%%%%%%%%%%%%%%
%% all

JMD.fa = (nansum(afq.vals.fa{24}(1:9,:),1)+nansum(afq.vals.fa{25}(1:9,:),1))/17;
JMD.md = (nansum(afq.vals.md{24}(1:9,:),1)+nansum(afq.vals.md{25}(1:9,:),1))/17;
JMD.ad = (nansum(afq.vals.ad{24}(1:9,:),1)+nansum(afq.vals.ad{25}(1:9,:),1))/17;
JMD.rd = (nansum(afq.vals.rd{24}(1:9,:),1)+nansum(afq.vals.rd{25}(1:9,:),1))/17;

% se
JMD.FAse = nanstd(vertcat(afq.vals.fa{24}(1:9,:),afq.vals.fa{25}(1:9,:)),1)/sqrt(17);
JMD.MDse = nanstd(vertcat(afq.vals.md{24}(1:9,:),afq.vals.md{25}(1:9,:)),1)/sqrt(17);
JMD.ADse = nanstd(vertcat(afq.vals.ad{24}(1:9,:),afq.vals.ad{25}(1:9,:)),1)/sqrt(17);
JMD.RDse = nanstd(vertcat(afq.vals.rd{24}(1:9,:),afq.vals.rd{25}(1:9,:)),1)/sqrt(17);

% congenitalMD 1:4
congMD.fa = (nansum(afq.vals.fa{24}(1:4,:),1)+nansum(afq.vals.fa{25}(1:4,:),1))/8;
congMD.md = (nansum(afq.vals.md{24}(1:4,:),1)+nansum(afq.vals.md{25}(1:4,:),1))/8;
congMD.ad = (nansum(afq.vals.ad{24}(1:4,:),1)+nansum(afq.vals.ad{25}(1:4,:),1))/8;
congMD.rd = (nansum(afq.vals.rd{24}(1:4,:),1)+nansum(afq.vals.rd{25}(1:4,:),1))/8;
% se
congMD.FAse = nanstd(vertcat(afq.vals.fa{24}(1:4,:),afq.vals.fa{25}(1:4,:)),1)/sqrt(8);
congMD.MDse = nanstd(vertcat(afq.vals.md{24}(1:4,:),afq.vals.md{25}(1:4,:)),1)/sqrt(8);
congMD.ADse = nanstd(vertcat(afq.vals.ad{24}(1:4,:),afq.vals.ad{25}(1:4,:)),1)/sqrt(8);
congMD.RDse = nanstd(vertcat(afq.vals.rd{24}(1:4,:),afq.vals.rd{25}(1:4,:)),1)/sqrt(8);

% CRD 5:9
CRD.fa = (nansum(afq.vals.fa{24}(5:9,:),1)+nansum(afq.vals.fa{25}(5:9,:),1))/9;
CRD.md = (nansum(afq.vals.md{24}(5:9,:),1)+nansum(afq.vals.md{25}(5:9,:),1))/9;
CRD.ad = (nansum(afq.vals.ad{24}(5:9,:),1)+nansum(afq.vals.ad{25}(5:9,:),1))/9;
CRD.rd = (nansum(afq.vals.rd{24}(5:9,:),1)+nansum(afq.vals.rd{25}(5:9,:),1))/9;
% se
CRD.FAse = nanstd(vertcat(afq.vals.fa{24}(5:9,:),afq.vals.fa{25}(5:9,:)),1)/sqrt(9);
CRD.MDse = nanstd(vertcat(afq.vals.md{24}(5:9,:),afq.vals.md{25}(5:9,:)),1)/sqrt(9);
CRD.ADse = nanstd(vertcat(afq.vals.ad{24}(5:9,:),afq.vals.ad{25}(5:9,:)),1)/sqrt(9);
CRD.RDse = nanstd(vertcat(afq.vals.rd{24}(5:9,:),afq.vals.rd{25}(5:9,:)),1)/sqrt(9);

% LHON
LHON.fa = (nansum(afq.vals.fa{24}(10:15,:),1)+nansum(afq.vals.fa{25}(10:15,:),1))/12;
LHON.md = (nansum(afq.vals.md{24}(10:15,:),1)+nansum(afq.vals.md{25}(10:15,:),1))/12;
LHON.ad = (nansum(afq.vals.ad{24}(10:15,:),1)+nansum(afq.vals.ad{25}(10:15,:),1))/12;
LHON.rd = (nansum(afq.vals.rd{24}(10:15,:),1)+nansum(afq.vals.rd{25}(10:15,:),1))/12;
% se
LHON.FAse = nanstd(vertcat(afq.vals.fa{24}(10:15,:),afq.vals.fa{25}(10:15,:)),1)/sqrt(12);
LHON.MDse = nanstd(vertcat(afq.vals.md{24}(10:15,:),afq.vals.md{25}(10:15,:)),1)/sqrt(12);
LHON.ADse = nanstd(vertcat(afq.vals.ad{24}(10:15,:),afq.vals.ad{25}(10:15,:)),1)/sqrt(12);
LHON.RDse = nanstd(vertcat(afq.vals.rd{24}(10:15,:),afq.vals.rd{25}(10:15,:)),1)/sqrt(12);

% Control
Ctl.fa = (nansum(afq.vals.fa{24}(16:23,:),1)+nansum(afq.vals.fa{25}(16:23,:),1))/16;
Ctl.md = (nansum(afq.vals.md{24}(16:23,:),1)+nansum(afq.vals.md{25}(16:23,:),1))/16;
Ctl.ad = (nansum(afq.vals.ad{24}(16:23,:),1)+nansum(afq.vals.ad{25}(16:23,:),1))/16;
Ctl.rd = (nansum(afq.vals.rd{24}(16:23,:),1)+nansum(afq.vals.rd{25}(16:23,:),1))/16;
% se
Ctl.FAse = nanstd(vertcat(afq.vals.fa{24}(16:23,:),afq.vals.fa{25}(16:23,:)),1)/sqrt(16);
Ctl.MDse = nanstd(vertcat(afq.vals.fa{24}(16:23,:),afq.vals.fa{25}(16:23,:)),1)/sqrt(16);
Ctl.ADse = nanstd(vertcat(afq.vals.fa{24}(16:23,:),afq.vals.fa{25}(16:23,:)),1)/sqrt(16);
Ctl.RDse = nanstd(vertcat(afq.vals.fa{24}(16:23,:),afq.vals.fa{25}(16:23,:)),1)/sqrt(16);


%% FA 6LHON_5CRD_8Ctl group comparison across LHON, 5CRD, and Control

figure; hold on;

% JMDmean   = plot(X,JMD.fa,'Color',c(1,:),'Linewidth',2);
% congMDmean = plot(X,congMD.fa,'Color',c(2,:),'Linewidth',2);
CRDmean    = plot(X,CRD.fa,'Color',c(3,:),'Linewidth',2);
LHONmean   = plot(X,LHON.fa,'Color',c(4,:),'Linewidth',2);
Ctlmean    = plot(X,Ctl.fa,'Color',[0.5,0.5,0.5] ,'Linewidth',2);

% legend('JMD','LHON','Ctl');

% JMDerror    = errorbar(X, JMD.fa,JMD.FAse ,'Color',c(1,:));
% congMDerror = errorbar(X, congMD.fa,congMD.FAse ,'Color',c(2,:));
CRDerror    = errorbar(X, CRD.fa, CRD.FAse ,'Color',c(3,:));
LHONerror   = errorbar(X, LHON.fa, LHON.FAse ,'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl.fa, Ctl.FAse ,'Color',[0.5,0.5,0.5]);
axis([0, 100, 0.1, 0.6]);
% set(gcf, )
xlabel('Location','fontName','Times','fontSize',14);
ylabel('Fractional Anisotropy','fontName','Times','fontSize',14);
title('Optic Tract across groups','fontName','Times','fontSize',14);

hold off;

%% save the figure in .eps
print(gcf,'-depsc','B_OT_FA_group_comaprison_6LHON_5CRD_8Ctl.eps');



%% RD 6LHON_5CRD_8Ctl group comparison across LHON, 5CRD, and Control

figure; hold on;

% JMDmean   = plot(X,JMD.fa,'Color',c(1,:),'Linewidth',2);
% congMDmean = plot(X,congMD.fa,'Color',c(2,:),'Linewidth',2);
CRDmean    = plot(X,CRD.rd,'Color',c(3,:),'Linewidth',2);
LHONmean   = plot(X,LHON.rd,'Color',c(4,:),'Linewidth',2);
Ctlmean    = plot(X,Ctl.rd,'Color',[0.5,0.5,0.5],'Linewidth',2);

% legend('JMD','LHON','Ctl');

% JMDerror    = errorbar(X, JMD.fa,JMD.FAse ,'Color',c(1,:));
% congMDerror = errorbar(X, congMD.fa,congMD.FAse ,'Color',c(2,:));
CRDerror    = errorbar(X, CRD.rd, CRD.RDse ,'Color',c(3,:));
LHONerror   = errorbar(X, LHON.rd, LHON.RDse ,'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl.rd, Ctl.RDse ,'Color',[0.5,0.5,0.5]);
axis([0, 100, 0.6, 1.41]);
% set(gcf, )
xlabel('Location','fontName','Times','fontSize',14);
ylabel('Radial Diffusivity','fontName','Times','fontSize',14);
title('Optic Tract across groups','fontName','Times','fontSize',14);

hold off;

%% save the figure in .eps
% % "fig.eps" に保存する例
% width  = 410;
% height =307;
% set(gcf,'PaperPositionMode','auto')
% pos=get(gcf,'Position');
% pos(3)=width-1; %なぜか幅が1px増えるので対処
% pos(4)=height;
% set(gcf,'Position',pos);
% print('-r0','-depsc','B_OT_RD_group_comaprison_6LHON_5CRD_8Ctl.eps');

print(gcf,'-depsc','B_OT_RD_group_comaprison_6LHON_5CRD_8Ctl.eps');


%% MD 6LHON_5CRD_8Ctl group comparison across LHON, 5CRD, and Control

figure; hold on;

% JMDmean   = plot(X,JMD.fa,'Color',c(1,:),'Linewidth',2);
% congMDmean = plot(X,congMD.fa,'Color',c(2,:),'Linewidth',2);
CRDmean    = plot(X,CRD.md,'Color',c(3,:),'Linewidth',2);
LHONmean   = plot(X,LHON.md,'Color',c(4,:),'Linewidth',2);
Ctlmean    = plot(X,Ctl.md,'Color',[0.5,0.5,0.5],'Linewidth',2);

% legend('JMD','LHON','Ctl');

% JMDerror    = errorbar(X, JMD.fa,JMD.FAse ,'Color',c(1,:));
% congMDerror = errorbar(X, congMD.fa,congMD.FAse ,'Color',c(2,:));
CRDerror    = errorbar(X, CRD.md, CRD.MDse ,'Color',c(3,:));
LHONerror   = errorbar(X, LHON.md, LHON.MDse ,'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl.md, Ctl.MDse ,'Color',[0.5,0.5,0.5]);
axis([0, 100, 0.8, 1.6]);
% set(gcf, )
xlabel('Location','fontName','Times','fontSize',14);
ylabel('Mean Diffusivity','fontName','Times','fontSize',14);
title('Optic Tract across groups','fontName','Times','fontSize',14);

hold off;

%% save the figure in .eps

print(gcf,'-depsc','B_OT_MD_group_comaprison_6LHON_5CRD_8Ctl.eps');


%% RD 6LHON_5CRD_8Ctl group comparison across LHON, 5CRD, and Control

figure; hold on;

% JMDmean   = plot(X,JMD.fa,'Color',c(1,:),'Linewidth',2);
% congMDmean = plot(X,congMD.fa,'Color',c(2,:),'Linewidth',2);
CRDmean    = plot(X,CRD.rd,'Color',c(3,:),'Linewidth',2);
LHONmean   = plot(X,LHON.rd,'Color',c(4,:),'Linewidth',2);
Ctlmean    = plot(X,Ctl.rd,'Color',[0.4,0.4,0.4],'Linewidth',2);

% legend('JMD','LHON','Ctl');

% JMDerror    = errorbar(X, JMD.fa,JMD.FAse ,'Color',c(1,:));
% congMDerror = errorbar(X, congMD.fa,congMD.FAse ,'Color',c(2,:));
CRDerror    = errorbar(X, CRD.rd, CRD.RDse ,'Color',c(3,:));
LHONerror   = errorbar(X, LHON.rd, LHON.RDse ,'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl.rd, Ctl.RDse ,'Color',[0.5,0.5,0.5]);
axis([0, 100, 0.5, 1.5]);
% set(gcf, )
xlabel('Location','fontName','Times','fontSize',14);
ylabel('Radial Diffusivity','fontName','Times','fontSize',14);
title('Optic tract across groups','fontName','Times','fontSize',14);

hold off;

%% save the figure in .eps
print(gcf,'-depsc','B_OT_RD_group_comaprison_6LHON_5CRD_8Ctl.eps');

% print('-r0','-depsc','B_OR_RD_group_comaprison_6LHON_5CRD_8Ctl.eps');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% volume
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% check fiber direction
c =lines(24)
for j = 21:28
    figure ;hold on;
    for i = 1:23
        plot(X,afq.vals.volume{j}(i,1:100),'color',c(i,:));
    end
    hold off;
    
end


%% R-OR
X = 1:100;
CRD_vol  = mean(afq.vals.volume{21}(5:9,1:100));
LHON_vol = mean(afq.vals.volume{21}(10:15,1:100));
Ctl_vol  = mean(afq.vals.volume{21}(16:23,1:100));
c = lines(24);



figure ;hold on;
crd  = plot(X,CRD_vol,'Color',c(3,:),'Linewidth',2);
lhon = plot(X,LHON_vol,'Color',c(4,:),'Linewidth',2);
ctl  = plot(X,Ctl_vol,'Color',[0.5,0.5,0.5],'Linewidth',2);

legend('CRD','LHON','Ctl');

% plot(X,afq.vals.volume{21}(1,1:100),'Linewidth',3);
% plot(X,afq.vals.volume{21}(2,1:100),'Linewidth',3);
% for i =3:23
% plot(X,afq.vals.volume{21}(i,1:100));
% end


CRDerror    = errorbar(X, CRD_vol, std(afq.vals.volume{21}(5:9,1:100))/sqrt(5) ,...
    'Color',c(3,:));
LHONerror   = errorbar(X, LHON_vol, std(afq.vals.volume{21}(10:15,1:100))/sqrt(6) ,...
    'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl_vol, std(afq.vals.volume{21}(16:23,1:100))/sqrt(8) ,...
    'Color',[0.5,0.5,0.5]);

axis([0, 100, 0, 4000]);


xlabel('Location','fontName','Times','fontSize',14);
ylabel('Volume [mm^3]','fontName','Times','fontSize',14);
title('R-Optic Radiation across groups','fontName','Times','fontSize',14);

%% save the figure in .eps
% Figure を 1024x768 のeps形式で
% "fig.eps" に保存する例
width  = 410;
height =307;
set(gcf,'PaperPositionMode','auto')
pos=get(gcf,'Position');
pos(3)=width-1; %なぜか幅が1px増えるので対処
pos(4)=height;
set(gcf,'Position',pos);
print('-r0','-depsc','R_OR_Volume_6LHON_5CRD_8Ctl.eps');


%% LOR
X = 1:100;
CRD_vol  = mean(afq.vals.volume{22}(5:9,1:100));
LHON_vol = mean(afq.vals.volume{22}(10:15,1:100));
Ctl_vol  = mean(afq.vals.volume{22}(16:23,1:100));
c = lines(24);
figure ;hold on;
crd  = plot(X,CRD_vol,'Color',c(3,:),'Linewidth',2);
lhon = plot(X,LHON_vol,'Color',c(4,:),'Linewidth',2);
ctl  = plot(X,Ctl_vol,'Color',[0.5,0.5,0.5],'Linewidth',2);

legend('CRD','LHON','Ctl');

CRDerror    = errorbar(X, CRD_vol, std(afq.vals.volume{21}(5:9,1:100))/sqrt(5) ,...
    'Color',c(3,:));
LHONerror   = errorbar(X, LHON_vol, std(afq.vals.volume{21}(10:15,1:100))/sqrt(6) ,...
    'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl_vol, std(afq.vals.volume{21}(16:23,1:100))/sqrt(8) ,...
    'Color',[0.5,0.5,0.5]);

axis([0, 100, 0, 3000]);


xlabel('Location','fontName','Times','fontSize',14);
ylabel('Volume [mm^3]','fontName','Times','fontSize',14);
title('L-Optic Radiation across groups','fontName','Times','fontSize',14);


% %% check fiber direction
% figure ;hold on;
% for i = 1:23
% plot(X,afq.vals.volume{22}(i,1:100));
% end



%% save the figure in .eps
% Figure を 1024x768 のeps形式で
% "fig.eps" に保存する例
width  = 410;
height =307;
set(gcf,'PaperPositionMode','auto')
pos=get(gcf,'Position');
pos(3)=width-1; %なぜか幅が1px増えるので対処
pos(4)=height;
set(gcf,'Position',pos);
print('-r0','-depsc','L_OR_Volume_6LHON_5CRD_8Ctl.eps');

%% B-OR
X = 1:100;
CRD_vol  = mean(afq.vals.volume{22}(5:9,1:100)+afq.vals.volume{21}(5:9,1:100))/2;
LHON_vol = mean(afq.vals.volume{22}(10:15,1:100)+afq.vals.volume{21}(10:15,1:100))/2;
Ctl_vol  = mean(afq.vals.volume{22}(16:23,1:100)+afq.vals.volume{21}(16:23,1:100))/2;
c = lines(24);
figure ;hold on;
crd  = plot(X,CRD_vol,'Color',c(3,:),'Linewidth',2);
lhon = plot(X,LHON_vol,'Color',c(4,:),'Linewidth',2);
ctl  = plot(X,Ctl_vol,'Color',[0.5,0.5,0.5],'Linewidth',2);

% legend('JMD','LHON','Ctl');

CRDerror    = errorbar(X, CRD_vol, std(afq.vals.volume{21}(5:9,1:100))/sqrt(5) ,...
    'Color',c(3,:));
LHONerror   = errorbar(X, LHON_vol, std(afq.vals.volume{21}(10:15,1:100))/sqrt(6) ,...
    'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl_vol, std(afq.vals.volume{21}(16:23,1:100))/sqrt(8) ,...
    'Color',[0.5,0.5,0.5]);

axis([0, 100, 0, 3000]);


xlabel('Location','fontName','Times','fontSize',14);
ylabel('Volume [mm^3]','fontName','Times','fontSize',14);
title('Optic Radiation across groups','fontName','Times','fontSize',14);


% %% check fiber direction
% figure ;hold on;
% for i = 1:23
% plot(X,afq.vals.volume{22}(i,1:100));
% end

%% save the figure in .eps

print(gcf,'-depsc','B_OR_Volume_6LHON_5CRD_8Ctl.eps');

%% R-OT

X = 1:100;

CRD_vol  = nanmean(afq.vals.volume{24}(5:9,1:100));
LHON_vol = nanmean(afq.vals.volume{24}(10:15,1:100));
Ctl_vol  = mean(afq.vals.volume{24}(16:23,1:100));

c = lines(24);
figure ;hold on;

crd  = plot(X,CRD_vol,'Color',c(3,:),'Linewidth',2);
lhon = plot(X,LHON_vol,'Color',c(4,:),'Linewidth',2);
ctl  = plot(X,Ctl_vol,'Color',[0.5,0.5,0.5],'Linewidth',2);

legend('JMD','LHON','Ctl');

CRDerror    = errorbar(X, CRD_vol, nanstd(afq.vals.volume{24}(5:9,1:100))/sqrt(4) ,...
    'Color',c(3,:));
LHONerror   = errorbar(X, LHON_vol, std(afq.vals.volume{24}(10:15,1:100))/sqrt(6) ,...
    'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl_vol, std(afq.vals.volume{24}(16:23,1:100))/sqrt(8) ,...
    'Color',[0.5,0.5,0.5]);

axis([0, 100, 10, 60]);

xlabel('Location','fontName','Times','fontSize',14);
ylabel('Volume [mm^3]','fontName','Times','fontSize',14);
title('R-Optic Tract across groups','fontName','Times','fontSize',14);

%% save the figure in .eps
% Figure を 1024x768 のeps形式で
% "fig.eps" に保存する例
width  = 410;
height =307;
set(gcf,'PaperPositionMode','auto')
pos=get(gcf,'Position');
pos(3)=width-1; %なぜか幅が1px増えるので対処
pos(4)=height;
set(gcf,'Position',pos);
print('-r0','-depsc','R_OT_Volume_6LHON_5CRD_8Ctl.eps');

%% L-OT

X = 1:100;

CRD_vol  = nanmean(afq.vals.volume{25}(5:9,1:100));
LHON_vol = nanmean(afq.vals.volume{25}(10:15,1:100));
Ctl_vol  = mean(afq.vals.volume{25}(16:23,1:100));

c = lines(24);
figure ;hold on;

crd  = plot(X,CRD_vol,'Color',c(3,:),'Linewidth',2);
lhon = plot(X,LHON_vol,'Color',c(4,:),'Linewidth',2);
ctl  = plot(X,Ctl_vol,'Color',[0.5,0.5,0.5],'Linewidth',2);

legend('JMD','LHON','Ctl');

CRDerror    = errorbar(X, CRD_vol, nanstd(afq.vals.volume{25}(5:9,1:100))/sqrt(5) ,...
    'Color',c(3,:));
LHONerror   = errorbar(X, LHON_vol, std(afq.vals.volume{25}(10:15,1:100))/sqrt(6) ,...
    'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl_vol, std(afq.vals.volume{25}(16:23,1:100))/sqrt(8) ,...
    'Color',[0.5,0.5,0.5]);

axis([0, 100, 10, 60]);

xlabel('Location','fontName','Times','fontSize',14);
ylabel('Volume [mm^3]','fontName','Times','fontSize',14);
title('L-Optic Tract across groups','fontName','Times','fontSize',14);

%% save the figure in .eps
% Figure を 1024x768 のeps形式で
% "fig.eps" に保存する例
width  = 410;
height =307;
set(gcf,'PaperPositionMode','auto')
pos=get(gcf,'Position');
pos(3)=width-1; %なぜか幅が1px増えるので対処
pos(4)=height;
set(gcf,'Position',pos);
print('-r0','-depsc','L_OT_Volume_6LHON_5CRD_8Ctl.eps');

%% B-OT

X = 1:100;

CRD_vol  = nanmean(afq.vals.volume{25}(5:9,1:100)+afq.vals.volume{24}(5:9,1:100))/2;
LHON_vol = mean(afq.vals.volume{25}(10:15,1:100)+afq.vals.volume{24}(10:15,1:100))/2;
Ctl_vol  = mean(afq.vals.volume{25}(16:23,1:100)+afq.vals.volume{24}(16:23,1:100))/2;

c = lines(24);
figure ;hold on;%% B-OT

X = 1:100;

CRD_vol  = nanmean(afq.vals.volume{25}(5:9,1:100)+afq.vals.volume{24}(5:9,1:100))/2;
LHON_vol = mean(afq.vals.volume{25}(10:15,1:100)+afq.vals.volume{24}(10:15,1:100))/2;
Ctl_vol  = mean(afq.vals.volume{25}(16:23,1:100)+afq.vals.volume{24}(16:23,1:100))/2;

c = lines(24);
figure ;hold on;

crd  = plot(X,CRD_vol,'Color',c(3,:),'Linewidth',2);
lhon = plot(X,LHON_vol,'Color',c(4,:),'Linewidth',2);
ctl  = plot(X,Ctl_vol,'Color',[0.5,0.5,0.5],'Linewidth',2);

legend('JMD','LHON','Ctl');

CRDerror    = errorbar(X, CRD_vol, nanstd(afq.vals.volume{25}(5:9,1:100))/sqrt(5) ,...
    'Color',c(3,:));
LHONerror   = errorbar(X, LHON_vol, std(afq.vals.volume{25}(10:15,1:100))/sqrt(6) ,...
    'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl_vol, std(afq.vals.volume{25}(16:23,1:100))/sqrt(8) ,...
    'Color',[0.5,0.5,0.5]);

axis([0, 100, 10, 60]);

xlabel('Location','fontName','Times','fontSize',14);
ylabel('Volume [mm^3]','fontName','Times','fontSize',14);
title('Optic Tract across groups','fontName','Times','fontSize',14);

%% save the figure in .eps
print(gcf,'-depsc','B_OT_Volume_6LHON_5CRD_8Ctl.eps');

crd  = plot(X,CRD_vol,'Color',c(3,:),'Linewidth',2);
lhon = plot(X,LHON_vol,'Color',c(4,:),'Linewidth',2);
ctl  = plot(X,Ctl_vol,'Color',[0.5,0.5,0.5],'Linewidth',2);

legend('JMD','LHON','Ctl');

CRDerror    = errorbar(X, CRD_vol, nanstd(afq.vals.volume{25}(5:9,1:100))/sqrt(5) ,...
    'Color',c(3,:));
LHONerror   = errorbar(X, LHON_vol, std(afq.vals.volume{25}(10:15,1:100))/sqrt(6) ,...
    'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl_vol, std(afq.vals.volume{25}(16:23,1:100))/sqrt(8) ,...
    'Color',[0.5,0.5,0.5]);

axis([0, 100, 10, 60]);

xlabel('Location','fontName','Times','fontSize',14);
ylabel('Volume [mm^3]','fontName','Times','fontSize',14);
title('Optic Tract across groups','fontName','Times','fontSize',14);

%% save the figure in .eps
print(gcf,'-depsc','B_OT_Volume_6LHON_5CRD_8Ctl.eps');

%% OCF

X = 1:100;

CRD_vol  = nanmean(afq.vals.volume{26}(5:9,1:100));
LHON_vol = nanmean(afq.vals.volume{26}(10:15,1:100));{23}
Ctl_vol  = mean(afq.vals.volume{26}(16:23,1:100));

c = lines(24);
figure ;hold on;

crd  = plot(X,CRD_vol,'Color',c(3,:),'Linewidth',2);
lhon = plot(X,LHON_vol,'Color',c(4,:),'Linewidth',2);
ctl  = plot(X,Ctl_vol,'Color',[0.5,0.5,0.5],'Linewidth',2);

legend('JMD','LHON','Ctl');

CRDerror    = errorbar(X, CRD_vol, nanstd(afq.vals.volume{26}(5:9,1:100))/sqrt(5) ,...
    'Color',c(3,:));
LHONerror   = errorbar(X, LHON_vol, std(afq.vals.volume{26}(10:15,1:100))/sqrt(6) ,...
    'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl_vol, std(afq.vals.volume{26}(16:23,1:100))/sqrt(8) ,...
    'Color',[0.5,0.5,0.5]);

axis([0, 100, 0, 7000]);

xlabel('Location','fontName','Times','fontSize',14);{23}
ylabel('Volume [mm^3]','fontName','Times','fontSize',14);
title('OCF across groups','fontName','Times','fontSize',14);

%% save the figure in .eps

print(gcf,'-depsc','OCF_Volume_6LHON_5CRD_8Ctl.eps');


%% R-OCF

X = 1:100;

CRD_vol  = nanmean(afq.vals.volume{27}(5:9,1:100));
LHON_vol = nanmean(afq.vals.volume{27}(10:15,1:100));
Ctl_vol  = mean(afq.vals.volume{27}(16:23,1:100));

c = lines(28);
figure ;hold on;

crd  = plot(X,CRD_vol,'Color',c(3,:),'Linewidth',2);
lhon = plot(X,LHON_vol,'Color',c(4,:),'Linewidth',2);
ctl  = plot(X,Ctl_vol,'Color',[0.5,0.5,0.5],'Linewidth',2);

% legend('JMD','LHON','Ctl');

CRDerror    = errorbar(X, CRD_vol, nanstd(afq.vals.volume{27}(5:9,1:100))/sqrt(4) ,...
    'Color',c(3,:));
LHONerror   = errorbar(X, LHON_vol, std(afq.vals.volume{27}(10:15,1:100))/sqrt(6) ,...
    'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl_vol, std(afq.vals.volume{27}(16:23,1:100))/sqrt(8) ,...
    'Color',[0.5,0.5,0.5]);

axis([0, 100, 0, 12000]);

xlabel('Location','fontName','Times','fontSize',14);
ylabel('Volume [mm^3]','fontName','Times','fontSize',14);
title('R-OCF across groups','fontName','Times','fontSize',14);

%% save the figure in .eps
%
% width  = 410;
% height =307;
% set(gcf,'PaperPositionMode','auto')
% pos=get(gcf,'Position');
% pos(3)=width-1;
% pos(4)=height;
% set(gcf,'Position',pos);
print('-r0','-depsc','R_OCF_Volume_6LHON_5CRD_8Ctl.eps');

%% L-OCF

X = 1:100;

CRD_vol  = nanmean(afq.vals.volume{26}(5:9,1:100));
LHON_vol = nanmean(afq.vals.volume{26}(10:15,1:100));
Ctl_vol  = mean(afq.vals.volume{26}(16:23,1:100));

c = lines(24);
figure ;hold on;

crd  = plot(X,CRD_vol,'Color',c(3,:),'Linewidth',2);
lhon = plot(X,LHON_vol,'Color',c(4,:),'Linewidth',2);
ctl  = plot(X,Ctl_vol,'Color',[0.5,0.5,0.5],'Linewidth',2);

legend('JMD','LHON','Ctl');

CRDerror    = errorbar(X, CRD_vol, nanstd(afq.vals.volume{26}(5:9,1:100))/sqrt(5) ,...
    'Color',c(3,:));
LHONerror   = errorbar(X, LHON_vol, std(afq.vals.volume{26}(10:15,1:100))/sqrt(6) ,...
    'Color',c(4,:));
Ctlerror    = errorbar(X, Ctl_vol, std(afq.vals.volume{26}(16:23,1:100))/sqrt(8) ,...
    'Color',[0.5,0.5,0.5]);

axis([0, 100, 0, 12000]);

xlabel('Location','fontName','Times','fontSize',14);
ylabel('Volume [mm^3]','fontName','Times','fontSize',14);
title('L-OCF across groups','fontName','Times','fontSize',14);

%% save the figure in .eps
% Figure を 1024x768 のeps形式で
% "fig.eps" に保存する例
width  = 410;
height =307;
set(gcf,'PaperPositionMode','auto')
pos=get(gcf,'Position');
pos(3)=width-1; %なぜか幅が1px増えるので対処
pos(4)=height;
set(gcf,'Position',pos);
print('-r0','-depsc','L_OCF_Volume_6LHON_5CRD_8Ctl.eps');




