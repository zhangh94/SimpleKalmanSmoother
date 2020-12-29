for j1 = 1:nData 
    x   = [a(j1);h(j1)];% accel and height observation;

    K   = P * H' / (H * P * H' + R); % compute kalman gain
    
    % state propagation and update
    if j1 == 1
        X   = X + K * (x - H * X);
    else
        X   = F*X + K * (x - H * F * X);
    end
    XHist(j1,:) = X;
    
    % covariance propagation and update
    V   = (eye(d) - K * H) * P;
    VHist(:,:,j1)   = V;
    
    P   = F * V * F' + Q;
    PHist(:,:,j1)   = P;
end

aKff        = XHist(:,1);
vKff        = XHist(:,2);
hKff        = XHist(:,3);
errKff      = [aTruth-aKff vTruth-vKff hTruth-hKff];
rmsErrKff   = [rms(errKff(:,1)); rms(errKff(:,2)); rms(errKff(:,3))];
avgErrKff   = [mean(errKff(:,1)); mean(errKff(:,2)); mean(errKff(:,3))];

if showPlots
    ForwardEstimates.trimTime      	 = 2; % time to trim off front when computing RMS Error [s] 
    ForwardEstimates.hTabGroup       = hTabGroup;
    ForwardEstimates.t               = t;
    ForwardEstimates.dt              = dt;
    ForwardEstimates.aTruth          = aTruth;
    ForwardEstimates.vTruth          = vTruth;
    ForwardEstimates.hTruth          = hTruth;
    ForwardEstimates.aKff            = aKff;
    ForwardEstimates.vKff            = vKff;
    ForwardEstimates.hKff            = hKff;
    ForwardEstimates.errKff          = errKff;
    ForwardEstimates.rmsErrKff       = rmsErrKff;
    ForwardEstimates.avgErrKff       = avgErrKff;
    PlotForwardEstimates( ForwardEstimates )
end