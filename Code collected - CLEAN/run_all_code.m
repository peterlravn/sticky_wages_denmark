addpath(genpath("C:\Users\peter\OneDrive\Skole\Semester 10\SVAR\Sign restrictions\VAR-Toolbox-main\v3dot0"));

addpath C:\dynare\6.0\matlab;

clear all; clear session; close all; clc
warning off all


%% Simulate sign restriction space for interest rate shock
close all;
p_inf = [];
w_inf = [];
gdp = [];
n = []

for i=1:1000;

    % try;
        rng("shuffle")
        
        lbound = [    0.5     0.5      0          0     0.01   1.01    0.01   0.1      0.1 ];      
        ubound = [     5       3      0.99       0.99   0.99     3      0.5     9       9   ];

        
        siggma0 = lbound(1) + (ubound(1) - lbound(1)) * rand();
        varphi0 = lbound(2) + (ubound(2) - lbound(2)) * rand();
        theta_p0 = lbound(3) + (ubound(3) - lbound(3)) * rand();
        theta_w0 = lbound(4) + (ubound(4) - lbound(4)) * rand();
        rho_i0 = lbound(5) + (ubound(5) - lbound(5)) * rand();
        phi_pi0 = lbound(6) + (ubound(6) - lbound(6)) * rand();
        phi_y0 = lbound(7) + (ubound(7) - lbound(7)) * rand();
        epsilon_p0 = lbound(8) + (ubound(8) - lbound(8)) * rand();
        epsilon_w0 = lbound(9) + (ubound(9) - lbound(9)) * rand();
        
        
        
        paramvec = [siggma0  varphi0 theta_p0 theta_w0 rho_i0 phi_pi0 phi_y0 epsilon_p0 epsilon_w0];
        
        save('paramvec')
        
        dynare sticky_wages_int;
        
        load('irfs_model.mat');
        
        p_inf = [p_inf, pi_p_eps_i];
        w_inf = [w_inf, pi_w_eps_i];
        gdp = [gdp, y_eps_i];
        n = [n, n_eps_i];
    % catch;
    %     %do nothing
    % end;
end;

p_inf_max = max(p_inf, [], 2);
p_inf_min = min(p_inf, [], 2);
w_inf_max = max(w_inf, [], 2);
w_inf_min = min(w_inf, [], 2);
gdp_max = max(gdp, [], 2);
gdp_min = min(gdp, [], 2);
n_max = max(n, [], 2);
n_min = min(n, [], 2);


horizon = 20;
x = 1:horizon;

figure('Position', [100, 100, 800, 600]);

subplot(2, 2, 1);
fill([x fliplr(x)], [p_inf_min' fliplr(p_inf_max')], [0.8 0.8 0.8], 'EdgeColor', 'none'); % Gray color fill
hold on;
plot(p_inf_min, 'black');
plot(p_inf_max, 'black');
% ylim([-10 2]);
hold off;

subplot(2, 2, 2);
fill([x fliplr(x)], [w_inf_min' fliplr(w_inf_max')], [0.8 0.8 0.8], 'EdgeColor', 'none'); % Gray color fill
hold on;
plot(w_inf_min, 'black');
plot(w_inf_max, 'black');
% ylim([-12 2]);
hold off;

subplot(2, 2, 3);
fill([x fliplr(x)], [gdp_min' fliplr(gdp_max')], [0.8 0.8 0.8], 'EdgeColor', 'none'); % Gray color fill
hold on;
plot(gdp_min, 'black');
plot(gdp_max, 'black');
% ylim([-6 2]);
hold off;

subplot(2, 2, 4);
fill([x fliplr(x)], [n_min' fliplr(n_max')], [0.8 0.8 0.8], 'EdgeColor', 'none'); % Gray color fill
hold on;
plot(n_min, 'black');
plot(n_max, 'black');
% ylim([-8 2]);
hold off;

saveas(gcf,'simul_sign_int.png')

%% Simulate sign restriction space for productivity shock
p_inf = [];
w_inf = [];
gdp = [];
n = []

