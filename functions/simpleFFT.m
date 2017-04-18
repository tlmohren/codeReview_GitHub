function [ k,freqAmp] = simpleFFT( signal , varargin)
%simpleFFT [ k,freqAmp] = simpleFFT( signal, sampFreq, figureOn)
%   Computes and optionally plots frequency content of a signal. 
%   For matrices, let each row be a signal

    % Determine parameters for different number of input arguments  
    nVarargs = length(varargin);
    if nVarargs == 0
        figureOn = 0;
        sampFreq = 1;
    elseif nVarargs == 1
        sampFreq = varargin{1};
        figureOn = 0;
    elseif nVarargs == 2
        sampFreq = varargin{1};
        figureOn = varargin{2};
    else
        sampFreq = varargin{1};
        figureOn = varargin{2};
        warning('Too many inputs to simpleFFT, will only read first 3 (TLM)')
    end
    
    % check size, flip if signals are column vectors 
    [n,m] = size(signal);
    if m>n 
       signal = signal'; 
        [n,m] = size(signal);
    end 
    
    % Compute the fast fourier transform 
    x = (1:n) / sampFreq;           % horizontal x-axis of signal 
    k = (-n/2:n/2-1) / n*sampFreq;  % discrete frequency 
    freqAmp_preShift = 2/n * fft(signal);         % 
    freqAmp = abs( fftshift(freqAmp_preShift) );

    size(freqAmp)
    % If desired, plot signal and frequency content 
    if figureOn ==1
        figure()
        %------------------------------
        subplot(211); 
        plot(x,signal); 
        xlabel('x [-]');
        ylabel('y [-]')
        %------------------------------
        subplot(212); 
        plot( k , freqAmp,'-o');  %  
        axis([0,max(k),0,max(freqAmp(:))*1.5]);
        xlabel('Frequency [Hz]');
        ylabel('Amplitude [-]');
    end
end

