function [g1, T_order, T] = dynamic_g1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 9
    T_order = -1;
    T = NaN(5, 1);
end
[T_order, T] = sticky_wages_both.sparse.dynamic_g1_tt(y, x, params, steady_state, T_order, T);
g1_v = NaN(42, 1);
g1_v(1)=(-1);
g1_v(2)=(-1);
g1_v(3)=(-params(10));
g1_v(4)=(-params(9));
g1_v(5)=1;
g1_v(6)=1;
g1_v(7)=(-params(11));
g1_v(8)=1;
g1_v(9)=(-1);
g1_v(10)=(-(params(5)*T(4)/(1-params(5))));
g1_v(11)=(-T(5));
g1_v(12)=1;
g1_v(13)=1;
g1_v(14)=(-1);
g1_v(15)=1;
g1_v(16)=(-1);
g1_v(17)=(-(1-params(5)));
g1_v(18)=(-T(4));
g1_v(19)=T(2);
g1_v(20)=1;
g1_v(21)=1;
g1_v(22)=(-1);
g1_v(23)=1;
g1_v(24)=1;
g1_v(25)=1;
g1_v(26)=(-T(3));
g1_v(27)=1;
g1_v(28)=T(3);
g1_v(29)=1;
g1_v(30)=T(1);
g1_v(31)=(-1);
g1_v(32)=(-((1-params(5)*T(1))/(1-params(5))));
g1_v(33)=(-(T(1)*(-params(1))*(1-params(9))));
g1_v(34)=1;
g1_v(35)=(-params(12));
g1_v(36)=1;
g1_v(37)=(-params(4));
g1_v(38)=T(3);
g1_v(39)=(-params(4));
g1_v(40)=(-1);
g1_v(41)=(-1);
g1_v(42)=(-1);
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 12, 38);
end