for i=1:1;

    rng("shuffle")
    
    lbound = [    0.5     0.5      0          0     0.01   1.01    0.01   0.1      0.1 ];      
    ubound = [     5       3      0.99       0.99   0.99     3      0.5     9       9   ];  
    
    siggma0 = lbound(1) + (ubound(1) - lbound(1)) * rand();
    varphi0 = lbound(2) + (ubound(2) - lbound(2)) * rand();
    theta_p0 = lbound(3) + (ubound(3) - lbound(3)) * rand();
    theta_w0 = lbound(4) + (ubound(4) - lbound(4)) * rand();
    rho_a0 = lbound(5) + (ubound(5) - lbound(5)) * rand();        
    phi_pi0 = lbound(6) + (ubound(6) - lbound(6)) * rand();
    phi_y0 = lbound(7) + (ubound(7) - lbound(7)) * rand();
    epsilon_p0 = lbound(8) + (ubound(8) - lbound(8)) * rand();
    epsilon_w0 = lbound(9) + (ubound(9) - lbound(9)) * rand();
    
    
    
    paramvec = [siggma0  varphi0 theta_p0 theta_w0 rho_a0 phi_pi0 phi_y0 epsilon_p0 epsilon_w0];
    
    save('paramvec')
    
    dynare sticky_wages_tech;
    
    load('irfs_model.mat');
    
    p_inf = [p_inf, pi_p_eps_a];
    w_inf = [w_inf, pi_w_eps_a];
    gdp = [gdp, y_eps_a];
    n = [n, n_eps_a];
end;

p_inf_max = max(p_inf, [], 2);
p_inf_min = min(p_inf, [], 2);
w_inf_max = max(w_inf, [], 2);
w_inf_min = min(w_inf, [], 2);
gdp_max = max(gdp, [], 2);
gdp_min = min(gdp, [], 2);
n_max = max(n, [], 2);
n_min = min(n, [], 2);

horizon = 20;
x = 1:horizon;

figure('Position', [100, 100, 800, 600]);

subplot(2, 2, 1);
fill([x fliplr(x)], [p_inf_min' fliplr(p_inf_max')], [0.8 0.8 0.8], 'EdgeColor', 'none'); % Gray color fill
hold on;
plot(p_inf_min, 'black');
plot(p_inf_max, 'black');
hold off;

subplot(2, 2, 2);
fill([x fliplr(x)], [w_inf_min' fliplr(w_inf_max')], [0.8 0.8 0.8], 'EdgeColor', 'none'); % Gray color fill
hold on;
plot(w_inf_min, 'black');
plot(w_inf_max, 'black');
hold off;

subplot(2, 2, 3);
fill([x fliplr(x)], [gdp_min' fliplr(gdp_max')], [0.8 0.8 0.8], 'EdgeColor', 'none'); % Gray color fill
hold on;
plot(gdp_min, 'black');
plot(gdp_max, 'black');
hold off;

subplot(2, 2, 4);
fill([x fliplr(x)], [n_min' fliplr(n_max')], [0.8 0.8 0.8], 'EdgeColor', 'none'); % Gray color fill
hold on;
plot(n_min, 'black');
plot(n_max, 'black');
hold off;

saveas(gcf,'simul_sign_tech.png')

%% DATA
% =======================================================================
% Load data 
data = readtable("data.xlsx",Sheet="Final");
data.Dates=datetime(data.Date,"Format","yyyy:QQ");
dates=data{2:end,1};
vnames_long = ["int", "prod", "inf", "w", "gdp", "un"];
vnames = ["int", "prod", "inf", "w", "gdp", "un"];

w = log(data{:,4})*100;
inf = log(data{:,7})*100;
gdp = log(data{:,5})*100;
un = data{1:end,2};
int = data{1:end,10};
bvt = log(data{:,8});
hours = log(data{:,6});
prod = bvt./hours*100;

X=[int, prod, inf, w, gdp, un];

figure('Position',[100,100,800,600])

subplot(3,2,1);
plot(data.Dates(1:end,1),X(1:end,1))
title('Interest rate')
ylabel('Pct.')
subplot(3,2,2);
plot(data.Dates(1:end,1), X(1:end,2))
title('Productivity')
ylabel('Pct.')
subplot(3,2,3);
plot(data.Dates(1:end,1), X(1:end,3))
title('Inflation')
ylabel('Pct.')
subplot(3,2,4);
plot(data.Dates(1:end,1), X(1:end,4))
title('Wages')
ylabel('Pct.')
subplot(3,2,5);
plot(data.Dates(1:end,1), X(1:end,5))
title('GDP')
ylabel('Pct.')
subplot(3,2,6);
plot(data.Dates(1:end,1), X(1:end,6))
title('Employment')
ylabel('Pct.')

saveas(gcf,'variables_first_diff.png')

