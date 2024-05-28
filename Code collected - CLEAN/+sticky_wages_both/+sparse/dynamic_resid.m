function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(5, 1);
end
[T_order, T] = sticky_wages_both.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(12, 1);
    residual(1) = (y(13)) - (params(4)*y(25)+y(15)*params(5)*T(4)/(1-params(5))+y(18)*T(4));
    residual(2) = (y(14)) - (params(4)*y(26)+y(15)*T(5)-T(2)*y(18));
    residual(3) = (y(15)) - (T(3)*(y(21)-y(25)-y(22))+y(27));
    residual(4) = (y(15)) - (y(16)-T(1)*y(23));
    residual(5) = (y(16)) - (y(23)+(1-params(5))*y(17));
    residual(6) = (y(18)) - (y(19)-y(20));
    residual(7) = (y(20)) - (y(23)*(1-params(5)*T(1))/(1-params(5)));
    residual(8) = (y(18)) - (y(14)+y(6)-y(13)-(y(20)-y(8)));
    residual(9) = (y(22)) - (y(23)*T(1)*(-params(1))*(1-params(9)));
    residual(10) = (y(21)) - (y(13)*params(11)+params(12)*y(24)+params(10)*y(9)+x(1));
    residual(11) = (y(24)) - (y(16)-(steady_state(4)));
    residual(12) = (y(23)) - (params(9)*y(11)+x(2));
end
