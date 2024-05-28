
var
pi_p
pi_w
y_gap
y
n
w_gap
w
w_nat
i_ex
r_nat
a
yhat
;

varexo
eps_i
eps_a
;

parameters
siggma
varphi
theta_p
betta
alppha
epsilon_p
epsilon_w
theta_w
rho_a
rho_i
phi_pi
phi_y
;


load paramvec;
siggma = paramvec(1);
varphi = paramvec(2);
theta_p = paramvec(3);
theta_w = paramvec(4);
rho_a  = paramvec(5);
rho_i = paramvec(6);
phi_pi = paramvec(7);
phi_y  = paramvec(8);
epsilon_p = paramvec(9);
epsilon_w = paramvec(10);
betta  = 0.99;
alppha = 0.25;

model(linear);
#Omega = (1-alppha)/(1-alppha+alppha*epsilon_p);              %defined on page 166
#psi_n_ya = (1+varphi)/(siggma*(1-alppha)+varphi+alppha);     %defined on page 171
#psi_n_wa = (1-alppha*psi_n_ya)/(1-alppha);                   %defined on page 171
#lambda_p = (1-theta_p)*(1-betta*theta_p)/theta_p*Omega;      %defined on page 166
#aleph_p = alppha*lambda_p/(1-alppha);                         %defined on page 172
#lambda_w = (1-theta_w)*(1-betta*theta_w)/(theta_w*(1+epsilon_w*varphi));      %defined on page 170
#aleph_w = lambda_w*(siggma+varphi/(1-alppha)); 
pi_p = betta*pi_p(+1)+aleph_p*y_gap+lambda_p*w_gap;
pi_w = betta*pi_w(+1)+aleph_w*y_gap-lambda_w*w_gap;
y_gap = (-1/siggma)*(i_ex-pi_p(+1)-r_nat)+y_gap(+1);
y_gap = y-psi_n_ya*a;

y = a+(1-alppha)*n;
w_gap = w-w_nat;
w_nat = psi_n_wa*a;
w_gap = w_gap(-1)+pi_w-pi_p-(w_nat-w_nat(-1));
r_nat = -siggma*(1-rho_a)*psi_n_ya*a;
i_ex = phi_pi*pi_p+phi_y*yhat+rho_i*i_ex(-1)+eps_i;
yhat=y-steady_state(y);

a = rho_a*a(-1)+eps_a;

end;

shocks;
    var eps_i; stderr 1;
    var eps_a; stderr 1;
end;

options_.qz_criterium = 1+1e-6; 

steady;
check;


stoch_simul(order=1, irf=20, nograph, noprint) ;

pi_p_eps_i = oo_.irfs.pi_p_eps_i';
pi_w_eps_i = oo_.irfs.pi_w_eps_i';
y_eps_i = oo_.irfs.y_eps_i';
n_eps_i = oo_.irfs.n_eps_i';

pi_p_eps_a = oo_.irfs.pi_p_eps_a';
pi_w_eps_a = oo_.irfs.pi_w_eps_a';
y_eps_a = oo_.irfs.y_eps_a';
n_eps_a = oo_.irfs.n_eps_a';

% Now save the extracted variables to a .mat file
save('irfs_model.mat', 'pi_p_eps_i', 'pi_w_eps_i', 'y_eps_i', 'n_eps_i', 'pi_p_eps_a', 'pi_w_eps_a', 'y_eps_a', 'n_eps_a');

