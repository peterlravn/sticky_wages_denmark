function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = sticky_wages_int.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(13, 1);
    residual(1) = (y(5)) - (params(4)*y(18)+y(7)*params(5)*T(4)/(1-params(5))+y(10)*T(4));
    residual(2) = (y(6)) - (params(4)*y(19)+y(7)*T(5)-T(2)*y(10));
    residual(3) = (y(7)) - (T(3)*(y(17)-y(18)-y(14))+y(20));
    residual(4) = (y(7)) - (y(8)-T(1)*y(15));
    residual(5) = (y(8)) - (y(15)+(1-params(5))*y(9));
    residual(6) = (y(10)) - (y(11)-y(12));
    residual(7) = (y(12)) - (y(15)*(1-params(5)*T(1))/(1-params(5)));
    residual(8) = (y(10)) - (y(6)+y(1)-y(5)-(y(12)-y(2)));
    residual(9) = (y(14)) - (y(15)*T(1)*(-params(1))*(1-params(9)));
    residual(10) = (y(17)) - (y(5)*params(11)+params(12)*y(16)+y(13));
    residual(11) = (y(13)) - (params(10)*y(3)+x(it_, 1));
    residual(12) = (y(16)) - (y(8)-(steady_state(4)));
    residual(13) = (y(15)) - (params(9)*y(4)+x(it_, 2));

end
