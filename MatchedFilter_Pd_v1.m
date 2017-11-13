%% Pure tone sine wave 
clc
clear all
clear figure
% PARAMETERS
A = 1; % amplitude
f0 = 20e3; % Signal Frequency
T = 10e-3; % Pulse width 
fs = 96e3; % Sampling Frequency
L = 128; % Pulse sampling lendth
t = (0:L-1)/fs; % time index
phi = 0; % signal phase
Ncycle = 100;
%Thr = 2;
Pdi = zeros ([1 Ncycle]);
Pdn = zeros ([4 70]);
% SIGNAL GENERATION
%Xp = A * exp(2*1i*pi*f0*t).*rectangularPulse(0,T,t);
Xp =  A*sin(2*pi*t*f0+phi);
%% plotting the signal
% plot(t,real(Xp),'LineWidth',1);
% xlabel('Time, (s)');
% ylabel('Amplitude');
% title('Input signal');
%% Noise generation

for Thr = 1:1:4
sn = 0;
for SNR  = -40 :1:30
    sn = sn+1; 
    Pdi = zeros ([1 Ncycle]);
    for i = 1:1:Ncycle
        Y = awgn(Xp,SNR); % todo, adjust signal power in db
        Noise =  Y - Xp;
        My = (1/L) * conv(Y, Xp);
        Mn = (1/L) * conv(Noise, Xp);
            My_average = sum(My);%/length(My);
            Mn_average = sum(Mn);%/length(Mn);
            Mn_averageTh = Thr * Mn_average;
        if (My_average > Mn_averageTh) 
            Pdi(i) = 1;
        end
    end 
    Pdn(Thr, sn) = sum(Pdi)/Ncycle;
end
end

%% Matched filtering the received signal

% Y = awgn(Xp,1); % todo, adjust signal power in db
% Noise =  Y - Xp;
% My = (1/L) * CONV(Y, Xp)
% Mn = (1/L) * CONV(Noise, Xp)
% My_average = sum(My)/length(My)
% Mn_average = sum(Mn)/length(Mn)
%         if (My_average >  Mn_average) 
%             Pdinst= 1
%         end

% figure; % new figure
% plot(My, 'r') 
% title('Amplitude Spectrum of My')
% xlabel('Samples') % 2 x L;
% ylabel('Matched Filter My Amplitude')
% 
% %hold on; % new figure
% figure;
% plot(Mn) 
% title('Amplitude Spectrum of Mn')
% xlabel('Samples') % 2 x L;
% ylabel('Matched Filter Mn Amplitude')

% Pd plot
figure;
%plot(Pdn(1,:), 'r', Pdn(2,:), 'g', Pdn(3,:), 'y', Pdn(4,:));
xlabel('SNR (db)');
ylabel('Pd');
title('Matched Filter Pd ');
plot(Pdn(1,:), 'r');
hold on;
plot(Pdn(2,:), 'g');
hold on;
plot(Pdn(3,:),'y');
hold on;
plot(Pdn(4,:));

