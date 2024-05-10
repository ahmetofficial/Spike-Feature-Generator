clear; clc;

load('neurons.mat');

spike_times = n1/1000;
% n1 = n1;
% n1 = int32(n1);
% spike_times = {n1'};
% n2 = n2/1000;
% n3 = n3/1000;

fs             = 24000; 
segment_length = 10;
oscillations   = oscillation_bootstrap(spike_times, segment_length, fs);

