function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(5, 1);
  y(25)=y(17)-(steady_state(4));
  y(26)=y(14)*params(11)+params(12)*y(25)+y(22);
  residual(1)=(y(16))-(y(17)-(1+params(2))/(params(5)+params(2)+(1-params(5))*params(1))*y(24));
  residual(2)=(y(19))-(y(15)+y(6)-y(14)-(y(21)-y(8)));
  residual(3)=(y(15))-(params(4)*y(28)+y(16)*(1-params(8))*(1-params(4)*params(8))/(params(8)*(1+params(2)*params(7)))*(params(1)+params(2)/(1-params(5)))-(1-params(8))*(1-params(4)*params(8))/(params(8)*(1+params(2)*params(7)))*y(19));
  residual(4)=(y(16))-((-1)/params(1)*(y(26)-y(27)-y(23))+y(29));
  T(1)=(1-params(5))/(1-params(5)+params(5)*params(6))*(1-params(3))*(1-params(3)*params(4))/params(3);
  residual(5)=(y(14))-(params(4)*y(27)+y(16)*params(5)*T(1)/(1-params(5))+y(19)*T(1));
if nargout > 3
    g1_v = NaN(19, 1);
g1_v(1)=(-1);
g1_v(2)=(-1);
g1_v(3)=(-((-1)/params(1)*params(12)));
g1_v(4)=1;
g1_v(5)=(1-params(8))*(1-params(4)*params(8))/(params(8)*(1+params(2)*params(7)));
g1_v(6)=(-T(1));
g1_v(7)=(-1);
g1_v(8)=1;
g1_v(9)=1;
g1_v(10)=(-((1-params(8))*(1-params(4)*params(8))/(params(8)*(1+params(2)*params(7)))*(params(1)+params(2)/(1-params(5)))));
g1_v(11)=1;
g1_v(12)=(-(params(5)*T(1)/(1-params(5))));
g1_v(13)=1;
g1_v(14)=(-((-1)/params(1)*params(11)));
g1_v(15)=1;
g1_v(16)=(-params(4));
g1_v(17)=(-1);
g1_v(18)=(-1)/params(1);
g1_v(19)=(-params(4));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 5, 15);
end
end
