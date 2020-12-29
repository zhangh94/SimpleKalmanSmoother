function [] = PlotForwardEstimates( in )
%PLOTRAWMEASUREMENTS Summary of this function goes here
%   Detailed explanation goes here

hTabGroup   = in.hTabGroup;
t           = in.t;
dt          = in.dt;
aTruth      = in.aTruth;
vTruth      = in.vTruth;
hTruth      = in.hTruth;
aKff        = in.aKff;
vKff        = in.vKff;
hKff        = in.hKff;

errKff   	= in.errKff;
rmsErrKff 	= in.rmsErrKff;
avgErrKff  	= in.avgErrKff;
trimTime    = in.trimTime;

ylabels     = {'Acceleration [m/s/s]','Velocity [m/s]','Height [m]'};
yErrLabels  = {'Error [m/s/s]','Error [m/s]','Error [m]'};
legendUnits = {'m/s^2','m/s','m'};
titles      = {'Vertical Acceleration','Vertical Velocity','Height'};
%%
newTab      = uitab('parent',hTabGroup,'title','FwdEst');axes('Parent',newTab);
subplot(311);hold on;grid on
title('Kf Forward Filtered vs Truth Vertical Acceleration')
plot(t,aKff)
plot(t,aTruth,'k')
xlabel('Time [s]')
ylabel('Acceleration [m/s/s]')
legend('KfFwd Estimate','Truth','location','best')

subplot(312);hold on;grid on
title('Kf Forward Filtered vs Truth Vertical Velocity')
plot(t,vKff)
plot(t,vTruth,'k')
xlabel('Time [s]')
ylabel('Velocity [m/s]')
legend('KfFwd Estimate','Truth','location','best')

subplot(313);hold on;grid on
title('Kf Forward Filtered vs Truth Height')
plot(t,hKff)
plot(t,hTruth,'k')
xlabel('Time [s]')
ylabel('Height [m]')
legend('KfFwd Estimate','Truth','location','best')

%%
newTab      = uitab('parent',hTabGroup,'title','FwdEstAErr');axes('Parent',newTab);
n           = 1;
subplot(211);hold on;grid on
title(['Kf Forward Filtered vs Truth ' titles{n}])
plot(t,aKff)
plot(t,aTruth,'k')
xlabel('Time [s]')
ylabel(ylabels{n})
legend('KfFwd Estimate','Truth','location','best')

subplot(212);hold on;grid on
title(['KfFwd ' titles{n} ' Sensor Error'])
plot(t,errKff(:,n))
xlabel('Time [s]')
ylabel(yErrLabels{n})
legend(['Err: ' num2str(round(rmsErrKff(n),2)) ....
    ' (' num2str(round(rms(errKff(trimTime/dt:end,n)),2)) ')' legendUnits{n} ' RMS, ' ...
    num2str(round(avgErrKff(n),2)) legendUnits{n} ' avg'],'location','best')

%%
newTab      = uitab('parent',hTabGroup,'title','FwdEstVErr');axes('Parent',newTab);
n           = 2;
subplot(211);hold on;grid on
title(['Kf Forward Filtered vs Truth ' titles{n}])
plot(t,vKff)
plot(t,vTruth,'k')
xlabel('Time [s]')
ylabel(ylabels{n})
legend('KfFwd Estimate','Truth','location','best')

subplot(212);hold on;grid on
title(['KfFwd ' titles{n} ' Sensor Error'])
plot(t,errKff(:,n))
xlabel('Time [s]')
ylabel(yErrLabels{n})
legend(['Err: ' num2str(round(rmsErrKff(n),2)) ....
    ' (' num2str(round(rms(errKff(trimTime/dt:end,n)),2)) ')' legendUnits{n} ' RMS, ' ...
    num2str(round(avgErrKff(n),2)) legendUnits{n} ' avg'],'location','best')

%%
newTab      = uitab('parent',hTabGroup,'title','FwdEstHErr');axes('Parent',newTab);
n           = 3;
subplot(211);hold on;grid on
title(['Kf Forward Filtered vs Truth ' titles{n}])
plot(t,hKff)
plot(t,hTruth,'k')
xlabel('Time [s]')
ylabel(ylabels{n})
legend('KfFwd Estimate','Truth','location','best')

subplot(212);hold on;grid on
title(['KfFwd ' titles{n} ' Sensor Error'])
plot(t,errKff(:,n))
xlabel('Time [s]')
ylabel(yErrLabels{n})
legend(['Err: ' num2str(round(rmsErrKff(n),2)) ....
    ' (' num2str(round(rms(errKff(trimTime/dt:end,n)),2)) ')' legendUnits{n} ' RMS, ' ...
    num2str(round(avgErrKff(n),2)) legendUnits{n} ' avg'],'location','best')
end