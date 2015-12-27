function varargout = ProjectThanhVy(varargin)
% PROJECTTHANHVY MATLAB code for ProjectThanhVy.fig
%      PROJECTTHANHVY, by itself, creates a new PROJECTTHANHVY or raises the existing
%      singleton*.
%
%      H = PROJECTTHANHVY returns the handle to a new PROJECTTHANHVY or the handle to
%      the existing singleton*.
%
%      PROJECTTHANHVY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECTTHANHVY.M with the given input arguments.
%
%      PROJECTTHANHVY('Property','Value',...) creates a new PROJECTTHANHVY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ProjectThanhVy_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ProjectThanhVy_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ProjectThanhVy

% Last Modified by GUIDE v2.5 24-Oct-2014 14:39:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ProjectThanhVy_OpeningFcn, ...
                   'gui_OutputFcn',  @ProjectThanhVy_OutputFcn, ...
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


% --- Executes just before ProjectThanhVy is made visible.
function ProjectThanhVy_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ProjectThanhVy (see VARARGIN)

% Choose default command line output for ProjectThanhVy
axes(handles.Logo);imshow('logo.jpg');
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ProjectThanhVy wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ProjectThanhVy_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure

clc; clear all ;


function ImageName_Callback(hObject, eventdata, handles)
% hObject    handle to ImageName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ImageName as text
%        str2double(get(hObject,'String')) returns contents of ImageName as a double
global image
    name = get(hObject,'String');
    checkjpg = length(strfind(name,'jpg'));checktif = length(strfind(name,'tif'));
    checkpng = length(strfind(name,'png'));checkbmp = length(strfind(name,'bmp'));
    checkjpeg = length(strfind(name,'jpeg'));
    checktiff = length(strfind(name,'tiff'));
    if (checktiff == 0 && checkjpeg == 0 && checkjpg == 0 && checktif == 0 && checkpng == 0 && checkbmp ==0)
        errordlg('Not a type of image or not support for .mat .dcm types since unknown specified structure of .mat .dcm images','File Error');
    else
        image = imread(name);
        I = image;
        n_dims = ndims(image);
        if n_dims>2
            image = rgb2gray(image);
        end
        image = double(image);     
        image = imlin2(image,0,255);
        axes(handles.OriginalImage);imshow(I);
        axes(handles.ImageAxes);imagesc(image);colormap(gray(256));axis image;
        axes(handles.HistAxes);hist(image(:),100); 
        handles.ImageName = name;
        guidata(hObject,handles);
    end

% --- Executes during object creation, after setting all properties.
function ImageName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ImageName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in CropImage.
function CropImage_Callback(hObject, eventdata, handles)
% hObject    handle to CropImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image    
    image = imcrop(handles.ImageAxes);
    axes(handles.ImageAxes);imagesc(image);colormap(gray(256));axis image;
    axes(handles.HistAxes);hist(image(:),100);
    guidata(hObject,handles);
    

% --- Executes on button press in FindProfile.
function FindProfile_Callback(hObject, eventdata, handles)
% hObject    handle to FindProfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
    axes(handles.ImageAxes);imagesc(image);colormap(gray(256));axis image;
    [X,Y,C] = improfile;
    axes(handles.HistAxes);plot3(X,-Y,C);grid on; 
    guidata(hObject,handles);
    
    
