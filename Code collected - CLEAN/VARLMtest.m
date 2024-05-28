function [Results,lm_table]=VARLMtest(lmlags,con,tr,y,p)
%
% p = 2;
% y = kpsw_selected;
%_________________
%
% Estimate restricted model
[T K]=size(y);
[Beta,CovBeta,tratioBeta,res,indep,so]=VARlsExog(y,p,con,tr,1);
% Save Sigma and residuals
Sigma = so;
u = res;
% Lags of residuals
ulags = lagmatrix(u,1:lmlags);
% Missing values for lmlags lags are replaced with zeros
ulags = fillmissing(ulags,"constant",0);
% Estimate VAR with augmented exogenous variables ulags
[Beta,CovBeta,tratioBeta,res,indep,so]=VARlsExog(y,p,con,tr,ulags);
Sigmas = so;
help = Sigmas*inv(Sigma);
% Breusch-Godfrey
LML = length(res)*(K-trace(help));
LMLpval = 1-chi2cdf(LML,lmlags*K^2);
% Edgerton-Shukur
m = K*lmlags;
q = 1/2*K*m-1;
s = ((K^2*m^2-4)/(K^2+m^2-5))^(1/2);
N = length(res)-K*p-m-(1/2)*(K-m+1);
FLMh = ((det(Sigma)*inv(det(Sigmas)))^(1/s)-1)*((N*s-q)/(K*m));
FLMhpval = 1-fcdf(FLMh,lmlags*K^2,N*s-q);
% Put everything in a table and print
Results = [[ LML FLMh ]; [ LMLpval FLMhpval]; [ lmlags lmlags]];
lm_table=table(categorical({'Test statistic' ; 'p-value' ; 'Lag order' }),Results(:,1),Results(:,2),'VariableNames',{'Measure' 'Breusch_Godfrey' 'Edgerton_Shukur'});

display('LM tests for Multivariate autocorrelation');
disp(lm_table);
end
