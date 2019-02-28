
%% figure2
%normalize data with rhodamine b
g=cell1;
p=RhB;
for i=1:size(g,2)
g(:,i)=g(:,i)./p';
end
%detrend the data
res=dtrndanl2(g);
%run hilbert phase code 
for i=1:size(res,1)
[phi(i,:),phi_J2(i,:),phi_adj(i,:),im_analytic_signal_x(i,:),re_analytic_signal_x(i,:)]= hilbert_phase(res(i,:));
end
phi_J1=atan2(im_analytic_signal_x,re_analytic_signal_x);
%average cells 
phi_mean= mean(phi,1);
phi_J1_mean=mean(phi_J1,1);

%start plot

T=0:length(phi_mean)-1;
TT=T*30/60;
figure1 = figure;

%plot single cell 318
subplot1 = subplot(3,1,1,'Parent',figure1);
hold(subplot1,'on');

% Activate the left side of the axes
yyaxis(subplot1,'left');
% Create plot
plot(TT,phi(318,:),'Parent',subplot1,...
    'DisplayName','Continuous Hilbert Phase for Cell 318',...
    'Color',[1 0 0]);

% Create ylabel
ylabel('Hilbert Phase');

% Set the remaining axes properties
set(subplot1,'YColor',[0 0 0]);
% Activate the right side of the axes
yyaxis(subplot1,'right');
% Create plot
plot(TT,phi_J1(318,:),'Parent',subplot1,...
    'DisplayName','Original Hilbert Phase for Cell 318',...
    'Color',[0 0 1]);

% Create ylabel
ylabel('Hilbert Phase');


% Set the remaining axes properties
set(subplot1,'YColor',[0 0 0],'YDir','normal','YMinorTick','off','YScale',...
    'linear','YTick',...
    [-3.14159265358979 -1.5707963267949 0 1.5707963267949 3.14159265358979],...
    'YTickLabel',{'-\pi','-\pi/2','0','\pi/2','\pi'});
% Create xlabel
xlabel('Time (Hours)');

% Create legend
legend1 = legend(subplot1,'show');
set(legend1,...
    'Position',[0.713858372709445 0.714296299838864 0.22343749452848 0.041524458528243]);

% Create subplot
subplot2 = subplot(3,1,2,'Parent',figure1);
hold(subplot2,'on');

% Activate the left side of the axes
yyaxis(subplot2,'left');
% Create plot
plot(TT,phi_mean,'Parent',subplot2,'DisplayName','Continuous Hilbert Phase',...
    'Color',[1 0 0]);

% Create ylabel
ylabel('Hilbert Phase');

% Set the remaining axes properties
set(subplot2,'YColor',[0 0 0]);
% Activate the right side of the axes
yyaxis(subplot2,'right');
% Create plot
plot(TT,phi_J1_mean,'Parent',subplot2,'DisplayName','Original Hilbert Phase',...
    'Color',[0 0 1]);

% Create ylabel
ylabel('Hilbert Phase');

% Set the remaining axes properties
set(subplot2,'YColor',[0 0 0],'YDir','normal','YMinorTick','off','YScale',...
    'linear','YTick',...
    [-3.14159265358979 -1.5707963267949 0 1.5707963267949 3.14159265358979],...
    'YTickLabel',{'-\pi','-\pi/2','0','\pi/2','\pi'});
% Create xlabel
xlabel('Time (Hours)');

box(subplot2,'on');
% Set the remaining axes properties
set(subplot2,'FontName','Arial','FontSize',12,'LineStyleOrderIndex',2,...
    'XColor',[0 0 0],'ZColor',[0 0 0]);
% Create legend
legend2 = legend(subplot2,'show');
set(legend2,'Location','northwest');

% Create axes
axes1 = axes('Parent',figure1,...
    'Position',[0.13 0.11 0.775 0.215735294117647]);
hold(axes1,'on');

% Create subplot
subplot3 = subplot(3,1,3,'Parent',figure1);
hold(subplot3,'on');
angle = linspace(0, 2*pi, 360);
x = cos(angle);
y= sin(angle);

% Create plot
plot(x,y,'Parent',subplot3,'DisplayName','circle coordinate');
axis ('equal')
hold on
phi_J1_end = phi_J1(:,[end]);
xangle= cos(phi_J1_end);
yangle= sin(phi_J1_end);
% Create scatter
scatter(xangle,yangle,'DisplayName','original hilbert phase (angle)',...
    'Parent',subplot3);

