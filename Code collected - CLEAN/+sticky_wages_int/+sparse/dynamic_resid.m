function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(5, 1);
end
[T_order, T] = sticky_wages_int.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(13, 1);
    residual(1) = (y(14)) - (params(4)*y(27)+y(16)*params(5)*T(4)/(1-params(5))+y(19)*T(4));
    residual(2) = (y(15)) - (params(4)*y(28)+y(16)*T(5)-T(2)*y(19));
    residual(3) = (y(16)) - (T(3)*(y(26)-y(27)-y(23))+y(29));
    residual(4) = (y(16)) - (y(17)-T(1)*y(24));
    residual(5) = (y(17)) - (y(24)+(1-params(5))*y(18));
    residual(6) = (y(19)) - (y(20)-y(21));
    residual(7) = (y(21)) - (y(24)*(1-params(5)*T(1))/(1-params(5)));
    residual(8) = (y(19)) - (y(15)+y(6)-y(14)-(y(21)-y(8)));
    residual(9) = (y(23)) - (y(24)*T(1)*(-params(1))*(1-params(9)));
    residual(10) = (y(26)) - (y(14)*params(11)+params(12)*y(25)+y(22));
    residual(11) = (y(22)) - (params(10)*y(9)+x(1));
    residual(12) = (y(25)) - (y(17)-(steady_state(4)));
    residual(13) = (y(24)) - (params(9)*y(11)+x(2));
end
