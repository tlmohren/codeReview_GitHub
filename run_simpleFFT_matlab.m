%run_simpleFFT%
% ==========
% FFT example
% TMOHREN
% ----------
clc;clear all;close all
addpath('functions')

%% set parameters-----------------------
sampFreq = 100;  
t = 0:(1/sampFreq):10;
figureOn = 1;

%% create signal ---------------------------
simpleSignal = 2.6 * sin(4 * 2*pi*t) +...
                1.5 * sin(9 * 2*pi*t);

%% try out different variable inputs
[freq,freqAmp] = simpleFFT(simpleSignal);
% 
[freq,freqAmp] = simpleFFT(simpleSignal,sampFreq);

[freq,freqAmp] = simpleFFT(simpleSignal,sampFreq,figureOn);
% 
[freq,freqAmp] = simpleFFT( simpleSignal'*[1,1.3,1.5] ,sampFreq,figureOn);

[freq,freqAmp] = simpleFFT( (simpleSignal'*[1,1.3,1.5])' ,sampFreq,figureOn);

[freq,freqAmp] = simpleFFT(simpleSignal,sampFreq,figureOn,t,simpleSignal);