function [y, T] = dynamic_1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(22)=params(10)*y(9)+x(1);
  y(24)=params(9)*y(11)+x(2);
  y(21)=y(24)*(1-params(5)*(1+params(2))/(params(5)+params(2)+(1-params(5))*params(1)))/(1-params(5));
  y(23)=y(24)*(1+params(2))/(params(5)+params(2)+(1-params(5))*params(1))*(-params(1))*(1-params(9));
end
