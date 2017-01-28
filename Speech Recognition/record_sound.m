% % Word recognition in MATLAB
% % Author : Dr. Selvaraaju Murugesan, LaTrobe University, Ausralia
% % Date : 09-07-2014

% % Use this file to record your work

% % You have to record your word ten times

% %  Change the filepart1 string for each word


w = warning ('off','all');
clc; clear;close all
Duration=2;
Fs=8000;
filepart1='myrecordthree';
filepart2='.wav';
for i = 1:10
    disp('Record now'); 
    y=wavrecord(Duration*Fs,Fs);
    disp('Recording Finished');
    filename=strcat(filepart1,num2str(i),filepart2);
    wavwrite(y,Fs,filename);
end