function [ X0, V0, F, H, Q, R, d, D ] = Initialize(dt)
%INITIALIZE Summary of this function goes here
%   Detailed explanation goes here

% kf will be 3 state model on vertical acceleration, position, velocity
d       = 3;    % number of kf states
D       = 2;    % number of measurements

% initial states
X.a0    = -500; % Initial acceleration State [m/s/s]
X.v0    = 400;  % Initial vel State [m/s]
X.r0    = 20;   % Initial pos State [m]
X0      = [X.a0; X.v0; X.r0];

% initial sigmas
Sigma.a0 = 50;  % Initial acceleration Sigma [m/s/s]
Sigma.v0 = 40;  % Initial velocity Sigma [m/s]
Sigma.r0 = 2;   % Initial pos Sigma [m]
Sigma.aSensor = 2;  % Noise of acceleration sensor [m/s/s]
Sigma.hSensor = 75; % Noise of height sensor [m]

% initial variances/covariances
V0      = eye(d); % V0 is initial covariance matrix
V0(1,1) = Sigma.a0^2;
V0(2,2) = Sigma.v0^2;
V0(3,3) = Sigma.r0^2;

% time invariant dynamics/transition matrix (aka phi or A)
% use 2nd order approximation for vertical position (R)
F       = [1        0       0;...
           dt       1       0;...
           1/2*dt^2 dt      1];    
% use 1st order approximation for vertical position (R)
% F       = [1        0       0;...
%            dt       1       0;...
%            0        dt      1]; 
       
% observation matrix
% first observation will be vertical acceleration directly
% second observation will be vertical position directly
H       = [1 0 0;...
           0 0 1];

% process noise
Q       = [100*dt   0       0;...
           0        dt      0;...
           0        0       dt];
       
% measurement noise
R       = [Sigma.aSensor^2   0;...
           0            Sigma.hSensor^2];

end

