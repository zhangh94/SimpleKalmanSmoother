close all;clear;clc;format compact;
load('input','input')
load('truth','truth')

aTruth = truth(:,1); % Truth Vertical Acceleration [m/s/s]
vTruth = truth(:,2); % Truth Vertical Velocity [m/s]
hTruth = truth(:,3); % Truth Vertical Position [m]

dt      = 0.01;         % [s]
Fs      = 1/dt;         % [hz]

a       = input(:,1);   % Measured Acceleration [m/s/s]
v       = [vTruth(1);cumsum(a(2:end))*dt + vTruth(1)]; % Summed Acceleration = Velocity [m/s]
h       = input(:,2);   % Measured Height [m/s]

nData       = length(a);  % Number of data points
t           = (0:dt:(nData*dt-dt))'; % Generate a time array
showPlots   = 1; 

%% IIR Filter
f       = 0.9;
hFilt   = zeros(nData,1);
hFilt(1)= h(1);
for s = 2:nData
    hFilt(s)    = f * hFilt(s-1) + (1 - f) * h(s);
end

errHFilt        = hTruth - hFilt;

%% Raw Raw/Unfiltered Results
ProcessRawData;

%% Initialize Kf 
[ X0, V0, F, H, Q, R, d, D ] = Initialize(dt);

XHist   = zeros(nData,d);   % store time history of states
PHist   = zeros(d,d,nData);
VHist   = zeros(d,d,nData);

X       = X0;
P       = V0;

%% Forward Kalman Algorithm
ProcessForwardKalman;

%% Backwards Smoothing Algorithm
ProcessBackwardsKalman

%% Show Summary Plots
if showPlots
    ErrorComparison.hTabGroup           = hTabGroup;
    ErrorComparison.RawMeasurements     = RawMeasurements;
    ErrorComparison.ForwardEstimates    = ForwardEstimates;
    ErrorComparison.BackwardEstimates   = BackwardEstimates;
    
    PlotErrorComparison( ErrorComparison);
end
