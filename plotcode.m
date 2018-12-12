%% figure2
%normalize data with rhodamine b
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

% Create axes
axes1 = axes('Parent',figure1,...
    'Position',[0.13 0.583837209302326 0.775 0.341162790697675]);
hold(axes1,'on');

% Activate the left side of the axes
yyaxis(axes1,'left');
% Create plot
plot(TT,phi_mean,'Parent',axes1,'DisplayName','Continuized Hilbert Phase',...
    'Color',[1 0 0]);

% Create ylabel
ylabel('Hilbert Phase');

% Set the remaining axes properties
set(axes1,'YColor',[0 0 0]);
% Activate the right side of the axes
yyaxis(axes1,'right');
% Create plot
plot(TT,phi_J1_mean,'Parent',axes1,'DisplayName','Original Hilbert Phase',...
    'Color',[0 0 1]);

% Create ylabel
ylabel('Hilbert Phase');

% Set the remaining axes properties
set(axes1,'YColor',[0 0 0],'YDir','normal','YMinorTick','off','YScale',...
    'linear','YTick',...
    [-3.14159265358979 -1.5707963267949 0 1.5707963267949 3.14159265358979],...
    'YTickLabel',{'-\pi','-\pi/2','0','\pi/2','\pi'});
% Create xlabel
xlabel('Time (Hours)');

% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes1,[0 282]);
box(axes1,'on');
% Set the remaining axes properties
set(axes1,'FontName','Arial','FontSize',12,'XColor',[0 0 0],'ZColor',...
    [0 0 0]);
% Create legend
legend1 = legend(axes1,'show');
set(legend1,'Location','northwest','FontSize',11);

% Create subplot
subplot1 = subplot(2,1,2,'Parent',figure1);
hold(subplot1,'on');
angle = linspace(0, 2*pi, 360);
x = cos(angle);
y= sin(angle);

% Create plot
plot(x,y,'Parent',subplot1,'DisplayName','circle coordinate');
axis ('equal')
hold on
phi_J1_end = phi_J1(:,[end]);
xangle= cos(phi_J1_end);
yangle= sin(phi_J1_end);
% Create scatter
scatter(xangle,yangle,'DisplayName','original hilbert phase (angle)',...
    'Parent',subplot1);

box(subplot1,'on');
% Set the remaining axes properties
set(subplot1,'DataAspectRatio',[1 1 1],'PlotBoxAspectRatio',...
    [4.38300688415147 1 1]);
% Create legend
legend2 = legend(subplot1,'show');
set(legend2,'FontSize',11,'FontName','Arial');

