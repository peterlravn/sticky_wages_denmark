function F=Estim_jrmodel(paramvec)

global oo_ M_ options_ ; 

save('paramvec','paramvec');

% Run model with current parameter values and compute IRFs
dynare sticky_wages_tech noclearall

load 'irfs_model';

% Load the empirical IRFs
load 'irf_data'; 

% Then match the IRFs together
numb=20; %Number of periods for which IRFs are matched
period1=1;

moments = 1*[ 
   pi_p_eps_a(period1:numb)-SIRF_tech(period1:numb,3);
   pi_w_eps_a(period1:numb)-SIRF_tech(period1:numb,4);
   y_eps_a(period1:numb)-SIRF_tech(period1:numb,5);
   n_eps_a(period1:numb)-SIRF_tech(period1:numb,6);];


n = 20; % Size of the small square matrix
m = 4; % Number of times to repeat the pattern along the diagonal

weightmatrix = zeros(n*m);

for k = 0:m-1
    for i = 1:n
        weightmatrix(k*n+i, k*n+i) = 1 / i;
    end
end

F=moments'*weightmatrix*moments;

DynareOptions.qz_criterium=options_.qz_criterium;
testnumb_a=(sum(abs(oo_.dr.eigval) > DynareOptions.qz_criterium));
testnumb_b=M_.nsfwrd;

if testnumb_a ~= testnumb_b
    F=F+1000;       %Penalty for parametrizations where the BK or rank conditions are not satisfied
end

 