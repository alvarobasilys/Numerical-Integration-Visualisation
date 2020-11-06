function varargout = GUI2_Tubes(varargin)
% GUI2_TUBES MATLAB code for GUI2_Tubes.fig
%      GUI2_TUBES, by itself, creates a new GUI2_TUBES or raises the existing
%      singleton*.
%
%      H = GUI2_TUBES returns the handle to a new GUI2_TUBES or the handle to
%      the existing singleton*.
%
%      GUI2_TUBES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI2_TUBES.M with the given input arguments.
%
%      GUI2_TUBES('Property','Value',...) creates a new GUI2_TUBES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI2_Tubes_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI2_Tubes_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI2_Tubes

% Last Modified by GUIDE v2.5 24-May-2019 13:35:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI2_Tubes_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI2_Tubes_OutputFcn, ...
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


% --- Executes just before GUI2_Tubes is made visible.
function GUI2_Tubes_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no tabel args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI2_Tubes (see VARARGIN)

% Choose default command line tabel for GUI2_Tubes
handles.tabel = hObject;
set(handles.uitable3, 'Data',[]);
ncols = 5;
set(handles.uitable3, 'Data', cell(0, ncols));
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI2_Tubes wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI2_Tubes_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning tabel args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line tabel from handles structure
varargout{1} = handles.tabel;


% --- Executes on selection change in function_drop.
function function_drop_Callback(hObject, eventdata, handles)
% hObject    handle to function_drop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns function_drop contents as cell array
%        contents{get(hObject,'Value')} returns selected item from function_drop


% --- Executes during object creation, after setting all properties.
function function_drop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to function_drop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in process.
function process_Callback(hObject, eventdata, handles)
% hObject    handle to process (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
syms x
cla(handles.axes1)

delta = get(handles.delta,'Value')
f = str2sym(get(handles.f,'String'));


method_list = get(handles.uibuttongroup2,'SelectedObject');
method = get(method_list,'String');
a = get(handles.a,'String');
a = str2double(a);

b = get(handles.b,'String');
b = str2double(b);

nbox = str2num(get(handles.n,'String'))
z = get(handles.delta,'Value')
if z == 1
    n = double(nbox)
else
    n = (b-a)/double(nbox)
end

if strcmp(method,'Trapezoid')
    trapzplot(f,n,a,b);
    area = trapz(f,n,a,b)
    axes(handles.axes1);
    grid on
elseif strcmp(method,'Simpson')
    if mod(n,2)~=0
        n = 1+n
    end
    simpsonplot(f,n,a,b);
    area = Simpson(f,n,a,b);
    axes(handles.axes1);
    grid on
elseif strcmp(method,'MidPoint')
    area = midpoint(f,n,a,b);
    midplot(f,n,a,b);
    axes(handles.axes1);
    grid on 
end
error = (int(f,a,b)-area)*100/int(f,a,b);

if delta == 1
    h = (b-a)/n;
else
    h = n
end

data = get(handles.uitable3,'data');
f_str = get(handles.f,'String');

data(end+1,:) = {char(f_str),double(h),double(area),double(error),char(method)};
set(handles.uitable3,'data',data);
    
% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.f,'String','');
set(handles.b,'String','');
set(handles.a,'String','');
set(handles.n,'String','');
set(handles.uitable3, 'Data',[]);
ncols = 5;
set(handles.uitable3, 'Data', cell(0, ncols));




function b_Callback(hObject, eventdata, handles)
% hObject    handle to b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of b as text
%        str2double(get(hObject,'String')) returns contents of b as a double


% --- Executes during object creation, after setting all properties.
function b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a_Callback(hObject, eventdata, handles)
% hObject    handle to a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a as text
%        str2double(get(hObject,'String')) returns contents of a as a double


% --- Executes during object creation, after setting all properties.
function a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function n_Callback(hObject, eventdata, handles)
% hObject    handle to n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n as text
%        str2double(get(hObject,'String')) returns contents of n as a double


% --- Executes during object creation, after setting all properties.
function n_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function f_Callback(hObject, eventdata, handles)
% hObject    handle to f (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of f as text
%        str2double(get(hObject,'String')) returns contents of f as a double


% --- Executes during object creation, after setting all properties.
function f_CreateFcn(hObject, eventdata, handles)
% hObject    handle to f (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in delta.
function delta_Callback(hObject, eventdata, handles)
% hObject    handle to delta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns delta contents as cell array
%        contents{get(hObject,'Value')} returns selected item from delta


% --- Executes during object creation, after setting all properties.
function delta_CreateFcn(hObject, eventdata, handles)
% hObject    handle to delta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when selected object is changed in uibuttongroup2.
function uibuttongroup2_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup2 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
method_list = get(handles.uibuttongroup2,'SelectedObject');
method = get(method_list,'String');
if strcmp(method,'Simpson')
    set(handles.delta,'Value',1,'Enable','off')
else
    set(handles.delta,'Enable','On')
end
