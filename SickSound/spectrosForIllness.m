close all
[y, fs] = audioread('squeak - 01.wav');
spectrogram(y, 'yaxis')

figure
[y, fs] = audioread('squeak - 06.wav');
spectrogram(y, 'yaxis')

figure
[y, fs] = audioread('squeak - 03.wav');
spectrogram(y, 'yaxis')

figure
[y, fs] = audioread('cough-1.wav');
spectrogram(y, 'yaxis')

figure
[y, fs] = audioread('cough-14.wav');
spectrogram(y, 'yaxis')

figure
[y, fs] = audioread('cough-24.wav');
spectrogram(y, 'yaxis')