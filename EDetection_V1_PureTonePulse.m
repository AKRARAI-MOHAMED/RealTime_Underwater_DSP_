%--------------------------------------------------------------------------
%   Author      : AKRARAI MOHAMED    
%   School      : National Institut Of Posts and Telecommunications
%   Description : In This file we calculate the Probablity of detection for            
%                 Energy Detection for a Pure Tone pulse for Different
%                 Numbers of Samples[100 1000].  
%--------------------------------------------------------------------------
clc;
clear all
A = 1; % Amplitude
f0 = 1e3; % Signal Frequency

% T = 10e-3; % Pulse width 
phi = 0; % signal phase

Pd = zeros([4 10]);

k = 0;
for SNR = -40:10:-10
    
k = k + 1;
i = 0;
V = zeros([10 1000]);
    
 for N = 100:100:1000
    i = i + 1;
    fs = 100 * 1e3;
    t = (0:N-1)/fs; % time index
    Xp = A*cos(2*pi*t*f0+phi);
    
    for j =1:1:1000
        
    Y = awgn(Xp,SNR,'measured'); % the signal power -28.3 dBW
    Noise = Y - Xp;
    % rms(Noise)^2; measure the noise power.
    La  = abs(abs(fft(Noise).^2));
    LambdAmf = sum(La)/N;
    Sta = abs(abs(fft(Y).^2));
    Tmf = sum(Sta)/N;
    
    if  (Tmf > LambdAmf)    
        V( i , j ) = 1;
    end
    end 
    Pd( k , i ) = (sum(V(i,:))/1000);
 end
end

Nsamples = 1:1:10;
figure;
plot(Nsamples*100,Pd(1,:),Nsamples*100,Pd(2,:),Nsamples*100,Pd(3,:),Nsamples*100,Pd(4,:))
title('Pd(N) for Matched Filter Method, Pure Tone signal')
xlabel('N samples')
ylabel('Probability of Detection')
grid
hold off

legend('-40 dB','-30 dB','-20 dB','-10 dB')

% figure;
% plot(real(sig))
% figure;
% plot(real(Y))
% title('Noised signal')