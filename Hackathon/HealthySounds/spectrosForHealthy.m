close all
[y, fs] = audioread('chirp-1.wav');
spectrogram(y(:,1), 'yaxis')

figure
[y, fs] = audioread('chirp-9.wav');
spectrogram(y(:,1), 'yaxis')

figure
[y, fs] = audioread('chirp-22.wav');
spectrogram(y(:,1), 'yaxis')

figure
[y, fs] = audioread('twit-1.wav');
spectrogram(y(:,1), 'yaxis')

figure
[y, fs] = audioread('tweet-9.wav');
spectrogram(y(:,1), 'yaxis')

figure
[y, fs] = audioread('tweet-7.wav');
spectrogram(y(:,1), 'yaxis')