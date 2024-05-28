function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
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
%   g1
%

if T_flag
    T = sticky_wages_tech.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(13, 22);
g1(1,5)=1;
g1(1,18)=(-params(4));
g1(1,7)=(-(params(5)*T(4)/(1-params(5))));
g1(1,10)=(-T(4));
g1(2,6)=1;
g1(2,19)=(-params(4));
g1(2,7)=(-T(5));
g1(2,10)=T(2);
g1(3,18)=T(3);
g1(3,7)=1;
g1(3,20)=(-1);
g1(3,14)=T(3);
g1(3,17)=(-T(3));
g1(4,7)=1;
g1(4,8)=(-1);
g1(4,15)=T(1);
g1(5,8)=1;
g1(5,9)=(-(1-params(5)));
g1(5,15)=(-1);
g1(6,10)=1;
g1(6,11)=(-1);
g1(6,12)=1;
g1(7,12)=1;
g1(7,15)=(-((1-params(5)*T(1))/(1-params(5))));
g1(8,5)=1;
g1(8,6)=(-1);
g1(8,1)=(-1);
g1(8,10)=1;
g1(8,2)=(-1);
g1(8,12)=1;
g1(9,14)=1;
g1(9,15)=(-(T(1)*(-params(1))*(1-params(9))));
g1(10,5)=(-params(11));
g1(10,13)=(-1);
g1(10,16)=(-params(12));
g1(10,17)=1;
g1(11,3)=(-params(10));
g1(11,13)=1;
g1(11,21)=(-1);
g1(12,8)=(-1);
g1(12,16)=1;
g1(13,4)=(-params(9));
g1(13,15)=1;
g1(13,22)=(-1);

end
