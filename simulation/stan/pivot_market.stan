data {
  real profit_obs; // Signals from sample_profit_r function
  int<lower=1> market; // Market index
  int<lower=1> product; // Product index
  real mu_m2a_b;
  real mu_f2s_b_mean;
  real mu_pf_b;
  real sigma_obs;
}

parameters {
  real mu_f2s_b;
}

model {
  mu_f2s_b ~ normal(mu_f2s_b_mean, .1);
  profit_obs ~ normal(mu_pf_b + pow(-1, product) * mu_m2a_b + pow(-1, market) * mu_f2s_b, sigma_obs); 
}