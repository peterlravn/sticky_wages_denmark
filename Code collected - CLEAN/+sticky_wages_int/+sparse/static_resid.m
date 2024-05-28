function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(5, 1);
end
[T_order, T] = sticky_wages_int.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(13, 1);
    residual(1) = (y(1)) - (params(4)*y(1)+params(5)*T(2)/(1-params(5))*y(3)+T(2)*y(6));
    residual(2) = (y(2)) - (params(4)*y(2)+T(4)*y(3)-T(3)*y(6));
    residual(3) = (y(3)) - (y(3)+T(5)*(y(13)-y(1)-y(10)));
    residual(4) = (y(3)) - (y(4)-T(1)*y(11));
    residual(5) = (y(4)) - (y(11)+(1-params(5))*y(5));
    residual(6) = (y(6)) - (y(7)-y(8));
    residual(7) = (y(8)) - ((1-params(5)*T(1))/(1-params(5))*y(11));
    residual(8) = (y(6)) - (y(6)+y(2)-y(1));
    residual(9) = (y(10)) - (y(11)*T(1)*(-params(1))*(1-params(9)));
    residual(10) = (y(13)) - (y(1)*params(11)+params(12)*y(12)+y(9));
    residual(11) = (y(9)) - (y(9)*params(10)+x(1));
    residual(12) = (y(12)) - (y(4)-(y(4)));
    residual(13) = (y(11)) - (y(11)*params(9)+x(2));
end
