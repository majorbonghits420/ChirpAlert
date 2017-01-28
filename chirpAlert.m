% ChirpAlert.m
% Authors: Suzie, James, Thadd, Mary, Sooyan
% Date: 28 Jan 17
% Description: TODO


% ChirpAlert()
% Inputs:
% Outputs:
% Description
function [] = chirpAlert()
% Setup Global

% Setup Audio

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
  setGlobalparams();
  % Create a buffer for the audio
  global audioBuffer = zeros(1,BUFFER_SIZE);
  % Counter for number of chirps
  global numChirps = 0;
  % Counter for number of abnormalities
  global numAbnormal = 0;
end

% setupGlobalparams()
% Inputs: None
% Outputs: None
% Description: Used to set parameters for the rest of the program
function [] = setGlobalParams()
  % Amount of time present in the bufer
  global BUFFER_TIME = 1; % Guess value, need to change
  % The audio sampling rate
  global SAMPLE_RATE = 44100; % 44.1 kHz since that is standard sampling rate
  % How many data points are in our buffer (floored for integer number)
  global BUFFER_SIZE = floor(SAMPLE_RATE / BUFFER_TIME);
  % Filename to get audio from
  global FILE_NAME = "";
  % Lowest frequency of bandpass filter
  global FILTER_LOW = 1000; % Lowest possible freq by bird
  % Highest frequency of bandpass filter
  global FILTER_HIGH = 8000; % Highest possible freq by bird
end

% setupAudio()
% Inputs:
% Outputs:
% Description
function [] = setupAudio()

end

% setupML()
% Inputs:
% Outputs:
% Description
function [] = setupML()

end

% updateBuffer()
% Inputs:
% Outputs:
% Description:
function [] = updateBuffer()

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