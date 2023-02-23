function outtable=mygnrun(simT)
% my GN example
% simT = number of simulation iterations
% Sample Sizes
Ts = [25,50,75,100,250,500,1000,10000,100000];

for i=1:length(Ts)
    [x,y]=deal(zeros(Ts(i),simT));
    ey=randn(Ts(i),simT);
    ex=randn(Ts(i),simT);
    for j=2:Ts(i)
        y(j,:)=y(j-1,:)+ey(j,:);
        x(j,:)=x(j-1,:)+ex(j,:);
    end
    out(i).runs=nan(3,simT);
    for j=1:size(x,2)
        k=nwest2(y(:,j),[ones(size(x,1),1) x(:,j)],10);
        out(i).runs(:,j)=[k.beta(2) k.tstats(2) k.nwtstat(2)]';
    end
end

for i=1:length(out)
    outtable(:,i)=mean(abs(out(i).runs),2);
end

bar(outtable(1,:)');
title('Betas');
xticklabels(Ts);
saveas(gcf, 'figure1.jpg');

figure();
bar3([outtable(3,:)' outtable(2,:)']);
title('OLS t-stats vs NW t-stats');
view(260,15);
saveas(gcf, 'figure2.jpg');
end

%%%%%%%%%%%%%%%%%%%
% Helper functions
%%%%%%%%%%%%%%%%%%%
function results=nwest2(y,x,nlags)
% MODIFIED HERE NLAG IS THE NUMBER OF LAGS TO LOOK AT FOR THE 
% AUTOMATIC LAG SELECTION PROCEDURE
%
% PURPOSE: computes Newey-West adjusted heteroscedastic-serial
%          consistent Least-squares Regression
%---------------------------------------------------
% USAGE: results = nwest(y,x,nlag)
% where: y = dependent variable vector (nobs x 1)
%        x = independent variables matrix (nobs x nvar)
%     nlags = max lag length to check
%---------------------------------------------------
% RETURNS: a structure
%        results.beta  = bhat
%        results.tstat = t-stats
%        results.nwtstat = newey west t-stats
%        results.resid = residuals
% --------------------------------------------------
% SEE ALSO: prt_reg(results), plt_reg(results)
%---------------------------------------------------
% References:  Gallant, R. (1987),
%  "Nonlinear Statistical Models," pp.137-139.
%---------------------------------------------------

% written by:
% James P. LeSage, Dept of Economics
% University of Toledo
% 2801 W. Bancroft St,
% Toledo, OH 43606
% jpl@jpl.econ.utoledo.edu
% Modified by Tim Simin

if (nargin ~= 3); error('Wrong # of arguments to nwest'); end;

[nobs nvar] = size(x);
xpxi = inv(x'*x);
results.beta    = xpxi*(x'*y);
yhat= x*results.beta;
results.resid= y - yhat;
sigu = results.resid'*results.resid;
sige = sigu/(nobs-nvar);
results.tstats=results.beta./(sqrt((sige)*(diag(xpxi))));

% perform Newey-West correction
nlag=autolag(results.resid,nlags);

emat = [];
for i=1:nvar;
    emat = [emat;results.resid'];
end;
       
hhat=emat.*x';
G=zeros(nvar,nvar); w=zeros(2*nlag+1,1);
a=0;
while a~=nlag+1;
    ga=zeros(nvar,nvar);
    w(nlag+1+a,1)=(nlag+1-a)/(nlag+1);
    za=hhat(:,(a+1):nobs)*hhat(:,1:nobs-a)';
    if a==0;
      ga=ga+za;
    else
      ga=ga+za+za';
    end;
    G=G+w(nlag+1+a,1)*ga;
    a=a+1;
end;
    
V=xpxi*G*xpxi;
nwerr= sqrt(diag(V));
results.nwtstat = results.beta./nwerr; % Newey-West t-statistics
end

function out=autolag(x,m)
[k,up]=autocorrs(x,m);
l=find(ismember(abs(k)>=up,1));
if(isempty(l))
    out=0;
else
    out=l(end);
end
end

function [acs, conf]=autocorrs(x,L)
% [acs, conf]=autocorrs(x,L)
% CALCULATE THE AUTOCORRELATIONS (AND CONFIDENCE INTERVAL) OF X UP TO LAG L
out=zeros(L,1);
for i=1:L
   x1=x(1:length(x)-i);
   x2=x(i+1:length(x));
   k=corrcoef(x1,x2);
   out(i)=k(1,2);
end
acs=out;
conf=1.96/sqrt(length(x));
end
