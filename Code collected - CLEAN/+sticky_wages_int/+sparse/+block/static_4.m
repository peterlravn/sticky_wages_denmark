function [y, T, residual, g1] = static_4(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(7, 1);
  residual(1)=(y(2))-(params(4)*y(2)+(1-params(8))*(1-params(4)*params(8))/(params(8)*(1+params(2)*params(7)))*(params(1)+params(2)/(1-params(5)))*y(3)-(1-params(8))*(1-params(4)*params(8))/(params(8)*(1+params(2)*params(7)))*y(6));
  residual(2)=(y(12))-(y(4)-(y(4)));
  residual(3)=(y(3))-(y(3)+(-1)/params(1)*(y(13)-y(1)-y(10)));
  residual(4)=(y(6))-(y(6)+y(2)-y(1));
  residual(5)=(y(3))-(y(4)-(1+params(2))/(params(5)+params(2)+(1-params(5))*params(1))*y(11));
  residual(6)=(y(13))-(y(1)*params(11)+params(12)*y(12)+y(9));
  T(1)=(1-params(5))/(1-params(5)+params(5)*params(6))*(1-params(3))*(1-params(3)*params(4))/params(3);
  residual(7)=(y(1))-(params(4)*y(1)+params(5)*T(1)/(1-params(5))*y(3)+T(1)*y(6));
if nargout > 3
    g1_v = NaN(16, 1);
g1_v(1)=(1-params(8))*(1-params(4)*params(8))/(params(8)*(1+params(2)*params(7)));
g1_v(2)=(-T(1));
g1_v(3)=1;
g1_v(4)=(-params(12));
g1_v(5)=(-((-1)/params(1)));
g1_v(6)=1;
g1_v(7)=1-params(4);
g1_v(8)=(-1);
g1_v(9)=(-1);
g1_v(10)=(-1)/params(1);
g1_v(11)=1;
g1_v(12)=(-params(11));
g1_v(13)=1-params(4);
g1_v(14)=(-((1-params(8))*(1-params(4)*params(8))/(params(8)*(1+params(2)*params(7)))*(params(1)+params(2)/(1-params(5)))));
g1_v(15)=1;
g1_v(16)=(-(params(5)*T(1)/(1-params(5))));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 7, 7);
end
end
