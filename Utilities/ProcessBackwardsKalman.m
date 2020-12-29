XHatHist            = zeros(nData,d);
VHatHist            = zeros(d,d,nData);

VHatjp1             = VHist(:,:,nData);
XHatjp1             = XHist(nData,:)';
VHatHist(:,:,nData) = VHatjp1;    
XHatHist(nData,:)   = XHatjp1;
for j = nData-1:-1:1
    
    C               = VHist(:,:,j) * F' / PHist(:,:,j);
    XHatHist(j,:)   = XHist(j,:)' + C * (XHatHist(j+1,:)' - F * XHist(j,:)');
    VHatHist(:,:,j) = VHist(:,:,j) + C * (VHatHist(:,:,j+1) - PHist(:,:,j)) * C';    
end

aKfb        = XHatHist(:,1);
vKfb        = XHatHist(:,2);
hKfb        = XHatHist(:,3);
errKfb      = [aTruth-aKfb vTruth-vKfb hTruth-hKfb];
rmsErrKfb   = [rms(errKfb(:,1)); rms(errKfb(:,2)); rms(errKfb(:,3))];
avgErrKfb   = [mean(errKfb(:,1)); mean(errKfb(:,2)); mean(errKfb(:,3))];

if showPlots
    BackwardEstimates.trimTime     	= 0.5;              % time to trim off front when computing RMS Error [s] 
    BackwardEstimates.hTabGroup     = hTabGroup;
    BackwardEstimates.t           	= t;
    BackwardEstimates.dt            = dt;
    BackwardEstimates.truth         = [aTruth vTruth hTruth];
    BackwardEstimates.Kff           = [aKff vKff hKff];
    BackwardEstimates.Kfb           = [aKfb vKfb hKfb];
    BackwardEstimates.errKfb     	= errKfb;
    BackwardEstimates.rmsErrKfb     = rmsErrKfb;
    BackwardEstimates.avgErrKfb     = avgErrKfb;
    PlotBackwardEstimates( BackwardEstimates );
end