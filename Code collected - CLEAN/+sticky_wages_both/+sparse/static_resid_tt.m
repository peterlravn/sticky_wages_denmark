function [T_order, T] = static_resid_tt(y, x, params, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 5
    T = [T; NaN(5 - size(T, 1), 1)];
end
T(1) = (1+params(2))/(params(5)+params(2)+(1-params(5))*params(1));
T(2) = (1-params(5))/(1-params(5)+params(5)*params(6))*(1-params(3))*(1-params(3)*params(4))/params(3);
T(3) = (1-params(8))*(1-params(4)*params(8))/(params(8)*(1+params(2)*params(7)));
T(4) = T(3)*(params(1)+params(2)/(1-params(5)));
T(5) = (-1)/params(1);
end
