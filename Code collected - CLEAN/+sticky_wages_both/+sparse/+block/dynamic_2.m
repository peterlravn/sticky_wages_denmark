function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(6, 1);
  y(24)=y(16)-(steady_state(4));
  residual(1)=(y(15))-(y(16)-(1+params(2))/(params(5)+params(2)+(1-params(5))*params(1))*y(23));
  residual(2)=(y(18))-(y(14)+y(6)-y(13)-(y(20)-y(8)));
  residual(3)=(y(21))-(y(13)*params(11)+params(12)*y(24)+params(10)*y(9)+x(1));
  T(1)=(1-params(5))/(1-params(5)+params(5)*params(6))*(1-params(3))*(1-params(3)*params(4))/params(3);
  residual(4)=(y(13))-(params(4)*y(25)+y(15)*params(5)*T(1)/(1-params(5))+y(18)*T(1));
  residual(5)=(y(14))-(params(4)*y(26)+y(15)*(1-params(8))*(1-params(4)*params(8))/(params(8)*(1+params(2)*params(7)))*(params(1)+params(2)/(1-params(5)))-(1-params(8))*(1-params(4)*params(8))/(params(8)*(1+params(2)*params(7)))*y(18));
  residual(6)=(y(15))-((-1)/params(1)*(y(21)-y(25)-y(22))+y(27));
if nargout > 3
    g1_v = NaN(22, 1);
g1_v(1)=(-1);
g1_v(2)=(-params(10));
g1_v(3)=(-1);
g1_v(4)=(-params(12));
g1_v(5)=1;
g1_v(6)=(-T(1));
g1_v(7)=(1-params(8))*(1-params(4)*params(8))/(params(8)*(1+params(2)*params(7)));
g1_v(8)=1;
g1_v(9)=(-((-1)/params(1)));
g1_v(10)=1;
g1_v(11)=(-params(11));
g1_v(12)=1;
g1_v(13)=(-1);
g1_v(14)=1;
g1_v(15)=1;
g1_v(16)=(-(params(5)*T(1)/(1-params(5))));
g1_v(17)=(-((1-params(8))*(1-params(4)*params(8))/(params(8)*(1+params(2)*params(7)))*(params(1)+params(2)/(1-params(5)))));
g1_v(18)=1;
g1_v(19)=(-params(4));
g1_v(20)=(-1)/params(1);
g1_v(21)=(-params(4));
g1_v(22)=(-1);
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 6, 18);
end
end
