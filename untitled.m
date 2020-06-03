function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 31-May-2020 20:19:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in selectbutton.
function selectbutton_Callback(~, ~, handles)
% hObject    handle to selectbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[Filename, Pathname] = uigetfile('*.png','File Selector');
name = strcat(Pathname,Filename);
a = imread(name);
set(handles.edit1,'string',name);
axes(handles.axes1);
imshow(a);

% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in searchbutton.
function searchbutton_Callback(hObject, eventdata, handles)
% hObject    handle to searchbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
DacTrung = get(handles.popupmenu1,'value');
EUCLID = get(handles.popupmenu2,'value');
path_images = get(handles.edit1, 'String');
if(DacTrung == 1)
   if(EUCLID == 1)
       [list_image_match_colorhist, filenames] = get_list_image_match_colorhist(path_images, EUCLID);
       f = fullfile(filenames(list_image_match_colorhist(2,1)).folder, filenames(list_image_match_colorhist(2,1)).name);
       imageresult = imread(f);
       axes(handles.axes2);
       imshow(imageresult);
       
       f = fullfile(filenames(list_image_match_colorhist(2,2)).folder, filenames(list_image_match_colorhist(2,2)).name);
       imageresult = imread(f);
       axes(handles.axes3);
       imshow(imageresult);
       
       f = fullfile(filenames(list_image_match_colorhist(2,3)).folder, filenames(list_image_match_colorhist(2,3)).name);
       imageresult = imread(f);
       axes(handles.axes4);
       imshow(imageresult);
   else
       [list_image_match_colorhist, filenames] = get_list_image_match_colorhist(path_images, 0);
       f = fullfile(filenames(list_image_match_colorhist(2,1)).folder, filenames(list_image_match_colorhist(2,1)).name);
       imageresult = imread(f);
       axes(handles.axes2);
       imshow(imageresult);
       
       f = fullfile(filenames(list_image_match_colorhist(2,2)).folder, filenames(list_image_match_colorhist(2,2)).name);
       imageresult = imread(f);
       axes(handles.axes3);
       imshow(imageresult);
       
       f = fullfile(filenames(list_image_match_colorhist(2,3)).folder, filenames(list_image_match_colorhist(2,3)).name);
       imageresult = imread(f);
       axes(handles.axes4);
       imshow(imageresult);
   end

elseif (DacTrung == 3)
    if(EUCLID == 1)
       [list_image_match_colormoments, filenames] = get_list_image_match_colormoments(path_images, EUCLID);
       f = fullfile(filenames(list_image_match_colormoments(2,1)).folder, filenames(list_image_match_colormoments(2,1)).name);
       imageresult = imread(f);
       axes(handles.axes2);
       imshow(imageresult);
       
       f = fullfile(filenames(list_image_match_colormoments(2,2)).folder, filenames(list_image_match_colormoments(2,2)).name);
       imageresult = imread(f);
       axes(handles.axes3);
       imshow(imageresult);
       
       f = fullfile(filenames(list_image_match_colormoments(2,3)).folder, filenames(list_image_match_colormoments(2,3)).name);
       imageresult = imread(f);
       axes(handles.axes4);
       imshow(imageresult);
   else
       [list_image_match_colormoments, filenames] = get_list_image_match_colormoments(path_images, 0);
       f = fullfile(filenames(list_image_match_colormoments(2,1)).folder, filenames(list_image_match_colormoments(2,1)).name);
       imageresult = imread(f);
       axes(handles.axes2);
       imshow(imageresult);
       
       f = fullfile(filenames(list_image_match_colormoments(2,2)).folder, filenames(list_image_match_colormoments(2,2)).name);
       imageresult = imread(f);
       axes(handles.axes3);
       imshow(imageresult);
       
       f = fullfile(filenames(list_image_match_colormoments(2,3)).folder, filenames(list_image_match_colormoments(2,3)).name);
       imageresult = imread(f);
       axes(handles.axes4);
       imshow(imageresult);
   end
elseif (DacTrung == 4)
    if(EUCLID == 1)
       [list_image_match_LBP, filenames] = get_list_image_match_LBP(path_images, EUCLID);
       f = fullfile(filenames(list_image_match_LBP(2,1)).folder, filenames(list_image_match_LBP(2,1)).name);
       imageresult = imread(f);
       axes(handles.axes2);
       imshow(imageresult);
       
       f = fullfile(filenames(list_image_match_LBP(2,2)).folder, filenames(list_image_match_LBP(2,2)).name);
       imageresult = imread(f);
       axes(handles.axes3);
       imshow(imageresult);
       
       f = fullfile(filenames(list_image_match_LBP(2,3)).folder, filenames(list_image_match_LBP(2,3)).name);
       imageresult = imread(f);
       axes(handles.axes4);
       imshow(imageresult);
   else
       [list_image_match_LBP, filenames] = get_list_image_match_LBP(path_images, 0);
       f = fullfile(filenames(list_image_match_LBP(2,1)).folder, filenames(list_image_match_LBP(2,1)).name);
       imageresult = imread(f);
       axes(handles.axes2);
       imshow(imageresult);
       
       f = fullfile(filenames(list_image_match_LBP(2,2)).folder, filenames(list_image_match_LBP(2,2)).name);
       imageresult = imread(f);
       axes(handles.axes3);
       imshow(imageresult);
       
       f = fullfile(filenames(list_image_match_LBP(2,3)).folder, filenames(list_image_match_LBP(2,3)).name);
       imageresult = imread(f);
       axes(handles.axes4);
       imshow(imageresult);
   end
end

% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in clearbutton.
function clearbutton_Callback(hObject, eventdata, handles)
% hObject    handle to clearbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in exitbutton.
function exitbutton_Callback(hObject, eventdata, handles)
% hObject    handle to exitbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
exit;

% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
% axis off


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2
% axis off


% --- Executes during object creation, after setting all properties.
function axes3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes3
%axis off


% --- Executes during object creation, after setting all properties.
function axes4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes4
% axis off


% --- Executes on button press in nextbutton.
function nextbutton_Callback(hObject, eventdata, handles)
% hObject    handle to nextbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in backbutton.
function backbutton_Callback(hObject, eventdata, handles)
% hObject    handle to backbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_rank2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_rank2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_rank2 as text
%        str2double(get(hObject,'String')) returns contents of edit_rank2 as a double


% --- Executes during object creation, after setting all properties.
function edit_rank2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_rank2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_rank3_Callback(hObject, eventdata, handles)
% hObject    handle to edit_rank3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_rank3 as text
%        str2double(get(hObject,'String')) returns contents of edit_rank3 as a double


% --- Executes during object creation, after setting all properties.
function edit_rank3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_rank3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
