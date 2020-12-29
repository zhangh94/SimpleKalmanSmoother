errASensor      = aTruth - a;
errVSensor      = vTruth - v;
errHSensor      = hTruth - h;

rmsErrASensor   = rms(errASensor);
avgErrASensor   = mean(errASensor);
rmsErrVSensor   = rms(errVSensor);
avgErrVSensor   = mean(errVSensor);
rmsErrHSensor   = rms(errHSensor);
avgErrHSensor   = mean(errHSensor);
if showPlots
    f = figure;
    hTabGroup   = uitabgroup('parent',f);
    
    RawMeasurements.hTabGroup       = hTabGroup;
    RawMeasurements.t               = t;
    RawMeasurements.a               = a;
    RawMeasurements.aTruth          = aTruth;
    RawMeasurements.v               = v;
    RawMeasurements.vTruth          = vTruth;
    RawMeasurements.h               = h;
    RawMeasurements.hTruth          = hTruth;
    RawMeasurements.errASensor      = errASensor;
    RawMeasurements.errVSensor      = errVSensor;
    RawMeasurements.errHSensor      = errHSensor;
    RawMeasurements.rmsErrASensor   = rmsErrASensor;
    RawMeasurements.avgErrASensor   = avgErrASensor;
    RawMeasurements.rmsErrVSensor   = rmsErrVSensor;
    RawMeasurements.avgErrVSensor   = avgErrVSensor;
    RawMeasurements.rmsErrHSensor   = rmsErrHSensor;
    RawMeasurements.avgErrHSensor   = avgErrHSensor;
    RawMeasurements.errRaw          = [errASensor errVSensor errHSensor];
    RawMeasurements.errHFilt        = errHFilt;
    PlotRawMeasurements( RawMeasurements )
end
