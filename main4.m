% % Word recognition in MATLAB
% % Author : Dr. Selvaraaju Murugesan, LaTrobe University, Ausralia
% % Date : 09-07-2014

% %  traning phase

clc; clear;close all
w = warning ('off','all');
Fs=8000;

% %  For "twit"s

filepart1='twit-';
filepart2='.wav';


% %  check for signal length
% %  we will append zeros after VAD to make sure all the signals are of
% % equal length
% % We need same number of MFCC of each signal
length_all_sig=[];
for i=1:22
    filename=strcat(filepart1,num2str(i),filepart2);
    y3=audioread(filename);
    y2=y3(:,1);
    if length(y2) < 16000
        numZeros = 16000-length(y2);
        y1=[y2; zeros(numZeros,1)];
    else
        y1 = y2(1:16000);
    end
    %y1=audioread(filename);
    
% % %     results = VAD(filename,0.1,0.025,0.0125,20,1);
% % %     
% % %     ind_st=(0:size(results)-1)*200+1;
% % %     ind_en=(1:size(results))*200;
% % %     
% % %     ind1=ind_st(logical(results));
% % %     ind2=ind_en(logical(results));
% % %     
% % %     all_ind=cell2mat(arrayfun(@colon,ind1,ind2,'uni',0));
    filt_signal=y1;
    
    length_all_sig=[length_all_sig length(filt_signal)];
end

max_length=max(length_all_sig);

all_data_Twit=[];

for i = 1:22
    filename=strcat(filepart1,num2str(i),filepart2);
    
    y3=audioread(filename);
    y2=y3(:,1);
    if length(y2) < 16000
        numZeros = 16000-length(y2);
        y1=[y2; zeros(numZeros,1)];
    else
        y1 = y2(1:16000);
    end
    %y1=audioread(filename);
    
