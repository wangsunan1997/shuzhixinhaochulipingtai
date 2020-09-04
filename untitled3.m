function varargout = untitled3(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled3_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled3_OutputFcn, ...
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


% --- Executes just before untitled3 is made visible.
function untitled3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled3 (see VARARGIN)

% Choose default command line output for untitled3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
       set(handles.uipanel2, 'Visible', 'Off'); 
       set(handles.uipanel3, 'Visible', 'Off'); 
       set(handles.uipanel4, 'Visible', 'Off'); 


% --- Outputs from this function are returned to the command line.
function varargout = untitled3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- 弹出菜单.
function popupmenu1_Callback(hObject, eventdata, handles)
            switch get(hObject,'value')
             case 1
                set(handles.uipanel2, 'Position', [147.4 30.214 30 10.714]);
                set(handles.uipanel2, 'Visible', 'On'); 
                set(handles.uipanel3, 'Position', [147.4 30.214 30 10.714]);
                set(handles.uipanel3, 'Visible', 'Off'); 
                set(handles.uipanel4, 'Position', [147.4 30.214 30 10.714]);
                set(handles.uipanel4, 'Visible', 'Off');          
             case 2
               set(handles.uipanel2, 'Position', [147.4 30.214 30 10.714]);
                set(handles.uipanel2, 'Visible', 'Off'); 
                set(handles.uipanel3, 'Position', [147.4 30.214 30 10.714]);
                set(handles.uipanel3, 'Visible', 'On'); 
                set(handles.uipanel4, 'Position', [147.4 30.214 30 10.714]);
                set(handles.uipanel4, 'Visible', 'Off');          
             case 3
                set(handles.uipanel2, 'Position', [147.4 30.214 30 10.714]);
                set(handles.uipanel2, 'Visible', 'Off'); 
                set(handles.uipanel3, 'Position', [147.4 30.214 30 10.714]);
                set(handles.uipanel3, 'Visible', 'Off'); 
                set(handles.uipanel4, 'Position', [147.4 30.214 30 10.714]);
                set(handles.uipanel4, 'Visible', 'On');          
end
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


% ---1.
function pushbutton1_Callback(hObject, eventdata, handles)

x1n=[ones(1,4)];	%产生序列向量 x1(n)=R4(n)

M=8;xa=1:(M/2); xb=(M/2):-1:1;

x2n=[xa,xb];	%产生长度为 8 的三角波序列 x2(n)

x3n=[xb,xa];

X1k8=fft(x1n,8);	%计算 x1n 的 8 点 DFT

X1k16=fft(x1n,16);	%计算 x1n 的 16 点 DFT

X2k8=fft(x2n,8);	%计算 x1n 的 8 点 DFT

X2k16=fft(x2n,16);	%计算 x1n 的 16 点 DFT

X3k8=fft(x3n,8);	%计算 x1n 的 8 点 DFT

X3k16=fft(x3n,16);	%计算 x1n 的 16 点 DFT

%以下绘制幅频特性曲线

subplot(3,2,1);mstem(X1k8);	%调用 mstem 绘制 8 点 DFT 的幅频特性图

title('(1a) 8 点 DFT[x_1(n)]');

xlabel('ω/π');ylabel('幅度');

axis([0,2,0,1.2*max(abs(X1k8))])

subplot(3,2,2);mstem(X1k16);	%绘制 16 点 DFT 的幅频特性图

title('(1b)16 点 DFT[x_1(n)]');

xlabel('ω/π');ylabel('幅度');

axis([0,2,0,1.2*max(abs(X1k16))])

subplot(3,2,3);mstem(X2k8);	%绘制 8 点 DFT 的幅频特性图

title('(2a) 8 点 DFT[x_2(n)]');

xlabel('ω/π');ylabel('幅度');

axis([0,2,0,1.2*max(abs(X2k8))])

subplot(3,2,4);mstem(X2k16);	%绘制 16 点 DFT 的幅频特性图

title('(2b)16 点 DFT[x_2(n)]');

xlabel('ω/π');ylabel('幅度');

axis([0,2,0,1.2*max(abs(X2k16))])

subplot(3,2,5);mstem(X3k8);	%绘制 8 点 DFT 的幅频特性图

title('(3a) 8 点 DFT[x_3(n)]');

xlabel('ω/π');ylabel('幅度');

axis([0,2,0,1.2*max(abs(X3k8))])

subplot(3,2,6);mstem(X3k16);	%绘制 16 点 DFT 的幅频特性图

title('(3b)16 点 DFT[x_3(n)]');

xlabel('ω/π');ylabel('幅度');

axis([0,2,0,1.2*max(abs(X3k16))])


% ---2.
function pushbutton2_Callback(hObject, eventdata, handles)
N=8;n=0:N-1;	%FFT 的变换区间 N=8
x4n=cos(pi*n/4);

x5n=cos(pi*n/4)+cos(pi*n/8);

X4k8=fft(x4n);	%计算 x4n 的 8 点 DFT

X5k8=fft(x5n);	%计算 x5n 的 8 点 DFT



N=16;n=0:N-1;	%FFT 的变换区间 N=16

x4n=cos(pi*n/4);

x5n=cos(pi*n/4)+cos(pi*n/8);

X4k16=fft(x4n);	%计算 x4n 的 16 点 DFT

X5k16=fft(x5n);	%计算 x5n 的 16 点 DFT



subplot(2,2,1);mstem(X4k8);	%绘制 8 点 DFT 的幅频特性图

title('(4a) 8 点 DFT[x_4(n)]');

xlabel('ω/π');ylabel('幅度');

axis([0,2,0,1.2*max(abs(X4k8))])

subplot(2,2,3);mstem(X4k16);	%绘制 16 点 DFT 的幅频特性图

title('(4b)16 点 DFT[x_4(n)]');

xlabel('ω/π');ylabel('幅度');

axis([0,2,0,1.2*max(abs(X4k16))])

subplot(2,2,2);mstem(X5k8);	%绘制 8 点 DFT 的幅频特性图

title('(5a) 8 点 DFT[x_5(n)]');

xlabel('ω/π');ylabel('幅度');

axis([0,2,0,1.2*max(abs(X5k8))])

subplot(2,2,4);mstem(X5k16);	%绘制 16 点 DFT 的幅频特性图

title('(5b)16 点 DFT[x_5(n)]');

xlabel('ω/π');ylabel('幅度');

axis([0,2,0,1.2*max(abs(X5k16))])


% --- 3.
function pushbutton3_Callback(hObject, eventdata, handles)

Fs=64;T=1/Fs;
N=16;n=0:N-1;	%FFT 的变换区间 N=16
x6nT=cos(8*pi*n*T)+cos(16*pi*n*T)+cos(20*pi*n*T);	%对 x6(t)进行 16 点采样
X6k16=fft(x6nT);	%计算 x6nT 的 16 点 DFT
X6k16=fftshift(X6k16);	%将零频率移到频谱中心
Tp=N*T;F=1/Tp;	%频率分辨率 F	
k=-N/2:N/2-1;fk=k*F;	%产生 16 点 DFT 对应的采样点频率（以零频率为中心）
subplot(3,1,1);		
stem(fk,abs(X6k16),'.');box on	%绘制 16 点 DFT 的幅频特性图
title('(6a) 16 点|DFT[x_6(nT)]|');		
xlabel('f(Hz)');ylabel('幅度');		
axis([-N*F/2-1,N*F/2-1,0,1.2*max(abs(X6k16))])	
N=32;n=0:N-1;	%FFT 的变换区间 N=32
x6nT=cos(8*pi*n*T)+cos(16*pi*n*T)+cos(20*pi*n*T);	%对 x6(t)进行 32 点采样
X6k32=fft(x6nT);	%计算 x6nT 的 32 点 DFT
X6k32=fftshift(X6k32);	%将零频率移到频谱中心
Tp=N*T;F=1/Tp;	%频率分辨率 F	
k=-N/2:N/2-1;fk=k*F;	%产生 32 点 DFT 对应的采样点频率（以零频率为中心）
subplot(3,1,2);		
stem(fk,abs(X6k32),'.');box on	%绘制 32 点 DFT 的幅频特性图
title('(6b) 32 点|DFT[x_6(nT)]|');		
xlabel('f(Hz)');ylabel('幅度');		
axis([-N*F/2-1,N*F/2-1,0,1.2*max(abs(X6k32))])	
N=64;n=0:N-1;	%FFT 的变换区间 N=64
x6nT=cos(8*pi*n*T)+cos(16*pi*n*T)+cos(20*pi*n*T);	%对 x6(t)64 点采样
X6k64=fft(x6nT);	%计算 x6nT 的 64 点 DFT
X6k64=fftshift(X6k64);	%将零频率移到频谱中心
Tp=N*T;F=1/Tp;	%频率分辨率 F（提高了一倍）
k=-N/2:N/2-1;fk=k*F;	%产生 64 点 DFT 对应的采样点频率（以零频率为中心）
subplot(3,1,3);
stem(fk,abs(X6k64),'.'); box on	%绘制 64 点 DFT 的幅频特性图
title('(6a) 64 点|DFT[x_6(nT)]|');

xlabel('f(Hz)');ylabel('幅度');

axis([-N*F/2-1,N*F/2-1,0,1.2*max(abs(X6k64))]) 
