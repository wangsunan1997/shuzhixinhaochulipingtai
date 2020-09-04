function varargout = untitled(varargin)

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

% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

handles.axes1 = handles.axes1;


    guidata(hObject, handles);
    set(handles.uipanel2, 'Visible', 'Off'); 
    set(handles.uipanel4, 'Visible', 'Off'); 


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



function edit1_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- 时域采样第一次.
function pushbutton1_Callback(hObject, eventdata, handles)

%  时域采样理论验证程序

%获取文本框1的字符串
Tp = get(handles.edit1, 'string');
%将字符串转化为数字
Tp = str2num(Tp);        
%获取文本框2的字符串
Fs = get(handles.edit2, 'string');
%将字符串转化为数字
Fs = str2num(Fs);  
%产生 N 点长采样序列 x(n)
%  时域采样理论验证程序
%产生 N 点长采样序列 x(n)
% Fs=1000;

    
T=1/Fs;	% Fs;T=1/Fs;
N=Tp*Fs;
n=0:N-1;
A=444.128;alph=pi*50*2^0.5;omega=pi*50*2^0.5;
xnt=A*exp(-alph*n*T).*sin(omega*n*T);
M=64;
Xk=T*fft(xnt,M);	%M 点 FFT[xnt)]；
yn='xa(nT)';

subplot(3,2,1);
tstem(xnt,yn);	%调用自编绘图函数 tstem 绘制序列图
box on;
title( { ['(a)   ','Fs = ', num2str(Fs),'hz'] } );  
k=0:M-1;fk=Fs*k/M;
subplot(3,2,2);plot(fk,abs(Xk));
title( { ['(b) T*FT[xa(nT)]  ','Fs = ', num2str(Fs),'hz'] } );  
xlabel('f(Hz)');ylabel('幅度');
axis([0,Fs,0,1.2*max(abs(Xk))]);
                                 
% --- 时域采样第二次.
function pushbutton2_Callback(hObject, eventdata, handles)

%  时域采样理论验证程序

%获取文本框1的字符串
Tp = get(handles.edit1, 'string');
%将字符串转化为数字
Tp = str2num(Tp);        
%获取文本框2的字符串
Fs = get(handles.edit2, 'string');
%将字符串转化为数字
Fs = str2num(Fs);  
%产生 N 点长采样序列 x(n)
%  时域采样理论验证程序
%产生 N 点长采样序列 x(n)
% Fs=1000;

    
T=1/Fs;  	         % Fs;T=1/Fs;
N=Tp*Fs;
n=0:N-1;
A=444.128;alph=pi*50*2^0.5;omega=pi*50*2^0.5;
xnt=A*exp(-alph*n*T).*sin(omega*n*T);
M=64;
Xk=T*fft(xnt,M);	 %M 点 FFT[xnt)]；
yn='xa(nT)';

subplot(3,2,3);
tstem(xnt,yn);	     %调用自编绘图函数 tstem 绘制序列图
box on;
title( { ['(c)   ','Fs = ', num2str(Fs),'hz'] } );  
k=0:M-1;fk=Fs*k/M;
subplot(3,2,4);plot(fk,abs(Xk));
title( { ['(d) T*FT[xa(nT)]  ','Fs = ', num2str(Fs),'hz'] } );  
xlabel('f(Hz)');ylabel('幅度');
axis([0,Fs,0,1.2*max(abs(Xk))]);
  
% --- 时域采样第三次.
function pushbutton3_Callback(hObject, eventdata, handles)


%  时域采样理论验证程序
%获取文本框1的字符串
Tp = get(handles.edit1, 'string');
%将字符串转化为数字
Tp = str2num(Tp);        
%获取文本框2的字符串
Fs = get(handles.edit2, 'string');
%将字符串转化为数字
Fs = str2num(Fs);  
%产生 N 点长采样序列 x(n)
%  时域采样理论验证程序
%产生 N 点长采样序列 x(n)
% Fs=1000;
T=1/Fs;	% Fs;T=1/Fs;
N=Tp*Fs;
n=0:N-1;
A=444.128;alph=pi*50*2^0.5;omega=pi*50*2^0.5;
xnt=A*exp(-alph*n*T).*sin(omega*n*T);
M=64;
Xk=T*fft(xnt,M);	%M 点 FFT[xnt)]；
yn='xa(nT)';

subplot(3,2,5);
tstem(xnt,yn);	%调用自编绘图函数 tstem 绘制序列图
box on;
title( { ['(e)   ','Fs = ', num2str(Fs),'hz'] } );  
k=0:M-1;fk=Fs*k/M;
subplot(3,2,6);plot(fk,abs(Xk));
title( { ['(f) T*FT[xa(nT)]  ','Fs = ', num2str(Fs),'hz'] } );  
xlabel('f(Hz)');ylabel('幅度');
axis([0,Fs,0,1.2*max(abs(Xk))]);
                                   



