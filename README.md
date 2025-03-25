# Spike Feature Generator Toolbox

## Description

The Spike Feature Generator Toolbox is a collection of MATLAB scripts designed for the analysis of single-unit activity (SUA) extracted from microelectrode recordings (MER) collected during deep brain stimulation (DBS) surgeries. The toolbox provides a comprehensive set of tools for characterizing neural activity with a wide range of neural metrics including spiking patterns (tonic, bursting, irregular), firing rate, firing regularity, burstiness, neural oscillations, neural pauses, spectral coherence between SUA and background activity (BUA), and power spectrum.

[Wave_Clus MATLAB toolbox](https://github.com/csn-le/wave_clus) was used to extract SUA activity from MERs. The output file of this toolbox which stores the timing of observed spikes was used as input.

## Firing Rate and Firing Regularity

Firing rate and firing regularity metrics are calculated to quantify the temporal firing characteristics of neurons. 
[The adaptive kernel smoother (BAKS)](https://github.com/nurahmadi/BAKS) method is utilized to estimate the instantaneous firing rate while firing regularity is quantified using a logarithmic transformation of the coefficient of variation in spike trains. Following metrics are provided for this category:

- mean firing rate (spikes/sec)
- firing regularity
- coefficient of variation
- local variation
- asymmetry index
- ISI mean
- ISI std
- ISI skewness
- ISI correlation coefficient

## Spiking Pattern

Firing regularity metrics can classify the neurons into subcategories based on their firing characteristic.

- tonic neuron
- irregular neuron
- bursting neuron

## Bursting

Bursting activity, characterized by repeated firing of discrete groups of spikes, is detected using the [Rank Surprise method](https://doi.org/10.1152/jn.00979.2005). 
The method uses two user-defined parameters: the largest ISI allowed in a burst (limit) and the minimum RS (threshold) that a burst must be considered valid. We selected 75% as the largest ISI allowed in a burst and 0.01 as the minimum significance level for the selected burst region.Various burst-related features are extracted only for bursting neurons:

- bursting spike proportion
- bursting average spikes
- burst index
- inter burst duration (ms)
- burst frequency (spikes/sec)
- burst duration (ms)
- burst count

## Neural Oscillations

Neural oscillations are detected using the [Oscillation Score](https://www.raulmuresan.ro/sources/oscore/) algorithm that utilizes autocorrelation histograms on spike trains to estimate the 
strength of oscillatory activity at the single-neuron level. To establish a confidence measure for the oscillation scores in our single-trial experiments,
we employed a bootstrap test with 100 iterations. In each iteration, we randomly shuffled the spike train while maintaining the number of spikes and the refractory period. 
Subsequently, we computed the oscillation score for the shuffled spike train. By repeating this process for 100 iterations, we obtained a null distribution of oscillation scores, 
representing random activity for the selected SUA. To determine the significance level for the computed oscillation score within a specific frequency band, we defined the boundaries of the 95th
percentile of the null distribution (2.5% for the lower boundary and 97.5% for the upper boundary). If the original oscillation score exceeded the threshold defined by the upper boundary, 
we considered the observed oscillatory activity to be significant. Bootstrapping allowed us to assess the significance of the detected neural oscillations and provided a reliable measure 
for our analyses. The following oscillation metric generated for each neuron:

- delta band [1-4 Hz] oscillatory (boolean)
- theta band [4-8 Hz] oscillatory (boolean)
- alpha band [8-12 Hz] oscillatory (boolean)
- beta band [13-30 Hz] oscillatory (boolean)
- gamma band [30-100 Hz] oscillatory (boolean)
- oscillatory
- delta band oscillatory frequency [Hz]
- theta band oscillatory frequency [Hz]
- alpha band oscillatory frequency [Hz]
- beta band oscillatory frequency [Hz]
- gamma band oscillatory frequency [Hz]

## Neural Pauses

Neural pauses, representing periods of hypoactivity in neurons, are detected using the [inversion of Poisson Surprise method](https://github.com/tcwhalen/InVivo/blob/master/surprisePause.m). 
Following neural pause metrics were generated:

- pause index
- pause ratio
- pause frequency [Hz]
- pause duration [ms]
- pause time proportion [%]
- pause spike proportion [%]
- pause count

## Research Papers Utilizing the Toolbox

- [Spiking Patterns in the Globus Pallidus Highlight Convergent Neural Dynamics across Diverse Genetic Dystonia Syndromes](https://doi.org/10.1002/ana.27185), Annals of Neurology - 2025
- [Illustration of the long-term efficacy of pallidal deep brain stimulation in a patient with PKAN dystonia](https://doi.org/10.1016/j.parkreldis.2024.106977), Parkinsonism & Related Disorders - 2024
- [A novel GNAL pathogenic variant leading to generalized dystonia: Immediate and sustained response to globus pallidus internus deep brain stimulation](https://doi.org/10.1016/j.parkreldis.2023.105833), Parkinsonism & Related Disorders - 2023
- [Patterns of neural activity and clinical outcomes in a juvenile Huntington's Disease patient undergoing Deep Brain Stimulation of the subthalamic nucleus](https://doi.org/10.1016/j.jdbs.2023.03.001), Deep Brain Stimulation - 2023



## Installation

1. Clone the repository:
$ git clone https://github.com/ahmetofficial/Spike-Feature-Generator.git
2. Install required dependencies.
3. Run the MATLAB scripts for spike detection, sorting, and feature extraction.

## Contributing

Contributions to The Spike Feature Generator Toolbox are welcome! Please fork the repository, make your changes, and submit a pull request.
