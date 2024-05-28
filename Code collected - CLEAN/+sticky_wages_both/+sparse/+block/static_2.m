function [y, T] = static_2(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(8)=(1-params(5)*(1+params(2))/(params(5)+params(2)+(1-params(5))*params(1)))/(1-params(5))*y(11);
  y(10)=y(11)*(1+params(2))/(params(5)+params(2)+(1-params(5))*params(1))*(-params(1))*(1-params(9));
end
