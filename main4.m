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

% %  For "cough"s

all_data_Cough=[];
filepart1='cough-';

length_all_sig=[];
for i=1:35
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

for i = 1:35
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
        [cepstraCough,aspectrum,pspectrum] = melfcc(y1,Fs,'wintime',0.025,'hoptime',0.010);
    else
        filt_signal=[filt_signal' zeros(1,max_length-length(filt_signal))];
        [cepstraCough,aspectrum,pspectrum] = melfcc(filt_signal,Fs,'wintime',0.025,'hoptime',0.010);           
    end   
    
    all_data_Cough=[all_data_Tweet cepstraCough];
end

% %  For "sneeze"s

all_data_Sneeze=[];
filepart1='sneeze-';

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

for i = 1:22
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
        [cepstraSneeze,aspectrum,pspectrum] = melfcc(y1,Fs,'wintime',0.025,'hoptime',0.010);
    else
        filt_signal=[filt_signal' zeros(1,max_length-length(filt_signal))];
        [cepstraSneeze,aspectrum,pspectrum] = melfcc(filt_signal,Fs,'wintime',0.025,'hoptime',0.010);           
    end   
    
    all_data_Sneeze=[all_data_Sneeze cepstraSneeze];
end

% %  For "squeak"s

all_data_Squeak=[];
filepart1='squeak-';

length_all_sig=[];
for i=1:43
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

for i = 1:43
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
        [cepstraSqueak,aspectrum,pspectrum] = melfcc(y1,Fs,'wintime',0.025,'hoptime',0.010);
    else
        filt_signal=[filt_signal' zeros(1,max_length-length(filt_signal))];
        [cepstraSqueak,aspectrum,pspectrum] = melfcc(filt_signal,Fs,'wintime',0.025,'hoptime',0.010);           
    end   
    
    all_data_Squeak=[all_data_Squeak cepstraSqueak];
end

% Dog Bark
filename='dog_bark_x.wav';
y3dog=audioread(filename);
y2dog=y3dog(:,1);
if length(y2dog) < 16000
    numZeros = 16000-length(y2dog);
    y1dog=[y2dog; zeros(numZeros,1)];
else
    y1dog = y2dog(1:16000);
end
length_all_sig_dog=[length(y1dog)];
max_length_dog=max(length_all_sig_dog);

if length(y1dog)==max_length_dog
        [cepstraDog,aspectrum,pspectrumDog] = melfcc(y1dog,Fs,'wintime',0.025,'hoptime',0.010);
    else
        y1dog=[y1dog' zeros(1,max_length-length(y1dog))];
        [cepstraDog,aspectrumDog,pspectrumDog] = melfcc(y1dog,Fs,'wintime',0.025,'hoptime',0.010);           
end  

% Cat meow
filename='cat_big_x.wav';
y3cat=audioread(filename);
y2cat=y3cat(:,1);
if length(y2cat) < 16000
    numZeros = 16000-length(y2cat);
    y1cat=[y2cat; zeros(numZeros,1)];
else
    y1cat = y2cat(1:16000);
end
length_all_sig_cat=[length(y1cat)];
max_length_cat=max(length_all_sig_cat);

if length(y1cat)==max_length_cat
        [cepstraCat,aspectrumCat,pspectrumCat] = melfcc(y1cat,Fs,'wintime',0.025,'hoptime',0.010);
    else
        y1dog=[y1dog' zeros(1,max_length-length(y1dog))];
        [cepstraCat,aspectrumCat,pspectrumCat] = melfcc(y1cat,Fs,'wintime',0.025,'hoptime',0.010);           
end
    
% Door shut
filename='close_door.wav';
y3door=audioread(filename);
y2door=y3door(:,1);
if length(y2door) < 16000
    numZeros = 16000-length(y2door);
    y1door=[y2door; zeros(numZeros,1)];
else
    y1door = y2door(1:16000);
end
length_all_sig_door=[length(y1door)];
max_length_door=max(length_all_sig_door);

if length(y1door)==max_length_door
        [cepstraDoor,aspectrumDoor,pspectrumDoor] = melfcc(y1door,Fs,'wintime',0.025,'hoptime',0.010);
    else
        y1door=[y1door' zeros(1,max_length-length(y1door))];
        [cepstraDoor,aspectrumDoor,pspectrumDoor] = melfcc(y1door,Fs,'wintime',0.025,'hoptime',0.010);           
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

X=[all_data_Cough'];

objCough = gmdistribution.fit(X,8,'CovType',...
    'diagonal','SharedCov',true,'Options',options);

X=[all_data_Sneeze'];

objSneeze = gmdistribution.fit(X,8,'CovType',...
    'diagonal','SharedCov',true,'Options',options);

X=[all_data_Squeak'];

objSqueak = gmdistribution.fit(X,8,'CovType',...
    'diagonal','SharedCov',true,'Options',options);




% %  Test data

 %test_data=cepstraTwit';
 %test_data=cepstraTweet';
 %test_data=cepstraClick';
 % test_data=cepstraChit';
% test_data=cepstraChirp';
 %test_data=cepstraCough';
 test_data=cepstraSneeze';
 %test_data=cepstraSqueak';
 %test_data=cepstraDog';
 %test_data=cepstraCat';
 %test_data=cepstraDoor';

% % Word recognition

[~,nloglTwit] = posterior(objTwit,test_data);

[~,nloglTweet] = posterior(objTweet,test_data);

[~,nloglClick] = posterior(objClick,test_data);

[~,nloglChit] = posterior(objChit,test_data);

[~,nloglChirp] = posterior(objChirp,test_data);

[~,nloglCough] = posterior(objCough,test_data);

[~,nloglSneeze] = posterior(objSneeze,test_data);

[~,nloglSqueak] = posterior(objSqueak,test_data);

log_like=[nloglTwit nloglTweet nloglClick nloglChit nloglChirp...
    nloglCough nloglSneeze nloglSqueak];
disp(log_like);

[~,Spoken_word]=min(log_like);

words = {' twit' ' tweet' ' click' ' chit' ' chirp' 'cough'...
    'sneeze' 'squeak'};

soundChoice = words(Spoken_word);

if min(log_like)>6500
    disp('Unknown noise: let us know'); %change!
if (Spoken_word < 6)
    disp(strcat('Sound made: ',soundChoice,' - happy sound!'));
else
    disp(strcat('Sound made: ',{' '},soundChoice,' - possibly unhealthy bird, consult a veterinarian'));
end




