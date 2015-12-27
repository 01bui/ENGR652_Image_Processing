function varargout = Project2(varargin)
% PROJECT2 MATLAB code for Project2.fig
%      PROJECT2, by itself, creates a new PROJECT2 or raises the existing
%      singleton*.
%
%      H = PROJECT2 returns the handle to a new PROJECT2 or the handle to
%      the existing singleton*.
%
%      PROJECT2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT2.M with the given input arguments.
%
%      PROJECT2('Property','Value',...) creates a new PROJECT2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Project2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Project2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Project2

% Last Modified by GUIDE v2.5 11-Nov-2014 17:42:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Project2_OpeningFcn, ...
                   'gui_OutputFcn',  @Project2_OutputFcn, ...
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


% --- Executes just before Project2 is made visible.
function Project2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Project2 (see VARARGIN)

% Choose default command line output for Project2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Project2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Project2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
%varargout{1} = handles.output;
 clear all;
 global check
    check = 0;
% --- Executes on button press in Rectangular1.
function Rectangular1_Callback(hObject, eventdata, handles)
% hObject    handle to Rectangular1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X1
global Y1
global Sig1
    x = -20:0.1:20;
    y = -20:0.1:20;
    [X,Y] = meshgrid(x,y); 
    XA = rectpuls(X,2*X1);
    YA = rectpuls(Y,2*Y1);
    Sig1 = XA.*YA; %% rectangular A
    axes(handles.Signal1);
    imagesc(x,y,Sig1);axis image;colormap(gray);

% --- Executes on button press in Circle1.
function Circle1_Callback(hObject, eventdata, handles)
% hObject    handle to Circle1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global R1
global Sig1
    x = -20:0.1:20;
    y = -20:0.1:20;
    [X,Y] = meshgrid(x,y);
    R =sqrt(X.^2+Y.^2);
    Sig1 = rectpuls(R,2*R1);
    axes(handles.Signal1);
    imagesc(x,y,Sig1);axis image;colormap(gray);

% --- Executes on button press in Rectangular2.
function Rectangular2_Callback(hObject, eventdata, handles)
% hObject    handle to Rectangular2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X2
global Y2
global Sig2
    x = -20:0.1:20;
    y = -20:0.1:20;
    [X,Y] = meshgrid(x,y);
 
    XA = rectpuls(X,2*X2);
    YA = rectpuls(Y,2*Y2);
    Sig2 = XA.*YA; %% rectangular A
    axes(handles.Signal2);
    imagesc(x,y,Sig2);axis image;colormap(gray);

% --- Executes on button press in Circle2.
function Circle2_Callback(hObject, eventdata, handles)
% hObject    handle to Circle2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global R2
global Sig2
    x = -20:0.1:20;
    y = -20:0.1:20;
    [X,Y] = meshgrid(x,y);
    R =sqrt(X.^2+Y.^2);
    Sig2 = rectpuls(R,2*R2);
    axes(handles.Signal2);
    imagesc(x,y,Sig2);axis image;colormap(gray);


function Width_X1_Callback(hObject, eventdata, handles)
% hObject    handle to Width_X1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Width_X1 as text
%        str2double(get(hObject,'String')) returns contents of Width_X1 as a double
global X1
    a = get(hObject,'String');
    a = str2double(a);
    X1 = a;

% --- Executes during object creation, after setting all properties.
function Width_X1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Width_X1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Width_Y1_Callback(hObject, eventdata, handles)
% hObject    handle to Width_Y1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Width_Y1 as text
%        str2double(get(hObject,'String')) returns contents of Width_Y1 as a double
global Y1
    a = get(hObject,'String');
    a = str2double(a);
    Y1 = a;

% --- Executes during object creation, after setting all properties.
function Width_Y1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Width_Y1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Width_X2_Callback(hObject, eventdata, handles)
% hObject    handle to Width_X2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Width_X2 as text
%        str2double(get(hObject,'String')) returns contents of Width_X2 as a double
global X2
    a = get(hObject,'String');
    a = str2double(a);
    X2 = a;

% --- Executes during object creation, after setting all properties.
function Width_X2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Width_X2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Width_Y2_Callback(hObject, eventdata, handles)
% hObject    handle to Width_Y2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Width_Y2 as text
%        str2double(get(hObject,'String')) returns contents of Width_Y2 as a double
global Y2
    a = get(hObject,'String');
    a = str2double(a);
    Y2 = a;

% --- Executes during object creation, after setting all properties.
function Width_Y2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Width_Y2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Radius1_Callback(hObject, eventdata, handles)
% hObject    handle to Radius1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Radius1 as text
%        str2double(get(hObject,'String')) returns contents of Radius1 as a double
global R1
    a = get(hObject,'String');
    a = str2double(a);
    R1 = a;

% --- Executes during object creation, after setting all properties.
function Radius1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Radius1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Radius2_Callback(hObject, eventdata, handles)
% hObject    handle to Radius2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Radius2 as text
%        str2double(get(hObject,'String')) returns contents of Radius2 as a double
global R2
    a = get(hObject,'String');
    a = str2double(a);
    R2 = a;