w = diff(log(data{:,4}))*100;
inf = diff(log(data{:,7}))*100;
gdp = diff(log(data{:,5}))*100;
un = diff(data{1:end,2});
int = diff(data{1:end,10});
bvt = log(data{:,8});
hours = log(data{:,6});
prod = diff(bvt./hours)*100;

X=[int, prod, inf, w, gdp, un];


%% Stationarity test
nobs = size(X,1);

[sichat,hqchat,aichat, table2]=pfind(X,12);
p = 4;
lmlags = p;

[Beta,CovBeta,tratioBeta,res,indep,sigma]=VARlsExog(X,p,1,0,0);


companion = comp(Beta,p);
max(abs(eig(companion)))

[results, lm_table]=VARLMtest(lmlags,1,0,X,p);

%% VAR ESTIMATION
% =======================================================================
% Define variables 
Xvnames      = vnames;
Xvnames_long = vnames_long;
Xnvar        = length(Xvnames)-1;
% Construct endo


% Set deterministics for the VAR
det = 1;
% Set number of nlags
nlags = p;
% Estimate VAR
[VAR, VARopt] = VARmodel(X,nlags,det);


%% SIGN RESTRICTIONS
VARopt.vnames = Xvnames_long;
VARopt.vnames_ex = ['corona_dummy'];
VARopt.nsteps = 24;
VARopt.snames = {'ASSETS'};
VARopt.ndraws = 500;
VARopt.quality = 1;
VARopt.FigSize = [26,8];
% VARopt.firstdate = year+(month-1)/12;
VARopt.frequency = 'm';
VARopt.figname= 'graphics/Uhlig_';
VARopt.impact    = 0;
VARopt.mult = 5;


% Define sign restrictions : positive 1, negative -1, unrestricted 0

SIGN = [ 1,0,0,0,0,0; %int
         0,1,0,0,0,0; %tech
         -1,-1,0,0,0,0; %inf
         -1,0,0,0,0,0; %w
         -1,1,0,0,0,0; %gdp
         -1,0,0,0,0,0]; %n
     
% Define the number of steps the restrictions are imposed for:
VARopt.sr_hor = 2;

% Set options the credible intervals
VARopt.pctg = 68;

% Run sign restrictions routine
SRout = SR(VAR,SIGN,VARopt);


%% Draw IRF and save

figure('Position',[100,100,800,600])
FigSize(20,24)
idx = [1 2 3 4 5 6];
for ii=1:6
    subplot(3,2,idx(ii))
    PlotSwathe(SRout.IRmed(:,ii,1)/SRout.IRmed(1,1,1),[SRout.IRinf(:,ii,1)/SRout.IRmed(1,1,1) SRout.IRsup(:,ii,1)/SRout.IRmed(1,1,1)]); hold on
    plot(zeros(VARopt.nsteps),'--k');
    title(vnames_long{ii})
    
    xlabel("Quarters")
    ylabel("Percent")
    axis padded
end

figure('Position',[100,100,800,600])
FigSize(20,24)
idx = [1 2 3 4 5 6];
for ii=1:6
    subplot(3,2,idx(ii))
    PlotSwathe(SRout.IRmed(:,ii,2)/SRout.IRmed(1,2,2),[SRout.IRinf(:,ii,2)/SRout.IRmed(1,2,2) SRout.IRsup(:,ii,2)/SRout.IRmed(1,2,2)]); hold on
    plot(zeros(VARopt.nsteps),'--k');
    title(vnames_long{ii})
    
    xlabel("Quarters")
    ylabel("Percent")
    axis padded
end

SIRF_int = SRout.IRmed(:,:,1)/SRout.IRmed(1,1,1);
SIRF_low_int = SRout.IRinf(:,:,1)/SRout.IRmed(1,1,1); 
SIRF_up_int = SRout.IRsup(:,:,1)/SRout.IRmed(1,1,1); 


SIRF_tech = SRout.IRmed(:,:,2)/SRout.IRmed(1,2,2);
SIRF_low_tech = SRout.IRinf(:,:,2)/SRout.IRmed(1,2,2);
SIRF_up_tech = SRout.IRsup(:,:,2)/SRout.IRmed(1,2,2);

save("irf_data", "SIRF_int", "SIRF_low_int", "SIRF_up_int", "SIRF_tech", "SIRF_low_tech", "SIRF_up_tech")

%% Match interest rate shock