function edit3_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'),  get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
switch get(hObject,'value')
 case 1 

    set(handles.uipanel2, 'Position', [189.6 31.643 60.4 16]);
    
    set(handles.uipanel2, 'Visible', 'On'); 
    
    set(handles.uipanel4, 'Position', [189.6 31.643 60.4 16]);
    
    set(handles.uipanel4, 'Visible', 'Off');

     %  时域采样理论验证程序


%获取文本框1的字符串
Tp = get(handles.edit1, 'string');
%将字符串转化为数字
Tp = str2num(Tp);        
%获取文本框2的字符串
Fs = get(handles.edit2, 'string');
%将字符串转化为数字
Fs = str2num(Fs);  
%产生 N 点长采样序列 x(n)




   case 2
       
       
       
       
  set(handles.uipanel2, 'Position', [189.6 31.643 60.4 16]);    
  set(handles.uipanel2, 'Visible', 'Off');     
  set(handles.uipanel4, 'Position', [189.6 31.643 60.4 16]);   
  set(handles.uipanel4, 'Visible', 'On');
  
%获取文本框3的字符串
M = get(handles.edit3, 'string');
%将字符串转化为数字
M = str2num(M);  
%获取文本框4的字符串
N = get(handles.edit4, 'string');
%将字符串转化为数字
N = str2num(N);  

    case 3
 
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




%  时域采样代码区

% --- 频域采样代码区.
function pushbutton11_Callback(hObject, eventdata, handles)

%获取文本框3的字符串
M = get(handles.edit3, 'string');
%将字符串转化为数字
M = str2num(M);  
%	频域采样理论验证程序
 n=0:M;
%产生 M 长三角波序列 x(n)
xa=0:floor(M/2);	xb= ceil(M/2)-1:-1:0; xn=[xa,xb];
Xk=fft(xn,1024);	%1024 点 FFT[x(n)],  用于近似序列 x(n)的 FT
%获取文本框3的字符串
N = get(handles.edit4, 'string');
%将字符串转化为数字
N = str2num(N);  
X32k=fft(xn,N);	%32 点 FFT[x(n)]
x32n=ifft(X32k);	%32 点 IFFT[X32(k)]得到 x32(n)

X16k=X32k(1:2:N);	%隔点抽取 X32k 得到 X16(K)
x16n=ifft(X16k,N/2);	%16 点 IFFT[X16(k)]得到 x16(n)

k=0:1023;wk=2*k/1024;	%对 π 归一化数字频率
subplot(3,2,1);  plot(wk,abs(Xk));

title('(a)FT[x(n)]');
xlabel('\omega/\pi');
ylabel('|X(e^j^\omega)|');
axis([0,1,0,200]);	%以上语句绘制三角波序列的连续谱
subplot(3,2,2);  stem(n,xn,'.');  box on
title('(b)  三角波序列 x(n)');
xlabel('n');ylabel('x(n)');
axis([0,32,0,20])
k=0:N/2-1;
subplot(3,2,3);  stem(k,abs(X16k),'.');
box on
title('(c) 16 点频域采样');
xlabel('k');ylabel('|X_1_6(k)|');
axis([0,8,0,200])
n1=0:N/2-1;	%绘制频域 16 点采样的时域和频域波形
subplot(3,2,4);stem(n1,x16n,'.');
box on
title('(d) 16 点 IDFT[X_1_6(k)]');
xlabel('n');ylabel('x_1_6(n)');
axis([0,32,0,20])
k=0:N-1;	%绘制频域 32 点采样的时域和频域波形
subplot(3,2,5);stem(k,abs(X32k),'.');box on
title('(e) 32 点频域采样');
xlabel('k');ylabel('|X_3_2(k)|');
axis([0,16,0,200])
n1=0:N-1;
subplot(3,2,6);stem(n1,x32n,'.');box on
title('(f) 32 点 IDFT[X_3_2(k)]');
xlabel('n');ylabel('x_3_2(n)');
axis([0,32,0,20]);

k=0:N-1;	%绘制频域 32 点采样的时域和频域波形

subplot(3,2,5);stem(k,abs(X32k),'.');box on

title('(e) 32 点频域采样');

xlabel('k');ylabel('|X_3_2(k)|');

axis([0,16,0,200])

n1=0:N-1;

subplot(3,2,6);stem(n1,x32n,'.');box on

title('(f) 32 点 IDFT[X_3_2(k)]');

xlabel('n');ylabel('x_3_2(n)');

axis([0,32,0,20]);

% --- Executes on button press in pushbutton13.
% --------------------------------------------------------------------
function uipanel2_ButtonDownFcn(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function pushbutton1_CreateFcn(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function uipanel2_CreateFcn(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function pushbutton6_CreateFcn(hObject, eventdata, handles)

% --- 清楚所有anes1图像.
function pushbutton14_Callback(hObject, eventdata, handles)

% axes(handles.axes1);
 %  cla
 %  try
 %   delete(allchild(handles.axes1));
 %  end

 
%坐标轴
function axes1_CreateFcn(hObject, eventdata, handles)