% --- Executes during object creation, after setting all properties.
function Radius2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Radius2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Ellipse1.
function Ellipse1_Callback(hObject, eventdata, handles)
% hObject    handle to Ellipse1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Ex1
global Ey1
global Sig1
    x = -20:0.1:20;
    y = -20:0.1:20;
    [X,Y] = meshgrid(x,y);
    e1=((X)/Ex1).^2+((Y)/Ey1).^2<=1;
    Sig1 = e1+0;
    axes(handles.Signal1);
    imagesc(x,y,Sig1);axis image;colormap(gray);

% --- Executes on button press in Ellipse2.
function Ellipse2_Callback(hObject, eventdata, handles)
% hObject    handle to Ellipse2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Ex2
global Ey2
global Sig2
    x = -20:0.1:20;
    y = -20:0.1:20;
    [X,Y] = meshgrid(x,y);
    e2=((X)/Ex2).^2+((Y)/Ey2).^2<=1;
    Sig2 = e2+0;
    axes(handles.Signal2);
    imagesc(x,y,Sig2);axis image;colormap(gray);


function Ellip1_x_Callback(hObject, eventdata, handles)
% hObject    handle to Ellip1_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ellip1_x as text
%        str2double(get(hObject,'String')) returns contents of Ellip1_x as a double
global Ex1
    a = get(hObject,'String');
    a = str2double(a);
    Ex1 = a;

% --- Executes during object creation, after setting all properties.
function Ellip1_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ellip1_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ellip1_y_Callback(hObject, eventdata, handles)
% hObject    handle to Ellip1_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ellip1_y as text
%        str2double(get(hObject,'String')) returns contents of Ellip1_y as a double
global Ey1
    a = get(hObject,'String');
    a = str2double(a);
    Ey1 = a;

% --- Executes during object creation, after setting all properties.
function Ellip1_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ellip1_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ellip2_x_Callback(hObject, eventdata, handles)
% hObject    handle to Ellip2_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ellip2_x as text
%        str2double(get(hObject,'String')) returns contents of Ellip2_x as a double
global Ex2
    a = get(hObject,'String');
    a = str2double(a);
    Ex2 = a;

% --- Executes during object creation, after setting all properties.
function Ellip2_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ellip2_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ellip2_y_Callback(hObject, eventdata, handles)
% hObject    handle to Ellip2_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ellip2_y as text
%        str2double(get(hObject,'String')) returns contents of Ellip2_y as a double
global Ey2
    a = get(hObject,'String');
    a = str2double(a);
    Ey2 = a;

