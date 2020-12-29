function [] = PlotBackwardEstimates( in )
%PLOTRAWMEASUREMENTS Summary of this function goes here
%   Detailed explanation goes here

hTabGroup   = in.hTabGroup;
t           = in.t;
dt          = in.dt;
truth     	= in.truth;
Kff         = in.Kff;
Kfb         = in.Kfb;
errKfb     	= in.errKfb;
rmsErrKfb   = in.rmsErrKfb;
avgErrKfb   = in.avgErrKfb;

trimTime    = in.trimTime;

ylabels     = {'Acceleration [m/s/s]','Velocity [m/s]','Height [m]'};
yErrLabels  = {'Error [m/s/s]','Error [m/s]','Error [m]'};
legendUnits = {'m/s^2','m/s','m'};
titles      = {'Vertical Acceleration','Vertical Velocity','Height'};
tabLabels   = {'BkEstAErr','BkEstVErr','BkEstHErr'};
%%
newTab      = uitab('parent',hTabGroup,'title','BkEst');axes('Parent',newTab);
for n = 1:3
    subplot(3,1,n);hold on;grid on
    title(['Kf Backward Smoothed vs Truth ' titles{n}])
    plot(t,Kfb(:,n))
    plot(t,truth(:,n),'k')
    xlabel('Time [s]')
    ylabel(ylabels{n})
    legend('KfFwd Estimate','Truth','location','best')
end

%%
for n = 1:3
    newTab      = uitab('parent',hTabGroup,'title',tabLabels{n});axes('Parent',newTab);
    
    subplot(3,1,1);hold on;grid on
    title(['Kf Backward Smoothed vs Truth ' titles{n}])
    plot(t,Kff(:,n))
    plot(t,truth(:,n),'k')
    xlabel('Time [s]')
    ylabel(ylabels{n})
    legend('KfFwd Estimate','Truth','location','best')
    
    subplot(3,1,2);hold on;grid on
    title(['KfFwd ' titles{n} ' Sensor Error'])
    plot(t,errKfb(:,n))
    xlabel('Time [s]')
    ylabel(yErrLabels{n})
    legend(['Err: ' num2str(round(rmsErrKfb(n),2)) ....
        ' (' num2str(round(rms(errKfb(trimTime/dt:end,n)),2)) ')' legendUnits{n} ' RMS, ' ...
        num2str(round(avgErrKfb(n),2)) legendUnits{n} ' avg'],'location','best')
    
    subplot(3,1,3);hold on;grid on;
    title(['Kf Fwd vs. Bk ' titles{n} ' Comparison'])
    plot(t,Kff(:,n),'x')
    plot(t,Kfb(:,n))
    xlabel('Time [s]')
    ylabel(yErrLabels{n})
    legend('Kf Forward Estimate','Kf Backward Estimate')
    
end
end