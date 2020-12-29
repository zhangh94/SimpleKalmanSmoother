function [] = PlotErrorComparison( in )
%PLOTRAWMEASUREMENTS Summary of this function goes here
%   Detailed explanation goes here

hTabGroup           = in.hTabGroup;
RawMeasurements     = in.RawMeasurements;
ForwardEstimates    = in.ForwardEstimates;
BackwardEstimates   = in.BackwardEstimates;
t                   = in.RawMeasurements.t;

ylabels     = {'Acceleration [m/s/s]','Velocity [m/s]','Height [m]'};
yErrLabels  = {'Error [m/s/s]','Error [m/s]','Error [m]'};
legendUnits = {'m/s^2','m/s','m'};
titles      = {'Vertical Acceleration','Vertical Velocity','Height'};
tabLabels   = {'BkEstAErr','BkEstVErr','BkEstHErr'};
%%
newTab      = uitab('parent',hTabGroup,'title','ErrorComp');axes('Parent',newTab);
for n = 1:3
    subplot(3,1,n);hold on;grid on
    title(['Kf Backward Smoothed vs Truth ' titles{n}])
    plot(t,RawMeasurements.errRaw(:,n))
    plot(t,ForwardEstimates.errKff(:,n))
    plot(t,BackwardEstimates.errKfb(:,n))
    xlabel('Time [s]')
    ylabel(ylabels{n})
    legend('Raw Error','KfFwd Estimate Error','KfBk Estimate Error','location','best')
    
    if n == 3
       plot(t,RawMeasurements.errHFilt)
       legend('Raw Error','KfFwd Estimate Error','KfBk Estimate Error','IIR Filtered Error','location','best')    
    end
end

end