%     results = VAD(filename,0.1,0.025,0.0125,20,1);
%     
%     ind_st=(0:size(results)-1)*200+1;
%     ind_en=(1:size(results))*200;
%     
%     ind1=ind_st(logical(results));
%     ind2=ind_en(logical(results));
%     
%     all_ind=cell2mat(arrayfun(@colon,ind1,ind2,'uni',0));
    filt_signal=y1;
    
    if length(filt_signal)==max_length
        [cepstraTwit,aspectrum,pspectrum] = melfcc(y1,Fs,'wintime',0.025,'hoptime',0.010);
    else
        filt_signal=[filt_signal' zeros(1,max_length-length(filt_signal))];
        [cepstraTwit,aspectrum,pspectrum] = melfcc(filt_signal,Fs,'wintime',0.025,'hoptime',0.010);           
    end   
    
    all_data_Twit=[all_data_Twit cepstraTwit];
end


% %  For "tweet"s

all_data_Tweet=[];
filepart1='tweet-';

length_all_sig=[];
for i=1:11
    filename=strcat(filepart1,num2str(i),filepart2);
    y3=audioread(filename);
    y2=y3(:,1);
    if length(y2) < 16000
        numZeros = 16000-length(y2);
        y1=[y2; zeros(numZeros,1)];
    else
        y1 = y2(1:16000);
    end
    %y1=audioread(filename);
    
%     results = VAD(filename,0.1,0.025,0.0125,20,1);
%     
%     ind_st=(0:size(results)-1)*200+1;
%     ind_en=(1:size(results))*200;
%     
%     ind1=ind_st(logical(results));
%     ind2=ind_en(logical(results));
%     
%     all_ind=cell2mat(arrayfun(@colon,ind1,ind2,'uni',0));
    filt_signal=y1;
    
    length_all_sig=[length_all_sig length(filt_signal)];
end

max_length=max(length_all_sig);

for i = 1:11
    filename=strcat(filepart1,num2str(i),filepart2);
    
%     results = VAD(filename,0.1,0.025,0.0125,20,1);
%     
%     ind_st=(0:size(results)-1)*200+1;
%     ind_en=(1:size(results))*200;
%     
%     ind1=ind_st(logical(results));
%     ind2=ind_en(logical(results));
%     
%     all_ind=cell2mat(arrayfun(@colon,ind1,ind2,'uni',0));
    filt_signal=y1;
    
    if length(filt_signal)==max_length
        [cepstraTweet,aspectrum,pspectrum] = melfcc(y1,Fs,'wintime',0.025,'hoptime',0.010);
    else
        filt_signal=[filt_signal' zeros(1,max_length-length(filt_signal))];
        [cepstraTweet,aspectrum,pspectrum] = melfcc(filt_signal,Fs,'wintime',0.025,'hoptime',0.010);           
    end   
    
    all_data_Tweet=[all_data_Tweet cepstraTweet];
end

% %  For "click"s

all_data_Click=[];
filepart1='click-';

length_all_sig=[];
for i=1:17
    filename=strcat(filepart1,num2str(i),filepart2);
    y3=audioread(filename);
    y2=y3(:,1);
    if length(y2) < 16000
        numZeros = 16000-length(y2);
        y1=[y2; zeros(numZeros,1)];
    else
        y1 = y2(1:16000);
    end
    %y1=audioread(filename);
    
%     results = VAD(filename,0.1,0.025,0.0125,20,1);
%     
%     ind_st=(0:size(results)-1)*200+1;
%     ind_en=(1:size(results))*200;
%     
%     ind1=ind_st(logical(results));
%     ind2=ind_en(logical(results));
%     
%     all_ind=cell2mat(arrayfun(@colon,ind1,ind2,'uni',0));
    filt_signal=y1;
    
    length_all_sig=[length_all_sig length(filt_signal)];
end

max_length=max(length_all_sig);

for i = 1:17
    filename=strcat(filepart1,num2str(i),filepart2);
        y3=audioread(filename);
        y2=y3(:,1);
        if length(y2) < 16000
            numZeros = 16000-length(y2);
            y1=[y2; zeros(numZeros,1)];
        else
            y1 = y2(1:16000);
        end
        %y1=audioread(filename);
    
%     results = VAD(filename,0.1,0.025,0.0125,20,1);
%     
%     ind_st=(0:size(results)-1)*200+1;
%     ind_en=(1:size(results))*200;
%     
%     ind1=ind_st(logical(results));
%     ind2=ind_en(logical(results));
%     
%     all_ind=cell2mat(arrayfun(@colon,ind1,ind2,'uni',0));
    filt_signal=y1;
    
    if length(filt_signal)==max_length
        [cepstraClick,aspectrum,pspectrum] = melfcc(y1,Fs,'wintime',0.025,'hoptime',0.010);
    else
        filt_signal=[filt_signal' zeros(1,max_length-length(filt_signal))];
        [cepstraClick,aspectrum,pspectrum] = melfcc(filt_signal,Fs,'wintime',0.025,'hoptime',0.010);           
    end   
    
    all_data_Click=[all_data_Click cepstraClick];
end

% %  For "chit"s

all_data_Chit=[];
filepart1='chit-';

length_all_sig=[];
for i=1:6
    filename=strcat(filepart1,num2str(i),filepart2);
        y3=audioread(filename);
        y2=y3(:,1);
        if length(y2) < 16000
            numZeros = 16000-length(y2);
            y1=[y2; zeros(numZeros,1)];
        else
            y1 = y2(1:16000);
        end
        %y1=audioread(filename);
    
%     results = VAD(filename,0.1,0.025,0.0125,20,1);
%     
%     ind_st=(0:size(results)-1)*200+1;
%     ind_en=(1:size(results))*200;
%     
%     ind1=ind_st(logical(results));
%     ind2=ind_en(logical(results));
%     
%     all_ind=cell2mat(arrayfun(@colon,ind1,ind2,'uni',0));
    filt_signal=y1;
    
    length_all_sig=[length_all_sig length(filt_signal)];
end

max_length=max(length_all_sig);

for i = 1:6
    filename=strcat(filepart1,num2str(i),filepart2);
        y3=audioread(filename);
        y2=y3(:,1);
        if length(y2) < 16000
            numZeros = 16000-length(y2);
            y1=[y2; zeros(numZeros,1)];
        else
            y1 = y2(1:16000);
        end
        %y1=audioread(filename);
    
%     results = VAD(filename,0.1,0.025,0.0125,20,1);
%     
%     ind_st=(0:size(results)-1)*200+1;
%     ind_en=(1:size(results))*200;
%     
%     ind1=ind_st(logical(results));
%     ind2=ind_en(logical(results));
%     
%     all_ind=cell2mat(arrayfun(@colon,ind1,ind2,'uni',0));
    filt_signal=y1;
    
    if length(filt_signal)==max_length
        [cepstraChit,aspectrum,pspectrum] = melfcc(y1,Fs,'wintime',0.025,'hoptime',0.010);
    else
        filt_signal=[filt_signal' zeros(1,max_length-length(filt_signal))];
        [cepstraChit,aspectrum,pspectrum] = melfcc(filt_signal,Fs,'wintime',0.025,'hoptime',0.010);           
    end   
    
    all_data_Chit=[all_data_Chit cepstraChit];
end


% %  For "chirp"s

all_data_Chirp=[];
filepart1='chirp-';

length_all_sig=[];
for i=1:26
    filename=strcat(filepart1,num2str(i),filepart2);
        y3=audioread(filename);
        y2=y3(:,1);
        if length(y2) < 16000
            numZeros = 16000-length(y2);
            y1=[y2; zeros(numZeros,1)];
        else
            y1 = y2(1:16000);
        end
        %y1=audioread(filename);
    
%     results = VAD(filename,0.1,0.025,0.0125,20,1);
%     
%     ind_st=(0:size(results)-1)*200+1;
%     ind_en=(1:size(results))*200;
%     
%     ind1=ind_st(logical(results));
%     ind2=ind_en(logical(results));
%     
%     all_ind=cell2mat(arrayfun(@colon,ind1,ind2,'uni',0));
    filt_signal=y1;
    
    length_all_sig=[length_all_sig length(filt_signal)];
end

max_length=max(length_all_sig);

for i = 1:18
    filename=strcat(filepart1,num2str(i),filepart2);
        y3=audioread(filename);
        y2=y3(:,1);
        if length(y2) < 16000
            numZeros = 16000-length(y2);
            y1=[y2; zeros(numZeros,1)];
        else
            y1 = y2(1:16000);
        end
        %y1=audioread(filename);
%     
%     results = VAD(filename,0.1,0.025,0.0125,20,1);
%     
%     ind_st=(0:size(results)-1)*200+1;
%     ind_en=(1:size(results))*200;
%     
%     ind1=ind_st(logical(results));
%     ind2=ind_en(logical(results));
%     
%     all_ind=cell2mat(arrayfun(@colon,ind1,ind2,'uni',0));
    filt_signal=y1;
    
    if length(filt_signal)==max_length
        [cepstraChirp,aspectrum,pspectrum] = melfcc(y1,Fs,'wintime',0.025,'hoptime',0.010);
    else
        filt_signal=[filt_signal' zeros(1,max_length-length(filt_signal))];
        [cepstraChirp,aspectrum,pspectrum] = melfcc(filt_signal,Fs,'wintime',0.025,'hoptime',0.010);           
    end   
    
    all_data_Chirp=[all_data_Chirp cepstraChirp];
end


% % Building model

X=[all_data_Twit'];

options = statset('MaxIter',500,'Display','final');
objTwit = gmdistribution.fit(X,8,'CovType',...
    'diagonal','SharedCov',true,'Options',options);

X=[all_data_Tweet'];

objTweet = gmdistribution.fit(X,8,'CovType',...
    'diagonal','SharedCov',true,'Options',options);

X=[all_data_Click'];

objClick = gmdistribution.fit(X,8,'CovType',...
    'diagonal','SharedCov',true,'Options',options);

X=[all_data_Chit'];

objChit = gmdistribution.fit(X,8,'CovType',...
    'diagonal','SharedCov',true,'Options',options);

X=[all_data_Chirp'];

objChirp = gmdistribution.fit(X,8,'CovType',...
    'diagonal','SharedCov',true,'Options',options);

% %  Test data

 %test_data=cepstraTwit';
 test_data=cepstraTweet';
%  test_data=cepstraClick';
 % test_data=cepstraChit';
% test_data=cepstraChirp';

% % Word recognition

[~,nloglTwit] = posterior(objTwit,test_data);

[~,nloglTweet] = posterior(objTweet,test_data);

[~,nloglClick] = posterior(objClick,test_data);

[~,nloglChit] = posterior(objChit,test_data);

[~,nloglChirp] = posterior(objChirp,test_data);

log_like=[nloglTwit nloglTweet nloglClick nloglChit nloglChirp];

[~,Spoken_word]=min(log_like);

words = {' twit' ' tweet' ' click' ' chit' ' chirp'};

soundChoice = words(Spoken_word);

if (Spoken_word < 6)
    disp(strcat('Sound made:',soundChoice,' - happy sound!'));
else
    disp(strcat('Sound made:',soundChoice,' - possibly unhealthy bird, consult a veterinarian'));
end





