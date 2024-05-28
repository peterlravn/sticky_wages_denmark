function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
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
%   g1
%

if T_flag
    T = sticky_wages_tech.static_g1_tt(T, y, x, params);
end
g1 = zeros(13, 13);
g1(1,1)=1-params(4);
g1(1,3)=(-(params(5)*T(2)/(1-params(5))));
g1(1,6)=(-T(2));
g1(2,2)=1-params(4);
g1(2,3)=(-T(4));
g1(2,6)=T(3);
g1(3,1)=T(5);
g1(3,10)=T(5);
g1(3,13)=(-T(5));
g1(4,3)=1;
g1(4,4)=(-1);
g1(4,11)=T(1);
g1(5,4)=1;
g1(5,5)=(-(1-params(5)));
g1(5,11)=(-1);
g1(6,6)=1;
g1(6,7)=(-1);
g1(6,8)=1;
g1(7,8)=1;
g1(7,11)=(-((1-params(5)*T(1))/(1-params(5))));
g1(8,1)=1;
g1(8,2)=(-1);
g1(9,10)=1;
g1(9,11)=(-(T(1)*(-params(1))*(1-params(9))));
g1(10,1)=(-params(11));
g1(10,9)=(-1);
g1(10,12)=(-params(12));
g1(10,13)=1;
g1(11,9)=1-params(10);
g1(12,12)=1;
g1(13,11)=1-params(9);

end