% --- Executes during object creation, after setting all properties.
function Ellip2_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ellip2_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Convolution.
function Convolution_Callback(hObject, eventdata, handles)
% hObject    handle to Convolution (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Sig1
global Sig2
    x = -20:0.1:20;
    y = -20:0.1:20;
    Con = conv2(Sig1,Sig2,'same');
    axes(handles.Spectrum);
    imagesc(x,y,Con);axis image;colormap(gray);
 


% --- Executes on button press in Sinusoid.
function Sinusoid_Callback(hObject, eventdata, handles)
% hObject    handle to Sinusoid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global U0
global V0
global FFT
global check
    check = 0;
    dx = 0.1;dy = 0.1;
    x = -5:dx:5;y = -5:dy:5;
    [X,Y]=meshgrid(x,y);
    in = 4*cos(2*pi*(U0*X+V0*Y));
    axes(handles.ConV);
    imagesc(x,y,in);colormap(gray(256));
    FFT = in;
    
function u0_Callback(hObject, eventdata, handles)
% hObject    handle to u0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of u0 as text
%        str2double(get(hObject,'String')) returns contents of u0 as a double
global U0
    a = get(hObject,'String');
    a = str2double(a);
    U0 = a;

% --- Executes during object creation, after setting all properties.
function u0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to u0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v0_Callback(hObject, eventdata, handles)
% hObject    handle to v0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of v0 as text
%        str2double(get(hObject,'String')) returns contents of v0 as a double
global V0
    a = get(hObject,'String');
    a = str2double(a);
    V0 = a;

% --- Executes during object creation, after setting all properties.
function v0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Rectangular.
function Rectangular_Callback(hObject, eventdata, handles)
% hObject    handle to Rectangular (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Rx
global Ry
global F
global FFT
global check
    check = 0;
    x = -20:0.1:20;
    y = -20:0.1:20;
    [X,Y] = meshgrid(x,y); 
    XA = rectpuls(X,2*Rx);
    YA = rectpuls(Y,2*Ry);
    R = XA.*YA; %% rectangular A
    axes(handles.ConV);
    imagesc(x,y,R);axis image;colormap(gray);
    F = R;
    FFT = R;
% --- Executes on button press in Circle.
function Circle_Callback(hObject, eventdata, handles)
% hObject    handle to Circle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Ra
global F
global FFT
global check
    check = 0;
    x = -20:0.1:20;
    y = -20:0.1:20;
    [X,Y] = meshgrid(x,y);
    R =sqrt(X.^2+Y.^2);
    in = rectpuls(R,2*Ra);
    axes(handles.ConV);
    imagesc(x,y,in);axis image;colormap(gray);
    F = in;
    FFT = in;

function RecX_Callback(hObject, eventdata, handles)
% hObject    handle to RecX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RecX as text
%        str2double(get(hObject,'String')) returns contents of RecX as a double
global Rx
    a = get(hObject,'String');
    a = str2double(a);
    Rx = a;

% --- Executes during object creation, after setting all properties.
function RecX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RecX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RecY_Callback(hObject, eventdata, handles)
% hObject    handle to RecY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RecY as text
%        str2double(get(hObject,'String')) returns contents of RecY as a double
global Ry
    a = get(hObject,'String');
    a = str2double(a);
    Ry = a;

% --- Executes during object creation, after setting all properties.
function RecY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RecY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Radius_Callback(hObject, eventdata, handles)
% hObject    handle to Radius (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Radius as text
%        str2double(get(hObject,'String')) returns contents of Radius as a double
global Ra
    a = get(hObject,'String');
    a = str2double(a);
    Ra = a;

% --- Executes during object creation, after setting all properties.
function Radius_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Radius (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ellipse_Callback(hObject, eventdata, handles)
% hObject    handle to Ellipse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ellipse as text
%        str2double(get(hObject,'String')) returns contents of Ellipse as a double
global Ex
global Ey
global F
global FFT
global check
    check = 0;
    x = -20:0.1:20;
    y = -20:0.1:20;
    N = length(x);
    [X,Y] = meshgrid(x,y);
    e1=((X)/(Ex)).^2+((Y)/Ey).^2<=1;
    in = e1+0;
    in(floor(N/2)+1,floor(N/2)+1-Ex/0.1) = 0;
    in(floor(N/2)+1-Ey/0.1,floor(N/2)+1) = 0;
    in(floor(N/2)+1,floor(N/2)+1+Ex/0.1) = 0;
    in(floor(N/2)+1+Ey/0.1,floor(N/2)+1) = 0;
    axes(handles.ConV);
    imagesc(x,y,in);axis image;colormap(gray);
    F = in;
    FFT = in;

function EllipseX_Callback(hObject, eventdata, handles)
% hObject    handle to EllipseX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EllipseX as text
%        str2double(get(hObject,'String')) returns contents of EllipseX as a double
global Ex
    a = get(hObject,'String');
    a = str2double(a);
    Ex = a;

% --- Executes during object creation, after setting all properties.
function EllipseX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EllipseX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EllipseY_Callback(hObject, eventdata, handles)
% hObject    handle to EllipseY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EllipseY as text
%        str2double(get(hObject,'String')) returns contents of EllipseY as a double
global Ey
    a = get(hObject,'String');
    a = str2double(a);
    Ey = a;

% --- Executes during object creation, after setting all properties.
function EllipseY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EllipseY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in MultipleXY.
function MultipleXY_Callback(hObject, eventdata, handles)
% hObject    handle to MultipleXY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global px
global py
global comb
global F
global FFT
global check
    check = 0;
    x = -20:0.1:20; y = -20:0.1:20; 
    stepx = px/0.1;
    stepy = py/0.1;
    N = length(x);
    initalx = mod(floor(N/2)+1,stepx);
    initaly = mod(floor(N/2)+1,stepy);
    comb = zeros(N);
    comb(initaly:stepy:N,initalx:stepx:N) = 1;
    a = conv2(F,comb,'same');
    FFT = a;
    axes(handles.Multiple);
    imagesc(x,y,a); colormap(gray(256));

function periodx_Callback(hObject, eventdata, handles)
% hObject    handle to periodx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of periodx as text
%        str2double(get(hObject,'String')) returns contents of periodx as a double
global px
    a = get(hObject,'String');
    a = str2double(a);
    px = a;

% --- Executes during object creation, after setting all properties.
function periodx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to periodx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function periody_Callback(hObject, eventdata, handles)
% hObject    handle to periody (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of periody as text
%        str2double(get(hObject,'String')) returns contents of periody as a double
global py
    a = get(hObject,'String');
    a = str2double(a);
    py = a;

% --- Executes during object creation, after setting all properties.
function periody_CreateFcn(hObject, eventdata, handles)
% hObject    handle to periody (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in FFT.
function FFT_Callback(hObject, eventdata, handles)
% hObject    handle to FFT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global FFT
global check
    Fourier = fftshift(fft2(FFT));
    [sy,sx]=size(FFT);
    w1=linspace(-pi,pi,sx);
    w2=linspace(-pi,pi,sy);
    axes(handles.ConV);
    imagesc(w1,w2,imlin(log(abs(Fourier)+50)));axis image;colormap(gray(256));
    xlabel('\omega_1 (radians/sample)');
    ylabel('\omega_2 (radians/sample)');    
    if check == 1;
        axis([-1.5 1.5 -1.5 1.5]);
    else  axis([-pi pi -pi pi]);
    end
    axes(handles.Multiple);
    image(w1,w2,imlin(angle(Fourier)));axis image; colormap(gray(256));
    xlabel('\omega_1 (radians/sample)');


% --- Executes on button press in HorizontalTripe.
function HorizontalTripe_Callback(hObject, eventdata, handles)
% hObject    handle to HorizontalTripe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global H
global F
global FFT
global check
    x = -20:0.1:20;
    y = -20:0.1:20;
    [~,Y] = meshgrid(x,y);
    Sc = rectpuls(Y,2*H);
    axes(handles.ConV);
    imagesc(x,y,Sc);colormap(gray(256));
    xlabel('x');ylabel('y');
    check = 1;
    F = Sc;
    FFT = Sc;
% --- Executes on button press in VerticalTripe.
function VerticalTripe_Callback(hObject, eventdata, handles)
% hObject    handle to VerticalTripe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global V
global F
global FFT
global check
    x = -20:0.1:20;
    y = -20:0.1:20;
    [X,~] = meshgrid(x,y);
    Sc = rectpuls(X,2*V);
    axes(handles.ConV);
    imagesc(x,y,Sc);colormap(gray(256));
    xlabel('x');ylabel('y');
    check = 0;
    F = Sc;
    FFT = Sc;

function HWidth_Callback(hObject, eventdata, handles)
% hObject    handle to HWidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HWidth as text
%        str2double(get(hObject,'String')) returns contents of HWidth as a double
global H
    a = get(hObject,'String');
    a = str2double(a);
    H = a;

% --- Executes during object creation, after setting all properties.
function HWidth_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HWidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function VWidth_Callback(hObject, eventdata, handles)
% hObject    handle to VWidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of VWidth as text
%        str2double(get(hObject,'String')) returns contents of VWidth as a double
global V
    a = get(hObject,'String');
    a = str2double(a);
    V = a;

% --- Executes during object creation, after setting all properties.
function VWidth_CreateFcn(hObject, eventdata, handles)
% hObject    handle to VWidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in TriMultiple.
function TriMultiple_Callback(hObject, eventdata, handles)
% hObject    handle to TriMultiple (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Tripe_p
global F
global FFT
global check
    x = -20:0.1:20; 
    y = -20:0.1:20; 
    step = Tripe_p/0.1;
    N = length(x);
    inital = mod(floor(N/2)+1,step);
    comb = zeros(N);
    if F(floor(N/2)+1,1)==0
        comb(floor(N/2)+1,inital:step:N) = 1;
        check = 0;
    elseif F(1,floor(N/2)+1)==0
        comb(inital:step:N,floor(N/2)+1) = 1;
        check = 1;
    end
    a = conv2(F,comb,'same');
    FFT = a;
    axes(handles.Multiple);
    imagesc(x,y,a); colormap(gray);  

function TripePeriod_Callback(hObject, eventdata, handles)
% hObject    handle to TripePeriod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TripePeriod as text
%        str2double(get(hObject,'String')) returns contents of TripePeriod as a double
global Tripe_p
    a = get(hObject,'String');
    a = str2double(a);
    Tripe_p = a;

% --- Executes during object creation, after setting all properties.
function TripePeriod_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TripePeriod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in LoadImage.
function LoadImage_Callback(hObject, eventdata, handles)
% hObject    handle to LoadImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global FFT        
        [filename, pathname] = uigetfile({'*.tif';'*.tiff';'*.jpg';'*.jpeg';'*.png';'*.bmp';'*.gif'},'File Selector');
        image = imread(filename);
        I = image;
        n_dims = ndims(image);
        if n_dims>2
            image = rgb2gray(image);
        end
        image = double(image);     
        image = imlin2(image,0,255);
        FFT = image;
        axes(handles.Spectrum);imshow(I);xlabel('Original Image')
        axes(handles.Phase);imagesc(image);
        colormap(gray(256));axis image;xlabel('Image in Processing');


% --- Executes on button press in Unsharp.
function Unsharp_Callback(hObject, eventdata, handles)
% hObject    handle to Unsharp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global un_alpha
global Image
    h = fspecial('unsharp',un_alpha);
    x = Image;
    [M,N]=size(x);
    [K,L]=size(h);
    H= fft2(h,M+K-1,N+L-1);
    X=fft2(x, M+K-1,N+L-1);
    Y=H.*X;
    y = real(ifft2(Y));
    axes(handles.Multiple);
    imagesc(y);xlabel('output of DFT filtering');
    axes(handles.ConV);
    imagesc(abs(fftshift(H)));xlabel('|fft(H)|after padding');

% --- Executes on button press in Average.
function Average_Callback(hObject, eventdata, handles)
% hObject    handle to Average (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a_size
global Image
    h = fspecial('average',[a_size a_size]);
    x = Image;
    [M,N]=size(x);
    [K,L]=size(h);
    H= fft2(h,M+K-1,N+L-1);
    X=fft2(x, M+K-1,N+L-1);
    Y=H.*X;
    y = real(ifft2(Y));
    axes(handles.Multiple);
    imagesc(y);xlabel('output of DFT filtering');
    axes(handles.ConV);
    imagesc(abs(fftshift(H)));xlabel('|fft(H)|after padding');
    

% --- Executes on button press in Disk.
function Disk_Callback(hObject, eventdata, handles)
% hObject    handle to Disk (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global d_size
global Image
    h = fspecial('disk',d_size);
    x = Image;
    [M,N]=size(x);
    [K,L]=size(h);
    H= fft2(h,M+K-1,N+L-1);
    X=fft2(x, M+K-1,N+L-1);
    Y=H.*X;
    y = real(ifft2(Y));
    axes(handles.Multiple);
    imagesc(y);xlabel('output of DFT filtering');
    axes(handles.ConV);
    imagesc(abs(fftshift(H)));xlabel('|fft(H)|after padding');
    
    
% --- Executes on button press in Laplacian.
function Laplacian_Callback(hObject, eventdata, handles)
% hObject    handle to Laplacian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global lap_alpha
global Image
    h = fspecial('laplacian',lap_alpha);
    x = Image;
    [M,N]=size(x);
    [K,L]=size(h);
    H= fft2(h,M+K-1,N+L-1);
    X=fft2(x, M+K-1,N+L-1);
    Y=H.*X;
    y = real(ifft2(Y));
    axes(handles.Multiple);
    imagesc(y);xlabel('output of DFT filtering');
    axes(handles.ConV);
    imagesc(abs(fftshift(H)));xlabel('|fft(H)|after padding');

% --- Executes on button press in Log.
function Log_Callback(hObject, eventdata, handles)
% hObject    handle to Log (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global log_theta
global log_size
global Image
    h = fspecial('log',[log_size log_size],log_theta);
    x = Image;
    [M,N]=size(x);
    [K,L]=size(h);
    H= fft2(h,M+K-1,N+L-1);
    X=fft2(x, M+K-1,N+L-1);
    Y=H.*X;
    y = real(ifft2(Y));
    axes(handles.Multiple);
    imagesc(y);xlabel('output of DFT filtering');
    axes(handles.ConV);
    imagesc(abs(fftshift(H)));xlabel('|fft(H)|after padding');

% --- Executes on button press in Motion.
function Motion_Callback(hObject, eventdata, handles)
% hObject    handle to Motion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global m_len
global m_theta
global Image
    h = fspecial('motion',m_len,m_theta);
    x = Image;
    [M,N]=size(x);
    [K,L]=size(h);
    H= fft2(h,M+K-1,N+L-1);
    X=fft2(x, M+K-1,N+L-1);
    Y=H.*X;
    y = real(ifft2(Y));
    axes(handles.Multiple);
    imagesc(y);xlabel('output of DFT filtering');
    axes(handles.ConV);
    imagesc(abs(fftshift(H)));xlabel('|fft(H)|after padding');

% --- Executes on button press in Prewitt.
function Prewitt_Callback(hObject, eventdata, handles)
% hObject    handle to Prewitt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Image
    h = fspecial('prewitt');
    x = Image;
    [M,N]=size(x);
    [K,L]=size(h);
    H= fft2(h,M+K-1,N+L-1);
    X=fft2(x, M+K-1,N+L-1);
    Y=H.*X;
    y = real(ifft2(Y));
    axes(handles.Multiple);
    imagesc(y);xlabel('output of DFT filtering');
    axes(handles.ConV);
    imagesc(abs(fftshift(H)));xlabel('|fft(H)|after padding');

% --- Executes on button press in Sobel.
function Sobel_Callback(hObject, eventdata, handles)
% hObject    handle to Sobel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Image
    h = fspecial('sobel');
    x = Image;
    [M,N]=size(x);
    [K,L]=size(h);
    H= fft2(h,M+K-1,N+L-1);
    X=fft2(x, M+K-1,N+L-1);
    Y=H.*X;
    y = real(ifft2(Y));
    axes(handles.Multiple);
    imagesc(y);xlabel('output of DFT filtering');
    axes(handles.ConV);
    imagesc(abs(fftshift(H)));xlabel('|fft(H)|after padding');


function AveragerSize_Callback(hObject, eventdata, handles)
% hObject    handle to AveragerSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AveragerSize as text
%        str2double(get(hObject,'String')) returns contents of AveragerSize as a double
global a_size
    a = get(hObject,'String');
    a = str2double(a);
    a_size = a;

% --- Executes during object creation, after setting all properties.
function AveragerSize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AveragerSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Disk_size_Callback(hObject, eventdata, handles)
% hObject    handle to Disk_size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Disk_size as text
%        str2double(get(hObject,'String')) returns contents of Disk_size as a double
global d_size
    a = get(hObject,'String');
    a = str2double(a);
    d_size = a;

% --- Executes during object creation, after setting all properties.
function Disk_size_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Disk_size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function GaussianSize_Callback(hObject, eventdata, handles)
% hObject    handle to GaussianSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of GaussianSize as text
%        str2double(get(hObject,'String')) returns contents of GaussianSize as a double
global g_size
    a = get(hObject,'String');
    a = str2double(a);
    g_size = a;

% --- Executes during object creation, after setting all properties.
function GaussianSize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to GaussianSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function log_size_Callback(hObject, eventdata, handles)
% hObject    handle to log_size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of log_size as text
%        str2double(get(hObject,'String')) returns contents of log_size as a double
global log_size
    a = get(hObject,'String');
    a = str2double(a);
    log_size = a;

% --- Executes during object creation, after setting all properties.
function log_size_CreateFcn(hObject, eventdata, handles)
% hObject    handle to log_size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function unsharp_alpha_Callback(hObject, eventdata, handles)
% hObject    handle to unsharp_alpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of unsharp_alpha as text
%        str2double(get(hObject,'String')) returns contents of unsharp_alpha as a double
global un_alpha
    a = get(hObject,'String');
    a = str2double(a);
    un_alpha = a;

% --- Executes during object creation, after setting all properties.
function unsharp_alpha_CreateFcn(hObject, eventdata, handles)
% hObject    handle to unsharp_alpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function Laplacian_alpha_Callback(hObject, eventdata, handles)
% hObject    handle to Laplacian_alpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Laplacian_alpha as text
%        str2double(get(hObject,'String')) returns contents of Laplacian_alpha as a double
global lap_alpha
    a = get(hObject,'String');
    a = str2double(a);
    lap_alpha = a;

% --- Executes during object creation, after setting all properties.
function Laplacian_alpha_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Laplacian_alpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function log_theta_Callback(hObject, eventdata, handles)
% hObject    handle to log_theta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of log_theta as text
%        str2double(get(hObject,'String')) returns contents of log_theta as a double
global log_theta
    a = get(hObject,'String');
    a = str2double(a);
    log_theta = a;

% --- Executes during object creation, after setting all properties.
function log_theta_CreateFcn(hObject, eventdata, handles)
% hObject    handle to log_theta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function motion_len_Callback(hObject, eventdata, handles)
% hObject    handle to motion_len (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of motion_len as text
%        str2double(get(hObject,'String')) returns contents of motion_len as a double
global m_len
    a = get(hObject,'String');
    a = str2double(a);
    m_len = a;

% --- Executes during object creation, after setting all properties.
function motion_len_CreateFcn(hObject, eventdata, handles)
% hObject    handle to motion_len (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function motion_theta_Callback(hObject, eventdata, handles)
% hObject    handle to motion_theta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of motion_theta as text
%        str2double(get(hObject,'String')) returns contents of motion_theta as a double
global m_theta
    a = get(hObject,'String');
    a = str2double(a);
    m_theta = a;

% --- Executes during object creation, after setting all properties.
function motion_theta_CreateFcn(hObject, eventdata, handles)
% hObject    handle to motion_theta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Image_load.
function Image_load_Callback(hObject, eventdata, handles)
% hObject    handle to Image_load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Image        
        [filename, pathname] = uigetfile({'*.tif';'*.tiff';'*.jpg';'*.jpeg';'*.png';'*.bmp';'*.gif'},'File Selector');
        image = imread(filename);
        I = image;
        n_dims = ndims(image);
        if n_dims>2
            image = rgb2gray(image);
        end
        image = double(image);     
        image = imlin2(image,0,255);
        Image = image;
        axes(handles.Spectrum);imshow(I);xlabel('Original Image')
        axes(handles.Phase);imagesc(image);
        colormap(gray(256));axis image;xlabel('Image in Processing');


% --- Executes on button press in SaveImage.
function SaveImage_Callback(hObject, eventdata, handles)
% hObject    handle to SaveImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file,path]=uiputfile({'*.bmp','BMP';'*.png','PNG';'*.jpg','JPG';'*.jpeg','JPEG';'*.tif','TIF';'*.tiff','TIFF';'*.gif','GIF'},'Save Image As'); 
 f=getframe(handles.Multiple); x=frame2im(f); 
 imwrite(x,fullfile(path, file));


% --- Executes on button press in NotchRejectFilter.
function NotchRejectFilter_Callback(hObject, eventdata, handles)
% hObject    handle to NotchRejectFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Image
    
    x = Image;
    X=fft2(x);

    [N,M]=size(x);
    midu = (fix(M/2)+1);
    midv = (fix(N/2)+1);

    X2 = X;
    button = 0;
    % filter half width and height
    half_width = 3;
    half_height = 3;

    H = ones( N, M );
    axes(handles.ConV);
    while button~=3        
        im( abs(fftshift(X2) ), 0, 0, 3 );
        xlabel('Image Magnitude Spectrum');
        [x0,y0,button] = ginput(1);
        x0 = round(x0);
        y0 = round(y0);
        % make sure the selected points are at least 
        % at a distance more than half the width and height of the filter 
        x0( x0 < half_width+2 ) = half_width + 2;
        x0( x0 > M - half_width ) = M - half_width;
        y0( y0 < half_height+2 ) = half_height + 2;
        y0( y0 > N - half_height ) = N - half_height;
        % starting and end point of the notch filter in x and y
        stx = x0-half_width;
        edx = x0+half_width;
        sty = y0-half_height;
        edy = y0+half_height;
        % starting and end point of the notch filter conjugate point in x and y
        stx2 = 2*midu - edx;
        edx2 = 2*midu - stx;
        sty2 = 2*midv - edy;
        edy2 = 2*midv - sty;
        % apply the notch filter
        H(sty:edy,stx:edx) = 0;
        H(sty2:edy2,stx2:edx2) = 0;

        X2 = X2.*ifftshift(H);
        x2 = ifft2(X2); 
    end
    axes(handles.Multiple);
    im(x2,0)
    xlabel('Output Image');

% --- Executes on button press in LoadFrequency.
function LoadFrequency_Callback(hObject, eventdata, handles)
% hObject    handle to LoadFrequency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Image
global w_band
        w_band = 'a';
        [filename, pathname] = uigetfile({'*.tif';'*.tiff';'*.jpg';'*.jpeg';'*.png';'*.bmp';'*.gif'},'File Selector');
        image = imread(filename);
        I = image;
        n_dims = ndims(image);
        if n_dims>2
            image = rgb2gray(image);
        end
        image = double(image);     
        Image = image;
        axes(handles.Spectrum);im(I,0);
 

% --- Executes on button press in ApplyFilter.
function ApplyFilter_Callback(hObject, eventdata, handles)
% hObject    handle to ApplyFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Image
global H
    x = Image;
    X = fft2(x);
    H2=ifftshift(H);
    Y = H2.*X;    
    y = ifft2(Y);
    axes(handles.ConV);    
    im(abs(fftshift(Y)),0);
    axes(handles.Multiple);
    im(y,0);


% --- Executes during object creation, after setting all properties.
% function TypeFilter_CreateFcn(hObject, eventdata, handles)
% % hObject    handle to TypeFilter (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% % Hint: listbox controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor','white');
% end


% --- Executes on button press in LowPass.
function LowPass_Callback(hObject, eventdata, handles)
% hObject    handle to LowPass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global H
global type
global Image
global cutoff
    [N,M] = size(Image);
    f1 = ((1:M) - (floor(M/2)+1))/M;
    f2 = ((1:N) - (floor(N/2)+1))/N;
    [F1,F2] = meshgrid(f1,f2);
    D0 =cutoff;
    D = sqrt(F1.^2+F2.^2);
    if type == 1   
        t = 'Lowpass Ideal';
        a = D <=D0;
        b = D >D0;
        D(a) = 1; % prevent divide by zero
        D(b) = 0;
        H = D;
    elseif type == 2
        t = 'Lowpass ButterWorth';
        n = 2;
        H=1./(1+(D./D0).^(2*n));
    else
        t = 'Lowpass Gaussian';
        H =exp((-(D.^2/(2*D0^2))));
    end
    axes(handles.Phase);
    imagesc(f1,f2,H);xlabel(t);


% --- Executes on button press in HighPass.
function HighPass_Callback(hObject, eventdata, handles)
% hObject    handle to HighPass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global H
global type
global Image
global cutoff
    [N,M] = size(Image);
    f1 = ((1:M) - (floor(M/2)+1))/M;
    f2 = ((1:N) - (floor(N/2)+1))/N;
    [F1,F2] = meshgrid(f1,f2);
    D0 =cutoff;
    D = sqrt(F1.^2+F2.^2);
    if type == 1   
        t = 'HighPass Ideal';
        a = D <=D0;
        b = D >D0;
        D(a) = 1; % prevent divide by zero
        D(b) = 0;
        H = D;
        H = 1-H;
    elseif type == 2
        t = 'HighPass ButterWorth';
        n = 2;
        H=1./(1+(D0./D).^(2*n));
    else
        t = 'HighPass Gaussian';
        H =1-exp((-(D.^2/(2*D0^2))));
    end
    axes(handles.Phase);
    imagesc(f1,f2,H);xlabel(t);


% --- Executes on button press in BandPass.
function BandPass_Callback(hObject, eventdata, handles)
% hObject    handle to BandPass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global cutoff
global w_band
global H
global type
global Image
    if isnumeric(w_band)==0
        errordlg('Width of Bandpass/BandReject should be a number','File Error');
    else
        [N,M] = size(Image);
        f1 = ((1:M) - (floor(M/2)+1))/M;
        f2 = ((1:N) - (floor(N/2)+1))/N;
        [F1,F2] = meshgrid(f1,f2);
        D0 =cutoff;
        W = w_band;
        D = sqrt(F1.^2+F2.^2);
        if type == 1   
            t = 'BandPass Ideal';
            a = D <=D0+W/2 & D>=D0-W/2;
            b = D >D0+W/2 | D<D0-W/2;
            D(a) = 0; % prevent divide by zero
            D(b) = 1;
            H = D;
            H = 1-H;
        elseif type == 2
            t = 'BandPass ButterWorth';
            n = 2;
            DD = D.^2-D0^2;
            DD(DD==0)=eps;
            H = 1./(1+((D*W)./DD).^(2*n));
            H = 1-H;
        else
            t = 'BandPass Gaussian';
            DD = D.^2-D0^2;
            H = 1-exp((-(DD./(D*W)).^2));
            H = 1-H;
        end
        axes(handles.Phase);
        imagesc(f1,f2,H);xlabel(t);
    end


% --- Executes on button press in BandReject.
function BandReject_Callback(hObject, eventdata, handles)
% hObject    handle to BandReject (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global cutoff
global w_band
global H
global type
global Image
    if isnumeric(w_band)==0
        errordlg('Width of Bandpass/BandReject should be a number','File Error');
    else
        [N,M] = size(Image);
        f1 = ((1:M) - (floor(M/2)+1))/M;
        f2 = ((1:N) - (floor(N/2)+1))/N;
        [F1,F2] = meshgrid(f1,f2);
        D0 =cutoff;
        W = w_band;
        D = sqrt(F1.^2+F2.^2);
        if type == 1   
            t = 'BandReject Ideal';
            a = D <=D0+W/2 & D>=D0-W/2;
            b = D >D0+W/2 | D<D0-W/2;
            D(a) = 0; % prevent divide by zero
            D(b) = 1;
            H = D;
        elseif type == 2
            t = 'BandReject ButterWorth';
            n = 2;
            DD = D.^2-D0^2;
            DD(DD==0)=eps;
            H = 1./(1+((D*W)./DD).^(2*n));
        else
            t = 'BandReject Gaussian';
            DD = D.^2-D0^2;
            H = 1-exp((-(DD./(D*W)).^2));
        end
        axes(handles.Phase);
        imagesc(f1,f2,H);xlabel(t);
    end
    


function WidthBand_Callback(hObject, eventdata, handles)
% hObject    handle to WidthBand (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of WidthBand as text
%        str2double(get(hObject,'String')) returns contents of WidthBand as a double
global w_band
    a = get(hObject,'String');
    a = str2double(a);
    w_band = a;

% --- Executes during object creation, after setting all properties.
function WidthBand_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WidthBand (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CutoffFrequency_Callback(hObject, eventdata, handles)
% hObject    handle to CutoffFrequency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CutoffFrequency as text
%        str2double(get(hObject,'String')) returns contents of CutoffFrequency as a double
global cutoff
    a = get(hObject,'String');
    a = str2double(a);
    cutoff = a;

% --- Executes during object creation, after setting all properties.
function CutoffFrequency_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CutoffFrequency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function figure1_ResizeFcn(hObject, eventdata, handles)


% --- Executes on button press in Ideal.
function Ideal_Callback(hObject, eventdata, handles)
% hObject    handle to Ideal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global type
    type = 1;

% --- Executes on button press in ButterWorth.
function ButterWorth_Callback(hObject, eventdata, handles)
% hObject    handle to ButterWorth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global type
    type = 2;

% --- Executes on button press in Gaussian_F.
function Gaussian_F_Callback(hObject, eventdata, handles)
% hObject    handle to Gaussian_F (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global type
    type = 3;


% --- Executes on slider movement.
function Gau_Callback(hObject, eventdata, handles)
% hObject    handle to Gau (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global g_size
global Image
    g_std = get(hObject,'Value')+0.000001;
    h = fspecial('gaussian',[g_size g_size],g_std);
    x = Image;
    [M,N]=size(x);
    [K,L]=size(h);
    H= fft2(h,M+K-1,N+L-1);
    X=fft2(x, M+K-1,N+L-1);
    Y=H.*X;
    y = real(ifft2(Y));
    axes(handles.Multiple);
    imagesc(y);xlabel('output of DFT filtering');
    axes(handles.ConV);
    imagesc(abs(fftshift(H)));xlabel('|fft(H)|after padding');

% --- Executes during object creation, after setting all properties.
function Gau_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Gau (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in Reset.
function Reset_Callback(hObject, eventdata, handles)
% hObject    handle to Reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.Signal1,'reset');
cla(handles.Signal2,'reset');
cla(handles.ConV,'reset');
cla(handles.Multiple,'reset');
cla(handles.Spectrum,'reset');
cla(handles.Phase,'reset');


% --- Executes on button press in Rotate1.
function Rotate1_Callback(hObject, eventdata, handles)
% hObject    handle to Rotate1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Sig1
global angle1
    x = -20:0.1:20;
    y = -20:0.1:20;
    Sig1 = imrotate(Sig1,angle1,'nearest','crop');
    axes(handles.Signal1);
    imagesc(x,y,Sig1);axis image;colormap(gray);
% --- Executes on button press in Rotate2.
function Rotate2_Callback(hObject, eventdata, handles)
% hObject    handle to Rotate2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Sig2
global angle2
    x = -20:0.1:20;
    y = -20:0.1:20;
    Sig2 = imrotate(Sig2,angle2,'nearest','crop');
    axes(handles.Signal2);
    imagesc(x,y,Sig2);axis image;colormap(gray);


function angle1_Callback(hObject, eventdata, handles)
% hObject    handle to angle1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of angle1 as text
%        str2double(get(hObject,'String')) returns contents of angle1 as a double
global angle1
    a = get(hObject,'String');
    a = str2double(a);
    angle1 = a;

% --- Executes during object creation, after setting all properties.
function angle1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to angle1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function angle2_Callback(hObject, eventdata, handles)
% hObject    handle to angle2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of angle2 as text
%        str2double(get(hObject,'String')) returns contents of angle2 as a double
global angle2
    a = get(hObject,'String');
    a = str2double(a);
    angle2 = a;

% --- Executes during object creation, after setting all properties.
function angle2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to angle2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
