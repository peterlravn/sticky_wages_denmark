function [test,march_table]=march1(res,lags,K)
% Test for Multivariate ARCH
% Input:
% res = TxK residual matrix
% lags = number of lagged ARCH effects
% K = number of variables in the underlying VAR/VEC model

% Output:
% Function produces a table with results
uhat = res - ones(length(res), 1)*mean(res);

i = 1;
% Initialize matrices
UUT = zeros(K*(K+1)/2);
i=1;
while i <= length(res)
utut = uhat(i,:)' * uhat(i,:);
  % the vech operator
  tmp  = [];
  for ii=1:K
     tmp = [tmp; utut(ii:K,ii)];
  end
  UUT = [UUT tmp];
  i = i+1;
end
UUT=UUT(:,1+K*(K+1)/2:length(UUT));

% % Create matrices of regressors
Y = UUT(:,lags+1:length(UUT));
Z = [];
i = 1;

T = length(Y);

while i <= T
  Z = [Z [ones(1, 1); vec(UUT(:,i:i+lags-1))]];
  i = i + 1; 
end

% % Compute omega
A = Y*Z'*inv(Z*Z');
omega = (Y-A*Z)*(Y-A*Z)'/T;
% omega = omega/length(Y);
% % Compute omega0
% a=;
omega0 = (Y-mean(Y,2))*(Y-mean(Y,2))'/T;
% omega0 = omega0/length(Y);
R2 = (1-(2/(K*(K+1))*trace(omega*inv(omega0))));
VARCHLM = (1/2)*T*K*(K+1)*R2 % test statistics
df = lags*K^2*(K+1)^2/4;
pvalue = 1 - chi2cdf(VARCHLM, df);
disp('Tests for Multivariate ARCH');
test=[VARCHLM; pvalue; df];
march_table = table(categorical({'test statistic:' ; 'p-value' ; 'degrees of freedom'}),test,'VariableNames',{'Test' 'Doornik_Hendry'});
disp(march_table);

end