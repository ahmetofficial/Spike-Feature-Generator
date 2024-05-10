function filter = LFP(f_cutoff)

    Fpass  = f_cutoff - 30;  % passband frequency
    Fstop  = f_cutoff;       % stopband frequency
    Ap     = 0.1;            % passband ripple
    Ast    = 30;             % stopband ripple
    Fs     = 5000;           % window length

    filter = designfilt('lowpassfir','PassbandFrequency',Fpass,...
                        'StopbandFrequency',Fstop,'PassbandRipple',Ap,...
                        'StopbandAttenuation',Ast,'SampleRate',Fs);

end