box(subplot3,'on');
% Set the remaining axes properties
set(subplot3,'DataAspectRatio',[1 1 1],'PlotBoxAspectRatio',...
    [4.38300688415147 1 1]);
% Create legend
legend3 = legend(subplot3,'show');
set(legend3,'FontSize',11,'FontName','Arial');

%% figure3
%normalize data with rhodamine b
g=cell1;
p=RhB;
for i=1:size(g,2)
g(:,i)=g(:,i)./p';
end
%detrend the data
res=dtrndanl2(g);
%run hilbert phase code 
for i=1:size(res,1)
[phi(i,:),phi_J2(i,:),phi_adj(i,:),im_analytic_signal_x(i,:),re_analytic_signal_x(i,:)]= hilbert_phase(res(i,:));
end
phi_J1=atan2(im_analytic_signal_x,re_analytic_signal_x);
%plot histogram of cell cycles
figure
delta_phi=(phi(:,563)-phi(:,1))/(2*pi);
histogram(delta_phi,'FaceColor',[1 0 0],'BinMethod','auto');
% Create xlabel
xlabel('Number of Cycles');
% Create ylabel
ylabel('Number of Cells');
box(axes1,'on');
% Set the remaining axes properties
set(axes1,'FontName','Arial','FontSize',14);
%% figure 4
z=linspace(0,562,563);
%input one cell data as a variable : cell1 
%input one cell data rhb as a variable : RhB
g=cell1;
p=RhB;
for i=1:size(g,2)
g(:,i)=g(:,i)./p';
end
%detrend the data
data1=dtrndanl2(g);
g1=mean(data1);
Za1=hilbertS(g1);
%input two cell data as a variable : cell2 
data2=dtrndanl2(cell2);
g2=mean(data2);
Za2=hilbertS(g2);
%plot
figure
plot3(real(Za2),imag(Za2),z,'Color','r','LineWidth',0.5)
hold on 
plot3(real(Za1),imag(Za1),z,'Color','k','LineWidth',0.5)
title('Analytic Signal')
legend('Two cell','One cell')
xlabel('Trajectory')
ylabel('Hilbert transform')
zlabel('Time (1/2h units)')
grid on
%% figure5
%normalize data with rhodamine b
g=cell1;
p=RhB;
for i=1:size(g,2)
g(:,i)=g(:,i)./p';
end
%detrend the data
res=dtrndanl2(g);
%run hilbert phase code 
for i=1:size(res,1)
[phi(i,:),phi_J2(i,:),phi_adj(i,:),im_analytic_signal_x(i,:),re_analytic_signal_x(i,:)]= hilbert_phase(res(i,:));
end
phi_J1=atan2(im_analytic_signal_x,re_analytic_signal_x);
%average cells
phi_mean= mean(phi,1);
T=0:length(phi_mean)-1;
TT=T*30/60;
%calculate phase
phi_mean_singlecell=(phi_mean-3.02188603455132)/(2*pi);
%plot phase
figure
plot(TT,phi_mean_singlecell,'DisplayName','single cell','LineWidth',3,'Color',[0 0 1]);
ylabel('Phase');
xlabel('Time(hours)')
legend('Single cell')
%% figure6
t=linspace(0,562,563);
%input 10, 1-cell (labeled random and expl): RanAndExpl 
%input 10-cell Hilbert phases (labeled expl and raw): ExplAndRaw
data1=mean(transpose(RanAndExpl));
data2=mean(transpose(ExplAndRaw));
figure
plot(t,data1,t,data2);
xlabel('Time (1/2h units)')
ylabel('Hilbert phase')
legend('1-cell','10-cell')
title('Phase plots of cells with no neighbors and 9 neighbors')
%% figure7
t=linspace(0,562,563);
% input Raw_simul: RawAndSimul
avg_droplet1=mean(transpose(RawAndSimul(:,1:10)));
avg_droplet2=mean(transpose(RawAndSimul(:,11:20)));
avg_droplet3=mean(transpose(RawAndSimul(:,21:30)));
figure
plot(t,data2,t,avg_droplet1,t,avg_droplet2,t,avg_droplet3)
xlabel('Time (1/2h units)')
ylabel('Hilbert phase')
legend('observed 10-cell droplets','model1 10-cell droplets','model2 10-cell droplets','model3 10-cell droplets')
title('Observed 10-cell droplets vs model 10-cell droplets')