siggma0 = 1;
varphi0 = 5;
theta_p0 = 0.75;
theta_w0 = 0.75;
% rho_a0  = 0.9;
rho_i0 = 0.9;
phi_pi0 = 1.5;
phi_y0 = 0.125;
epsilon_p0 = 6;
epsilon_w0 = 6;
% betta0  = 0.95;
% alppha0 = 0.25;

paramvec = [siggma0  varphi0 theta_p0 theta_w0 rho_i0 phi_pi0 phi_y0 epsilon_p0 epsilon_w0];

save("paramvec");

dynare sticky_wages_int;

initparams = paramvec;  

% Declare upper and lower bounds for these parameters 
lbound = [    0.5     0.5      0          0     0.01   1.01    0.01   0.1      0.1 ];      
ubound = [     5       3      0.99       0.99   0.99     3      0.5     9       9   ];  

% Initiate minimization 
[estimates,fval,exitflag,output] = fmincon(@Estim_int,initparams,[],[],[],[],lbound,ubound);

save('paramvec_int', 'paramvec')

horizon=20;
x = 1:horizon; 

figure('Position',[100,100,800,600])

subplot(2,2,1);
fill([x, fliplr(x)], [SIRF_low_int(1:horizon,3)', fliplr(SIRF_up_int(1:horizon,3)')], [0.8 0.8 0.8], 'LineStyle', 'none');hold on;
plot(SIRF_int(1:horizon,3), 'k', 'LineWidth', 1.5); hold on;
plot(pi_p_eps_i(1:horizon), 'b--', 'LineWidth', 1.5); hold on;
title('Price inflation');


% Wage Inflation Plot
subplot(2,2,2);
fill([x, fliplr(x)], [SIRF_low_int(1:horizon,4)', fliplr(SIRF_up_int(1:horizon,4)')], [0.8 0.8 0.8], 'LineStyle', 'none');hold on;
plot(SIRF_int(1:horizon,4), 'k', 'LineWidth', 1.5); hold on;
plot(pi_w_eps_i(1:horizon), 'b--', 'LineWidth', 1.5); hold on;
title('Wage inflation');


% Price Inflation Plot
subplot(2,2,3);
fill([x, fliplr(x)], [SIRF_low_int(1:horizon,5)', fliplr(SIRF_up_int(1:horizon,5)')], [0.8 0.8 0.8], 'LineStyle', 'none');hold on;
plot(SIRF_int(1:horizon,5), 'k', 'LineWidth', 1.5); hold on;
plot(y_eps_i(1:horizon), 'b--', 'LineWidth', 1.5); hold on;
title('GDP');


% Employment Plot
subplot(2,2,4);
fill([x, fliplr(x)], [SIRF_low_int(1:horizon,6)', fliplr(SIRF_up_int(1:horizon,6)')], [0.8 0.8 0.8], 'LineStyle', 'none');hold on;
plot(SIRF_int(1:horizon,6), 'k', 'LineWidth', 1.5); hold on;
plot(n_eps_i(1:horizon), 'b--', 'LineWidth', 1.5); hold on;
title('Employment');
legend('68% confidence interval', 'Empirical IRF', 'Theoretical IRF', 'location', 'southeast');

saveas(gcf,'irf_int.png')

%% Match technology rate shock

siggma0 = 1;
varphi0 = 5;
theta_p0 = 0.75;
theta_w0 = 0.75;
rho_a0  = 0.9;
% rho_i0 = 0.9;
phi_pi0 = 1.5;
phi_y0 = 0.125;
epsilon_p0 = 6;
epsilon_w0 = 6;
% betta0  = 0.95;
% alppha0 = 0.25;

paramvec = [siggma0  varphi0 theta_p0 theta_w0 rho_a0 phi_pi0 phi_y0 epsilon_p0 epsilon_w0];

save("paramvec");

dynare sticky_wages_tech;

initparams = paramvec;  

% Declare upper and lower bounds for these parameters 
lbound = [    0.5     0.5      0          0     0.01   1.01    0.01   0.1      0.1 ];      
ubound = [     5       3      0.99       0.99   0.99     3      0.5     9       9   ];  

% Initiate minimization 
[estimates,fval,exitflag,output] = fmincon(@Estim_tech,initparams,[],[],[],[],lbound,ubound);

save('paramvec_tech', 'paramvec')

figure('Position',[100,100,800,600])

