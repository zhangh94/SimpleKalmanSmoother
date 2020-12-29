function [] = PlotRawMeasurements( in )
%PLOTRAWMEASUREMENTS Summary of this function goes here
%   Detailed explanation goes here

hTabGroup   = in.hTabGroup;
t           = in.t;
a           = in.a;
aTruth      = in.aTruth;
v           = in.v;
vTruth      = in.vTruth;
h           = in.h;
hTruth      = in.hTruth;
errASensor  = in.errASensor;
errVSensor  = in.errVSensor;
errHSensor  = in.errHSensor;
rmsErrASensor = in.rmsErrASensor;
avgErrASensor = in.avgErrASensor;
rmsErrVSensor = in.rmsErrVSensor;
avgErrVSensor = in.avgErrVSensor;
rmsErrHSensor = in.rmsErrHSensor;
avgErrHSensor = in.avgErrHSensor;

%%
newTab      = uitab('parent',hTabGroup,'title','RawData');axes('Parent',newTab);
subplot(211);hold on;grid on
title('Measured Vertical Acceleration')
plot(t,a)
plot(t,aTruth,'k')
xlabel('Time [s]')
ylabel('Acceleration [m/s/s]')
legend('Sensor Measurement','Truth','location','best')

subplot(212);hold on;grid on
title('Measured Vertical Height')
plot(t,h)
plot(t,hTruth,'k');
xlabel('Time [s]')
ylabel('Height [m]')
legend('Sensor Measurement','Truth','location','best')

newTab      = uitab('parent',hTabGroup,'title','RawAErr');axes('Parent',newTab);
subplot(211);hold on;grid on
title('Measured and Truth Vertical Acceleration')
plot(t,a)
plot(t,aTruth,'k')
xlabel('Time [s]')
ylabel('Acceleration [m/s/s]')
legend('Sensor Measurement','Truth','location','best')

subplot(212);hold on;grid on
title('Raw Acceleration Sensor Error')
plot(t,errASensor)
xlabel('Time [s]')
ylabel('Error [m/s/s]')
legend(['Err: ' num2str(round(rmsErrASensor,2)) ...
    ' (' num2str(round(rms(errASensor(end-18*100:end)),2)) ')m/s^2 RMS, '...
    num2str(round(avgErrASensor,2)) 'm avg'],'location','best')

%%
newTab      = uitab('parent',hTabGroup,'title','RawVErr');axes('Parent',newTab);
subplot(211);hold on;grid on
title('Measured and Truth Vertical Velocity')
plot(t,v)
plot(t,vTruth,'k')
xlabel('Time [s]')
ylabel('Velocity [m/s]')
legend('Sensor Measurement','Truth','location','best')

subplot(212);hold on;grid on
title('Raw Velocity Sensor Error')
plot(t,errVSensor)
xlabel('Time [s]')
ylabel('Error [m/s]')
legend(['Err: ' num2str(round(rmsErrVSensor,2)) 'm/s RMS, ' ...
    num2str(round(avgErrVSensor,2)) 'm/s avg'],'location','best')


%%
newTab      = uitab('parent',hTabGroup,'title','RawHErr');axes('Parent',newTab);
subplot(211);hold on;grid on
title('Measured and Truth Vertical Position')
plot(t,h)
plot(t,hTruth,'k')
xlabel('Time [s]')
ylabel('Height [m]')
legend('Sensor Measurement','Truth','location','best')

subplot(212);hold on;grid on
title('Raw Height Sensor Error')
plot(t,errHSensor)
xlabel('Time [s]')
ylabel('Error [m/s/s]')
legend(['Err: ' num2str(round(rmsErrHSensor,2)) 'm RMS, ' ...
    num2str(round(avgErrHSensor,2)) 'm avg'],'location','best')

end

