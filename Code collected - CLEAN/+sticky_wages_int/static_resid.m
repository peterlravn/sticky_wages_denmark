function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = sticky_wages_int.static_resid_tt(T, y, x, params);
end
residual = zeros(13, 1);
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
