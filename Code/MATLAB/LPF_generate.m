function Hd = LPF_generate
%UNTITLED Returns a discrete-time filter object.

% MATLAB Codes
% Generated by MATLAB(R) 9.7 and Signal Processing Toolbox 8.3.
% Generated on: 06-May-2020 14:50:46

% Equiripple Lowpass filter designed using the FIRPM function.

% All frequency values are normalized to 1.

Fpass = 0.3;     % Passband Frequency
Fstop = 0.5;     % Stopband Frequency
Dpass = 0.0157;  % Passband Ripple
Dstop = 0.0066;  % Stopband Attenuation
dens  = 20;      % Density Factor

% Calculate the order from the parameters using FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fpass, Fstop], [1 0], [Dpass, Dstop]);

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, Fo, Ao, W, {dens});
Hd = dfilt.dffir(b);

% [EOF]
