% ChirpAlert.m
% Authors: Suzie, James, Thadd, Mary, Sooyan
% Date: 28 Jan 17
% Description: TODO


% ChirpAlert()
% Inputs:
% Outputs:
% Description
function [] = chirpAlert()
% Clear variables
  clear all
  clearvars -global
% Setup Global
  setupGlobalVars();
% Setup Audio
  setupAudio();
% Setup ML stuff

% Buffer update

% Detection

% Interpret results

% Produce outputs to user
end

% setupGlobalvars()
% Inputs: None
% Outputs: None
% Description: This function setups up the various global variables that will
% be used throught the program
function [] = setupGlobalVars()
  setGlobalParams();
  % Create a buffer for the audio
  global audioBuffer;
  global BUFFER_SIZE;
  audioBuffer = zeros(1,BUFFER_SIZE);
  % Counter for number of chirps
  global numChirps;
  numChirps = 0;
  % Counter for number of abnormalities
  global numAbnormal;
  numAbnormal = 0;
end

% setupGlobalparams()
% Inputs: None
% Outputs: None
% Description: Used to set parameters for the rest of the program
function [] = setGlobalParams()
  % Amount of time present in the bufer
  global BUFFER_TIME;
  BUFFER_TIME = 1; % Guess value, need to change
  % The audio sampling rate
  global SAMPLE_RATE;
  SAMPLE_RATE = 44100; % 44.1 kHz since that is standard sampling rate
  % How many data points are in our buffer (floored for integer number)
  global BUFFER_SIZE;
  BUFFER_SIZE = floor(SAMPLE_RATE / BUFFER_TIME);
  % Filename to get audio from
  global FILE_NAME;
  FILE_NAME = 'anthem.wav';
  % Lowest frequency of bandpass filter
  global FILTER_LOW;
  FILTER_LOW = 1000; % Lowest possible freq by bird
  % Highest frequency of bandpass filter
  global FILTER_HIGH;
  FILTER_HIGH = 8000; % Highest possible freq by bird
end

% setupAudio()
% Inputs:
% Outputs:
% Description: Initializes how we keep track of our place in the audio file
function [] = setupAudio()
  % The number of samples we have taken, used to iterate through the .WAV file
  global numSampled
  numSampled = 1;
end

% setupML()
% Inputs:
% Outputs:
% Description
function [] = setupML()

end

% updateBuffer()
% Inputs: None
% Outputs: None
% Description: Shifts the contents of the buffer and then adds in the next
% sample to the front of the buffer
function [] = updateBuffer()
  % global variables to use
  global FILE_NAME;
  global numSampled;
  global BUFFER_SIZE;
  global audioBuffer;
  % Get the next sample
  [sample, fs] = audioread(FILE_NAME, [numSampled, numSampled]);
  % shift all previous samples
  audioBuffer(2 : BUFFER_SIZE);
  audioBuffer(1 : BUFFER_SIZE - 1);
  % add in new value
  audiobuffer(1:2,1) = sample;
  % increment our place in the audio file
  numSampled = numSampled + 1;
end

% detection()
% Inputs:
% Outputs:
% Description:
function [] = detection()

end

% interpretresults()
% Inputs:
% Outputs:
% Description:
function [] = interpretResults()

end

% outputUserresults()
% Inputs:
% Outputs:
% Description:
function [] = outputUserResults()

end