subplot(2,2,1);
fill([x, fliplr(x)], [SIRF_low_tech(1:horizon,3)', fliplr(SIRF_up_tech(1:horizon,3)')], [0.8 0.8 0.8], 'LineStyle', 'none');hold on;
plot(SIRF_tech(1:horizon,3), 'k', 'LineWidth', 1.5); hold on;
plot(pi_p_eps_a(1:horizon), 'b--', 'LineWidth', 1.5); hold on;
title('Price inflation');


% Wage Inflation Plot
subplot(2,2,2);
fill([x, fliplr(x)], [SIRF_low_tech(1:horizon,4)', fliplr(SIRF_up_tech(1:horizon,4)')], [0.8 0.8 0.8], 'LineStyle', 'none');hold on;
plot(SIRF_tech(1:horizon,4), 'k', 'LineWidth', 1.5); hold on;
plot(pi_w_eps_a(1:horizon), 'b--', 'LineWidth', 1.5); hold on;
title('Wage inflation');


% Price Inflation Plot
subplot(2,2,3);
fill([x, fliplr(x)], [SIRF_low_tech(1:horizon,5)', fliplr(SIRF_up_tech(1:horizon,5)')], [0.8 0.8 0.8], 'LineStyle', 'none');hold on;
plot(SIRF_tech(1:horizon,5), 'k', 'LineWidth', 1.5); hold on;
plot(y_eps_a(1:horizon), 'b--', 'LineWidth', 1.5); hold on;
title('GDP');


% Employment Plot
subplot(2,2,4);
fill([x, fliplr(x)], [SIRF_low_tech(1:horizon,6)', fliplr(SIRF_up_tech(1:horizon,6)')], [0.8 0.8 0.8], 'LineStyle', 'none');hold on;
plot(SIRF_tech(1:horizon,6), 'k', 'LineWidth', 1.5); hold on;
plot(n_eps_a(1:horizon), 'b--', 'LineWidth', 1.5); hold on;
title('Employment');
legend('68% confidence interval', 'Empirical IRF', 'Theoretical IRF', 'location', 'northeast');

saveas(gcf,'irf_tech.png')

%% Match both shocks

siggma0 = 1;
varphi0 = 5;
theta_p0 = 0.75;
theta_w0 = 0.75;
rho_a0  = 0.9;
rho_i0 = 0.9;
phi_pi0 = 1.5;
phi_y0 = 0.125;
epsilon_p0 = 6;
epsilon_w0 = 6;
% betta0  = 0.95;
% alppha0 = 0.25;

paramvec = [siggma0  varphi0 theta_p0 theta_w0 rho_a0 rho_i0 phi_pi0 phi_y0 epsilon_p0 epsilon_w0];

save("paramvec");

dynare sticky_wages_both;

initparams = paramvec;  


% Declare upper and lower bounds for these parameters 
lbound = [    0.5     0.5      0          0    0.01     0.01   1.01    0.01   0.1      0.1 ];      
ubound = [     5       3      0.99       0.99  0.99     0.99     3      0.5     9       9   ];  


% Initiate minimization 
[estimates,fval,exitflag,output] = fmincon(@Estim_both,initparams,[],[],[],[],lbound,ubound);

save('paramvec_both', 'paramvec')


figure('Position',[100,100,800,600])


subplot(2,2,1);
fill([x, fliplr(x)], [SIRF_low_int(1:horizon,3)', fliplr(SIRF_up_int(1:horizon,3)')], [0.8 0.8 0.8], 'LineStyle', 'none');hold on;
plot(SIRF_int(1:horizon,3), 'k', 'LineWidth', 1.5); hold on;
plot(pi_p_eps_i(1:horizon), 'b--', 'LineWidth', 1.5); hold on;
title('Price inflation');


% Wage Inflation Plot
subplot(2,2,2);
fill([x, fliplr(x)], [SIRF_low_int(1:horizon,4)', fliplr(SIRF_up_int(1:horizon,4)')], [0.8 0.8 0.8], 'LineStyle', 'none');hold on;
plot(SIRF_int(1:horizon,4), 'k', 'LineWidth', 1.5); hold on;
plot(pi_w_eps_i(1:horizon), 'b--', 'LineWidth', 1.5); hold on;
title('Wage inflation');


