% % Word recognition in MATLAB
% % Author : Dr. Selvaraaju Murugesan, LaTrobe University, Ausralia
% % Date : 09-07-2014

% %  traning phase

clc; clear;close all
w = warning ('off','all');
Fs=44100;

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
    y1=audioread(filename);
    
    results = VAD(filename,0.1,0.025,0.0125,20,1);
    
    ind_st=(0:size(results)-1)*200+1;
    ind_en=(1:size(results))*200;
    
    ind1=ind_st(logical(results));
    ind2=ind_en(logical(results));
    
    all_ind=cell2mat(arrayfun(@colon,ind1,ind2,'uni',0));
    filt_signal=y1(length(all_ind));
    
    length_all_sig=[length_all_sig length(filt_signal)];
end

max_length=max(length_all_sig);

all_data_one=[];

for i = 1:22
    filename=strcat(filepart1,num2str(i),filepart2);
    y1=audioread(filename);
    
    results = VAD(filename,0.1,0.025,0.0125,20,1);
    
    ind_st=(0:size(results)-1)*200+1;
    ind_en=(1:size(results))*200;
    
    ind1=ind_st(logical(results));
    ind2=ind_en(logical(results));
    
    all_ind=cell2mat(arrayfun(@colon,ind1,ind2,'uni',0));
    filt_signal=y1(length(all_ind));
    
    if length(filt_signal)==max_length
        [cepstra1,aspectrum,pspectrum] = melfcc(y1,Fs,'wintime',0.025,'hoptime',0.010);
    else
        filt_signal=[filt_signal' zeros(1,max_length-length(filt_signal))];
        [cepstra1,aspectrum,pspectrum] = melfcc(filt_signal,Fs,'wintime',0.025,'hoptime',0.010);           
    end   
    
    all_data_one=[all_data_one cepstra1];
end


% %  For "tweet"s

all_data_two=[];
filepart1='tweet-';

length_all_sig=[];
for i=1:11
    filename=strcat(filepart1,num2str(i),filepart2);
    y1=audioread(filename);
    
    results = VAD(filename,0.1,0.025,0.0125,20,1);
    
    ind_st=(0:size(results)-1)*200+1;
    ind_en=(1:size(results))*200;
    
    ind1=ind_st(logical(results));
    ind2=ind_en(logical(results));
    
    all_ind=cell2mat(arrayfun(@colon,ind1,ind2,'uni',0));
    filt_signal=y1(length(all_ind));
    
    length_all_sig=[length_all_sig length(filt_signal)];
end

max_length=max(length_all_sig);

for i = 1:11
    filename=strcat(filepart1,num2str(i),filepart2);
    y1=audioread(filename);
    
    results = VAD(filename,0.1,0.025,0.0125,20,1);
    
    ind_st=(0:size(results)-1)*200+1;
    ind_en=(1:size(results))*200;
    
    ind1=ind_st(logical(results));
    ind2=ind_en(logical(results));
    
    all_ind=cell2mat(arrayfun(@colon,ind1,ind2,'uni',0));
    filt_signal=y1(length(all_ind));
    
    if length(filt_signal)==max_length
        [cepstra2,aspectrum,pspectrum] = melfcc(y1,Fs,'wintime',0.025,'hoptime',0.010);
    else
        filt_signal=[filt_signal' zeros(1,max_length-length(filt_signal))];
        [cepstra2,aspectrum,pspectrum] = melfcc(filt_signal,Fs,'wintime',0.025,'hoptime',0.010);           
    end   
    
    all_data_two=[all_data_two cepstra2];
end

% %  For "click"s

all_data_three=[];
filepart1='click-';

length_all_sig=[];
for i=1:18
    filename=strcat(filepart1,num2str(i),filepart2);
    y1=audioread(filename);
    
    results = VAD(filename,0.1,0.025,0.0125,20,1);
    
    ind_st=(0:size(results)-1)*200+1;
    ind_en=(1:size(results))*200;
    
    ind1=ind_st(logical(results));
    ind2=ind_en(logical(results));
    
    all_ind=cell2mat(arrayfun(@colon,ind1,ind2,'uni',0));
    filt_signal=y1(length(all_ind));
    
    length_all_sig=[length_all_sig length(filt_signal)];
end

max_length=max(length_all_sig);

for i = 1:18
    filename=strcat(filepart1,num2str(i),filepart2);
    y1=audioread(filename);
    
    results = VAD(filename,0.1,0.025,0.0125,20,1);
    
    ind_st=(0:size(results)-1)*200+1;
    ind_en=(1:size(results))*200;
    
    ind1=ind_st(logical(results));
    ind2=ind_en(logical(results));
    
    all_ind=cell2mat(arrayfun(@colon,ind1,ind2,'uni',0));
    filt_signal=y1(length(all_ind));
    
    if length(filt_signal)==max_length
        [cepstra3,aspectrum,pspectrum] = melfcc(y1,Fs,'wintime',0.025,'hoptime',0.010);
    else
        filt_signal=[filt_signal' zeros(1,max_length-length(filt_signal))];
        [cepstra3,aspectrum,pspectrum] = melfcc(filt_signal,Fs,'wintime',0.025,'hoptime',0.010);           
    end   
    
    all_data_three=[all_data_three cepstra3];
end

% %  For "chit"s

all_data_four=[];
filepart1='chit-';

length_all_sig=[];
for i=1:7
    filename=strcat(filepart1,num2str(i),filepart2);
    y1=audioread(filename);
    
    results = VAD(filename,0.1,0.025,0.0125,20,1);
    
    ind_st=(0:size(results)-1)*200+1;
    ind_en=(1:size(results))*200;
    
    ind1=ind_st(logical(results));
    ind2=ind_en(logical(results));
    
    all_ind=cell2mat(arrayfun(@colon,ind1,ind2,'uni',0));
    filt_signal=y1(length(all_ind));
    
    length_all_sig=[length_all_sig length(filt_signal)];
end

max_length=max(length_all_sig);

for i = 1:7
    filename=strcat(filepart1,num2str(i),filepart2);
    y1=audioread(filename);
    
    results = VAD(filename,0.1,0.025,0.0125,20,1);
    
    ind_st=(0:size(results)-1)*200+1;
    ind_en=(1:size(results))*200;
    
    ind1=ind_st(logical(results));
    ind2=ind_en(logical(results));
    
    all_ind=cell2mat(arrayfun(@colon,ind1,ind2,'uni',0));
    filt_signal=y1(length(all_ind));
    
    if length(filt_signal)==max_length
        [cepstra4,aspectrum,pspectrum] = melfcc(y1,Fs,'wintime',0.025,'hoptime',0.010);
    else
        filt_signal=[filt_signal' zeros(1,max_length-length(filt_signal))];
        [cepstra4,aspectrum,pspectrum] = melfcc(filt_signal,Fs,'wintime',0.025,'hoptime',0.010);           
    end   
    
    all_data_four=[all_data_four cepstra4];
end


% %  For "chirp"s

all_data_five=[];
filepart1='chirp-';

length_all_sig=[];
for i=1:26
    filename=strcat(filepart1,num2str(i),filepart2);
    y1=audioread(filename);
    
    results = VAD(filename,0.1,0.025,0.0125,20,1);
    
    ind_st=(0:size(results)-1)*200+1;
    ind_en=(1:size(results))*200;
    
    ind1=ind_st(logical(results));
    ind2=ind_en(logical(results));
    
    all_ind=cell2mat(arrayfun(@colon,ind1,ind2,'uni',0));
    filt_signal=y1(length(all_ind));
    
    length_all_sig=[length_all_sig length(filt_signal)];
end

max_length=max(length_all_sig);

for i = 1:18
    filename=strcat(filepart1,num2str(i),filepart2);
    y1=audioread(filename);
    
    results = VAD(filename,0.1,0.025,0.0125,20,1);
    
    ind_st=(0:size(results)-1)*200+1;
    ind_en=(1:size(results))*200;
    
    ind1=ind_st(logical(results));
    ind2=ind_en(logical(results));
    
    all_ind=cell2mat(arrayfun(@colon,ind1,ind2,'uni',0));
    filt_signal=y1(length(all_ind));
    
    if length(filt_signal)==max_length
        [cepstra5,aspectrum,pspectrum] = melfcc(y1,Fs,'wintime',0.025,'hoptime',0.010);
    else
        filt_signal=[filt_signal' zeros(1,max_length-length(filt_signal))];
        [cepstra5,aspectrum,pspectrum] = melfcc(filt_signal,Fs,'wintime',0.025,'hoptime',0.010);           
    end   
    
    all_data_five=[all_data_five cepstra5];
end


% % Building model

X=[all_data_one'];

options = statset('MaxIter',500,'Display','final');
obj1 = gmdistribution.fit(X,8,'CovType',...
    'diagonal','Options',options);

X=[all_data_two'];

obj2 = gmdistribution.fit(X,8,'CovType',...
    'diagonal','Options',options);

X=[all_data_three'];

obj3 = gmdistribution.fit(X,8,'CovType',...
    'diagonal','Options',options);

X=[all_data_four'];

obj4 = gmdistribution.fit(X,8,'CovType',...
    'diagonal','Options',options);

X=[all_data_five'];

obj5 = gmdistribution.fit(X,8,'CovType',...
    'diagonal','Options',options);

% %  Test data

%test_data=cepstra1';

% test_data=cepstra1';
 test_data=cepstra2';

% % Word recognition

[~,nlogl1] = posterior(obj1,test_data);

[~,nlogl2] = posterior(obj2,test_data);

[~,nlogl3] = posterior(obj3,test_data);

[~,nlogl4] = posterior(obj4,test_data);

[~,nlogl5] = posterior(obj5,test_data);

log_like=[nlogl1 nlogl2 nlogl3 nlog14 nlog15];

[~,Spoken_word]=min(log_like)




