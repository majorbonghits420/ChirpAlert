function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 10-May-2016 14:40:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)
directory = uigetdir;
d = dir(directory); %get files
set(handles.Files,'String',{d(3:end).name}) %set string

textLabel = sprintf('Files in: %s', directory);
set(handles.Directory, 'String', textLabel);
set(handles.Instructions, 'String', 'Select File');

MyPath = pwd;
MyWorkDir = genpath(MyPath);
addpath(MyWorkDir, '-end');

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in Files.
function Files_Callback(hObject, eventdata, handles)
% hObject    handle to Files (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
index_selected = get(hObject,'Value');
list = get(hObject,'String');
item_selected = list{index_selected}; % Convert from cell array
                                      % to string
                                      
% textLabel = sprintf('Variable C = %f', C);
set(handles.CurrentFile, 'String', item_selected);
% Hints: contents = cellstr(get(hObject,'String')) returns Files contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Files


% --- Executes during object creation, after setting all properties.
function Files_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Files (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Process.
function Process_Callback(hObject, eventdata, handles)
% hObject    handle to Process (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Run Optical Flow on Selected Video
index_selected = get(handles.Files,'Value');
list = get(handles.Files,'String');
item_selected = list{index_selected};

set(handles.Instructions, 'String', 'Processing Video')
fprintf('Currently Processing Video...\n')

fprintf('Done Processing\n')

% Set image axes
axes(handles.VideoAxes);
imshow(vid(:,:,:,1));
set(handles.VideoAxesLabel,'String', 'Frame 1')

% Set flow axes
axes(handles.FlowAxes);
imshow(flow(:,:,1));
set(handles.FlowAxesLabel,'String', 'Optical Flow of Frame 1')

set(handles.Instructions, 'String', 'Matching Object in Frame 1')

fprintf('Object Selected, Press A Button to view Tracking and Flow\n')
set(handles.FlowAxesLabel,'String', 'Found Original Object')

figure('Name','Tracking','Color', [255 255 255])
fprintf('Video is over, GUI will close after button presss\n')
pause

close all