% Price Inflation Plot
subplot(2,2,3);
fill([x, fliplr(x)], [SIRF_low_int(1:horizon,5)', fliplr(SIRF_up_int(1:horizon,5)')], [0.8 0.8 0.8], 'LineStyle', 'none');hold on;
plot(SIRF_int(1:horizon,5), 'k', 'LineWidth', 1.5); hold on;
plot(y_eps_i(1:horizon), 'b--', 'LineWidth', 1.5); hold on;
title('GDP');


% Employment Plot
subplot(2,2,4);
fill([x, fliplr(x)], [SIRF_low_int(1:horizon,6)', fliplr(SIRF_up_int(1:horizon,6)')], [0.8 0.8 0.8], 'LineStyle', 'none');hold on;
plot(SIRF_int(1:horizon,6), 'k', 'LineWidth', 1.5); hold on;
plot(n_eps_i(1:horizon), 'b--', 'LineWidth', 1.5); hold on;
title('Employment');
legend('68% confidence interval', 'Empirical IRF', 'Theoretical IRF', 'location', 'southeast');

saveas(gcf,'irf_int_both.png')

figure('Position',[100,100,800,600])

subplot(2,2,1);
fill([x, fliplr(x)], [SIRF_low_tech(1:horizon,3)', fliplr(SIRF_up_tech(1:horizon,3)')], [0.8 0.8 0.8], 'LineStyle', 'none');hold on;
plot(SIRF_tech(1:horizon,3), 'k', 'LineWidth', 1.5); hold on;
plot(pi_p_eps_a(1:horizon), 'b--', 'LineWidth', 1.5); hold on;
title('Price inflation');


% Wage Inflation Plot
subplot(2,2,2);
fill([x, fliplr(x)], [SIRF_low_tech(1:horizon,4)', fliplr(SIRF_up_tech(1:horizon,4)')], [0.8 0.8 0.8], 'LineStyle', 'none');hold on;
plot(SIRF_tech(1:horizon,4), 'k', 'LineWidth', 1.5); hold on;
plot(pi_w_eps_a(1:horizon), 'b--', 'LineWidth', 1.5); hold on;
title('Wage inflation');


% Price Inflation Plot
subplot(2,2,3);
fill([x, fliplr(x)], [SIRF_low_tech(1:horizon,5)', fliplr(SIRF_up_tech(1:horizon,5)')], [0.8 0.8 0.8], 'LineStyle', 'none');hold on;
plot(SIRF_tech(1:horizon,5), 'k', 'LineWidth', 1.5); hold on;
plot(y_eps_a(1:horizon), 'b--', 'LineWidth', 1.5); hold on;
title('GDP');


% Employment Plot
subplot(2,2,4);
fill([x, fliplr(x)], [SIRF_low_tech(1:horizon,6)', fliplr(SIRF_up_tech(1:horizon,6)')], [0.8 0.8 0.8], 'LineStyle', 'none');hold on;
plot(SIRF_tech(1:horizon,6), 'k', 'LineWidth', 1.5); hold on;
plot(n_eps_a(1:horizon), 'b--', 'LineWidth', 1.5); hold on;
title('Employment');
legend('68% confidence interval', 'Empirical IRF', 'Theoretical IRF', 'location', 'northeast');

saveas(gcf,'irf_tech_both.png')


%% 


% paramvec_int = load('paramvec_int')
% paramvec_int = [round(paramvec_int.paramvec(1:4),2), "*", round(paramvec_int.paramvec(5:end),2)]

paramvec_tech = load('paramvec_tech')
paramvec_tech = [round(paramvec_tech.paramvec(1:5),2), "*", round(paramvec_tech.paramvec(6:end),2)]
% 
paramvec_both = load('paramvec_both')
paramvec_both = round(paramvec_both.paramvec,2)


% paramvec_both = load('paramvec_both')


lbound = [    0.5,     0.5,      0,          0,    0.01,     0.01,   1.01,    0.01,   0.1,      0.1 ];      
ubound = [     5,       3,      0.99,       0.99,  0.99,     0.99,     3,      0.5,     9,       9   ];  

paramvec_names = {'$\\sigma$'; '$\\varphi$'; '$\\theta_p$'; '$\\theta_w$'; '$\\rho_a$'; '$\\rho_i$'; '$\\phi_pi$'; '$\\phi_y$'; '$\\epsilon_p$'; '$\\epsilon_w$'}';


compare_vec = [paramvec_names; num2cell(lbound); num2cell(ubound); num2cell(paramvec_int); num2cell(paramvec_tech); num2cell(paramvec_both)]';

table2latex(compare_vec);

%% 
display("test_1_test")