% --- Executes on button press in ImageNegative.
function ImageNegative_Callback(hObject, eventdata, handles)
% hObject    handle to ImageNegative (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
    image = -(image-max(image(:)));
    axes(handles.ImageAxes);imagesc(image);colormap(gray(256));axis image;
    axes(handles.HistAxes);hist(image(:),100);
    guidata(hObject,handles);   

% --- Executes on button press in LogTransform.
function LogTransform_Callback(hObject, eventdata, handles)
% hObject    handle to LogTransform (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image  
    image = 1.*log(1+image);
    axes(handles.ImageAxes);imagesc(image);colormap(gray(256));axis image;
    axes(handles.HistAxes);hist(image(:),100);
    guidata(hObject,handles);


% --- Executes on slider movement.
function Gamma_Callback(hObject, eventdata, handles)
% hObject    handle to Gamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global image
    g = get(hObject,'Value');
    g = g*4+0.1;
    c = 1;
    I = c*(image).^g;
    axes(handles.ImageAxes);imagesc(I);colormap(gray(256));axis image;
    axes(handles.HistAxes);hist(I(:),100);
    a = num2str(g);
    set(handles.GammaDisplay,'String',a);
    handles.Gamma = I;
    guidata(hObject,handles);
% --- Executes during object creation, after setting all properties.
function Gamma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Gamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function GammaDisplay_Callback(hObject, eventdata, handles)
% hObject    handle to GammaDisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of GammaDisplay as text
%        str2double(get(hObject,'String')) returns contents of GammaDisplay as a double
    guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function GammaDisplay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to GammaDisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function y1_Callback(hObject, eventdata, handles)
% hObject    handle to y1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function y1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function y2_Callback(hObject, eventdata, handles)
% hObject    handle to y2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function y2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function x2_Callback(hObject, eventdata, handles)
% hObject    handle to x2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function x2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function x1_Callback(hObject, eventdata, handles)
% hObject    handle to x1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function x1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in LinearContrast.
function LinearContrast_Callback(hObject, eventdata, handles)
% hObject    handle to LinearContrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
     
    X1 = floor(get(handles.x1,'Value')*255)+1.001;
    disp(X1);
    Y1 = floor(get(handles.y1,'Value')*255)+1.002;
    X2 = floor(get(handles.x2,'Value')*255)+1.003;
    Y2 = floor(get(handles.y2,'Value')*255)+1.004;
    % line gradients
    a1 = Y1/X1;
    a2 = (Y2-Y1)/(X2-X1);
    a3 = (255-Y2)/(255-X2); 
    i = image;
    % mask images for colour intensity regions
    mask_1 = double(i<=X1);
    mask_2 = double((i>X1)&(i<X2));
    mask_3 = double(i>=X2); 
    % contrast stretching in regions
    im1 = mask_1.*floor(a1*i);
    im2 = mask_2.*floor(Y1 + (a2*(i-X1)));
    im3 = mask_3.*floor(Y2 + (a3*(i-X2))); 
    % concatance of output image
    i = cast(im1+im2+im3,'double');
    handles.LinearContrast = i;
    guidata(hObject,handles);
    axes(handles.ImageAxes);imagesc(i);colormap(gray(256));axis image;
    axes(handles.HistAxes);hist(i(:),100); 
     % range definitions
    x_r1 = 0:X1;
    x_r2 = X1:X2;
    x_r3 = X2:255;
    % line functions
    yo_1 = floor(a1*x_r1);
    yo_2 = floor(Y1 + (a2*(x_r2-X1)));
    yo_3 = floor(Y2 + (a3*(x_r3-X2)));
    % line concatance
    y = [yo_1 yo_2 yo_3];
    % plot line
    axes(handles.LinearGraph);
    set(gca,'ytick',[]);set(gca,'xtick',[]);
    plot(y);xlim([0 255]);ylim([0 255])


% --- Executes on button press in SetCurrentImage.
function SetCurrentImage_Callback(hObject, eventdata, handles)
% hObject    handle to SetCurrentImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
    image = handles.LinearContrast; 


% --- Executes on selection change in Neighborhood.
function Neighborhood_Callback(hObject, eventdata, handles)
% hObject    handle to Neighborhood (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Neighborhood contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Neighborhood
global image
    x = get(hObject,'Value');
    switch x
    case 1
        h = fspecial('average',5);
    case 2
        h = fspecial('disk',5);
    case 3
        h = fspecial('gaussian',[9 9],3);
    case 4
        h = fspecial('laplacian',.5);
    case 5
        h = fspecial('log',5,.5);
    case 6
        h = fspecial('unsharp',.5);
    case 7
        h = fspecial('prewitt');
    case 8
        h = fspecial('sobel');
    end
    i = imfilter(image,h,'replicate');
    axes(handles.ImageAxes);imagesc(i);colormap(gray(256));axis image;
    axes(handles.HistAxes);hist(i(:),100);
    handles.Neighborhood = i;
    guidata(hObject,handles);
    

% --- Executes during object creation, after setting all properties.
function Neighborhood_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Neighborhood (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in NeighSetCurrent.
function NeighSetCurrent_Callback(hObject, eventdata, handles)
% hObject    handle to NeighSetCurrent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
    image = handles.Neighborhood;


% --- Executes on button press in LocalContrast.
function LocalContrast_Callback(hObject, eventdata, handles)
% hObject    handle to LocalContrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image    
    I = image;
    window_size  = 51; gauss_std = 16;
    [x, y] = size(I);
    %I = imlin2(I,0,255);                                 % scaling to range 0 - 255
    hx = fspecial('gaussian',[1,window_size],gauss_std) ;% Row vector of Filter
    hy = fspecial('gaussian',[window_size,1],gauss_std) ;% Col vector of Filter
    I = padarray(I,[window_size+x-1,window_size+y-1],'symmetric','both'); % padding with zero to avoid edge effect
    A = conv2(I,hx,'same');                            % Meaned Image
    U = conv2(A,hy,'same');
    I2 = I.*I;
    U2 = U.*U;

    B = conv2(I2,hx,'same');   % Standard Deviation Squared
    std2 = conv2(B,hy,'same')-U2;
    std2 = abs(std2);
    std = sqrt(std2);                    % Standard Deviation

    a = std < 0.01;                      % set zeros for values < 1%
    std(a) = 0;
    Image = 64*(I-U)./std + 127;         % Local Contrast Enhancemnet fomula 
    image = Image(window_size+x-1+1:x+window_size+x-1,1+window_size+x-1:y+window_size+x-1);% get rid of Zeros Area.
    axes(handles.ImageAxes);imagesc(image);colormap(gray(256));axis image;
    axes(handles.HistAxes);hist(image(:),100);  


% --- Executes during object creation, after setting all properties.
function ImageAxes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ImageAxes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate ImageAxes


% --- Executes during object creation, after setting all properties.
function HistAxes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HistAxes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate HistAxes


% --- Executes during object creation, after setting all properties.
function Logo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Logo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate Logo


% --- Executes on button press in SaveImage.
function SaveImage_Callback(hObject, eventdata, handles)
% hObject    handle to SaveImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 [file,path]=uiputfile({'*.bmp','BMP';'*.png','PNG';'*.jpg','JPG';'*.jpeg','JPEG';'*.tif','TIF';'*.tiff','TIFF'},'Save Image As'); 
 f=getframe(handles.ImageAxes); x=frame2im(f); 
 imwrite(x,fullfile(path, file));

% --- Executes on button press in SetGammaCurrent.
function SetGammaCurrent_Callback(hObject, eventdata, handles)
% hObject    handle to SetGammaCurrent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
image = handles.Gamma;



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Browser.
function Browser_Callback(hObject, eventdata, handles)
% hObject    handle to Browser (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
        [filename, pathname] = uigetfile({'*.tif';'*.tiff';'*.jpg';'*.jpeg';'*.png';'*.bmp'},'File Selector');
        image = imread(filename);
        I = image;
        n_dims = ndims(image);
        if n_dims>2
            image = rgb2gray(image);
        end
        image = double(image);     
        image = imlin2(image,0,255);
        axes(handles.OriginalImage);imshow(I);
        axes(handles.ImageAxes);imagesc(image);colormap(gray(256));axis image;
        axes(handles.HistAxes);hist(image(:),100); 
        guidata(hObject,handles);
