function varargout = lab_net(varargin)
% LAB_NET MATLAB code for lab_net.fig
%      LAB_NET, by itself, creates a new LAB_NET or raises the existing
%      singleton*.
%
%      H = LAB_NET returns the handle to a new LAB_NET or the handle to
%      the existing singleton*.
%
%      LAB_NET('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LAB_NET.M with the given input arguments.
%
%      LAB_NET('Property','Value',...) creates a new LAB_NET or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before lab_net_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to lab_net_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help lab_net

% Last Modified by GUIDE v2.5 03-Apr-2018 02:09:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @lab_net_OpeningFcn, ...
                   'gui_OutputFcn',  @lab_net_OutputFcn, ...
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


% --- Executes just before lab_net is made visible.
function lab_net_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to lab_net (see VARARGIN)

% Choose default command line output for lab_net
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes lab_net wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = lab_net_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in ButtonGenerateInitialData.
function ButtonGenerateInitialData_Callback(hObject, eventdata, handles)

function ButtonGenerateInitialData_KeyPressFcn(hObject, eventdata, handles)



function edit1_Callback(hObject, eventdata, handles)


function edit1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)

function edit2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)

function edit3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)




function edit4_CreateFcn(hObject, eventdata, handles)


if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ButtonCreatePerceptron_Callback(hObject, eventdata, handles)
global color;
    color={'+r' '.b' 'og'};
global Xperc;
global Yperc;
global Xperc_train;
global Yperc_train;
global Xperc_test;
global Yperc_test;

global netKoxo;%���� ��������
global Xkoxo;
global Ykoxo;
global Xkoxo_train;
global Xkoxo_test;
global Ykoxo_train;
global Ykoxo_test;

global netRec; %���� �������������
global Xrec;
global Yrec;
global Xrec_train;
global Xrec_test;
global Yrec_train;
global Yrec_test;

global netFeedForward; %���� ������� ���������������
global Xfee;
global Yfee;
global Xfee_train;
global Xfee_test;
global Yfee_train;
global Yfee_test;

global classes;
global attributes;
global count;
global range;
global netPerc;
global flagPerceptron;  %��� ��������� ����
global flagKohonen;     %��� ��������� ����
global flagRecognition; %��� ��������� ����
global flagFeedForward; %��� ��������� ����

flagPerceptron  =get(handles.rb1,'Value');%�������� ��� ���� �� radiobutton
flagKohonen     =get(handles.rb2,'Value');
flagRecognition =get(handles.rb3,'Value');
flagFeedForward =get(handles.rb4,'Value');

classes     =  str2num(get(handles.edit1,'String'));
attributes  =  str2num(get(handles.edit2,'String'));
range       =  str2num(get(handles.edit3,'String'));
count       =  str2num(get(handles.edit4,'String'));
%���� ������������ ������ ���� ����������� �� ���������� �������� ������,
%����� �������� ������ �� ��������� � ����������� ������� � ������� ���� 
if (flagPerceptron==1)
    classes=2;
    [Xperc,~]=gererateRandom(classes, attributes, range, count);
    %Xperc %����� � ��������� ������ ������� �
    %--------------------------------------------------------- 
    %������������ ������ �������������
    %�� �� ����� ������������ ������ ������������� ������� ����������
    %�������� ���������� � ������� gererateRandom ������ ���
    %���������������� ����� � ������� ���� � �������, ��� ��� ������������
    %������� ����������� ����� �������� ������ ���� ��� �������. 
    Yperc(1:count,:)=0;
    Yperc(count+1:(2*count),:)=1;
    %Yperc
    %----------------------------------------------------------
    %��������� ������� �������� ������ �� ���������
    % � ����������� �������
    cv = cvpartition((classes*count),'holdout',0.40);

    % ��������� ���������
    %training(c) � ���������� ���������� ������  
    %��� ������� ������� ��������� ������� (1) �� ������� ����������� ������� (0).
    %X(training(cv),:) ��������� ���������� X �� ����� ��������� �������.
    Xperc_train = Xperc(training(cv),:);
    Yperc_train = Yperc(training(cv),:);
    
    %����������� �������
    Xperc_test = Xperc(test(cv),:);
    Yperc_test = Yperc(test(cv),:);
    %----------------------------------------------------------
    %������ ������ �������� ������
    axes(handles.axes1)%������� ��� ��������
    plot3(Xperc(:,1),Xperc(:,2),Xperc(:,3),'.');%��������� �������
    %----------------------------------------------------------
    %�������� ����
    netPerc = perceptron;
    netPerc.trainParam.epochs=150;%��������� ���������� ���� - ���������� �������� ��� ��������
    view(netPerc)
end
if (flagKohonen==1)
    [Xkoxo,Ykoxo]=gererateRandom(classes, attributes, range, count);
    %----------------------------------------------------------
    %��������� ������� �������� ������ �� ���������
    % � ����������� �������
    cv = cvpartition((classes*count),'holdout',0.40)

    % ��������� ���������
    %training(c) � ���������� ���������� ������  
    %��� ������� ������� ��������� ������� (1) �� ������� ����������� ������� (0).
    %X(training(cv),:) ��������� ���������� X �� ����� ��������� �������.
    Xkoxo_train = Xkoxo(training(cv),:);
    Ykoxo_train = Ykoxo(training(cv),:);

    %����������� �������
    Xkoxo_test = Xkoxo(test(cv),:);
    Ykoxo_test = Ykoxo(test(cv),:);
        
    
    %----------------------------------------------------------
    %������ ������ �������� ������
    axes(handles.axes1)%������� ��� ��������
    for i=1:classes
        cl=find(Ykoxo==i);
        plot3(Xkoxo(cl,1),Xkoxo(cl,2),Xkoxo(cl,3),color{i})%��������� �������
        hold on;
    end
    hold off;
    title('�������� ������');

    %----------------------------------------------------------
    %�������� ����
    netKoxo=competlayer(3);%������������ ����
    configure(netKoxo,Xkoxo_train');%��������� �����
    netKoxo.trainParam.epochs=50;%��������� ���������� ����
    view(netKoxo)
end
if (flagRecognition==1)
    [Xrec,Yrec]=gererateRandom(classes, attributes, range, count);
    Xrec=Xkoxo; 
    Yrec=Ykoxo; 
    %----------------------------------------------------------
    %��������� ������� �������� ������ �� ���������
    % � ����������� �������
    cv = cvpartition((classes*count),'holdout',0.40)

    % ��������� ���������
    %training(c) � ���������� ���������� ������  
    %��� ������� ������� ��������� ������� (1) �� ������� ����������� ������� (0).
    %X(training(cv),:) ��������� ���������� X �� ����� ��������� �������.
    Xrec_train = Xrec(training(cv),:);
    Yrec_train = Yrec(training(cv),:);
    
    Xrec_train=Xkoxo_train;
    Yrec_train=Ykoxo_train;

    %����������� �������
    Xrec_test = Xrec(test(cv),:);
    Yrec_test = Yrec(test(cv),:);
    
    Xrec_test=Xkoxo_test;
    Yrec_test=Ykoxo_test;
    %----------------------------------------------------------
    %������ ������ �������� ������
    axes(handles.axes1)%������� ��� ��������
    for i=1:classes
        cl=find(Yrec==i);
        plot3(Xrec(cl,1),Xrec(cl,2),Xrec(cl,3),color{i})%��������� �������
        hold on;
    end
    hold off;
    title('�������� ������');
    %----------------------------------------------------------
    %�������� ����
    %net=patternnet(hiddenSizes) � �������� ����������� ���� (������ ����  �������, ������ � ��������) ������� ���������������.
    %������� �������� hiddenSizes � ����� �������� � ������� ����.
    %�������� �������� net = ��������� ��������� ����.

    netRec=patternnet(10);
    netRec.trainParam.epochs=50;%��������� ���������� ����
    view(netRec)
end
if (flagFeedForward==1)
    [Xfee,Yfee]=gererateRandom(classes, attributes, range, count);
    %----------------------------------------------------------
    %��������� ������� �������� ������ �� ���������
    % � ����������� �������
    cv = cvpartition((classes*count),'holdout',0.40)

    % ��������� ���������
    %training(c) � ���������� ���������� ������  
    %��� ������� ������� ��������� ������� (1) �� ������� ����������� ������� (0).
    %X(training(cv),:) ��������� ���������� X �� ����� ��������� �������.
    Xfee_train = Xfee(training(cv),:);
    Yfee_train = Yfee(training(cv),:);
    
    Xfee_train=Xkoxo_train;
    Yfee_train=Ykoxo_train;

    %����������� �������
    Xfee_test = Xfee(test(cv),:);
    Yfee_test = Yfee(test(cv),:);
    
    Xfee_test=Xkoxo_test;
    Yfee_test=Ykoxo_test;
    
    %----------------------------------------------------------
    %������ ������ �������� ������
    axes(handles.axes1)%������� ��� ��������
    for i=1:classes
        cl=find(Yfee==i);
        plot3(Xfee(cl,1),Xfee(cl,2),Xfee(cl,3),color{i})%��������� �������
        hold on;
    end
    hold off;
    title('�������� ������');
    %�������� ����---------------------------------------------------------
    %net= feedforwardnet(hiddenSizes) � �������� ����������� ���� 
    %(������ ����  �������, ������ � ��������) ������� ���������������.
    %������� �������� hiddenSizes � ����� �������� � ������� ����.
    %�������� �������� net = ��������� ��������� ����
    netFeedForward= feedforwardnet(10);
    view(netFeedForward);
end

function ButtonTraining_Callback(hObject, eventdata, handles)
global Xperc_train;
global Yperc_train;
global Xkoxo_train;
global Xrec_train;
global Yrec_train;
global Xfee_train;
global Yfee_train;

global netPerc;
global flagPerceptron;%��� ����

global netKoxo;
global flagKohonen;

global netRec;
global flagRecognition;

global netFeedForward; %���� ������� ���������������
global flagFeedForward; %��� ��������� ����

if (flagPerceptron==1)
    %net = train(net,P,T) - �������� ��������� ����
    %������� ���������:
    %net  - ����
    %P    - ����� - ������� R�Q �� Q ������� �������� ���������� ��������� � �������� ����������� R ������ (R-���������� ���������).
    %T   - ������� ��������  - ������ �� Q �������� (�������� 0 ��� 1)
    %�����:
    % net  - ��������� ���� (�� ��, ��� �� ����� ��� ������)
    netPerc=train(netPerc,Xperc_train',Yperc_train');
    %Yperc_train
    view(netPerc);
end
if (flagKohonen==1)
    netKoxo=train(netKoxo,Xkoxo_train');
    view(netKoxo);
end
if (flagRecognition==1)
    %���� �������� ���� ������������� � ��� ����������� ������ ��������. 
    %net = train(net,x,t) � �������� ���� �������������
    %x �  Q �������  �������� ����������� R ������ (R-���������� ���������).
    %t - ������� �������� �������� KxQ, � ������� ������ ������� �������� ��� 0, ����� ������ ��������, ������� 1� �������� i, ��� i � ����� ������, � �������� ��������� ������.
    %������� t ����� ������������ � ������� 
    %t=full(ind2vec(Y'))
    %------------------------------------
    %�������� ����
    %------------------------------------
    t = full(ind2vec(Yrec_train'));
    netRec = train(netRec,Xrec_train',t);
    view(netRec) 
end
if(flagFeedForward==1)
    %net = train(net,x,t) � �������� ���� ������� ��������������� �������
    %x �  Q ������� �������� ���������� ��������� � �������� ����������� R ������ (R-���������� ���������).
    %t   - ������� ��������  �������� 1xQ, � ������� ������ ������� ����� ������ ������ ������� ���������� ���������.
    netFeedForward=train(netFeedForward,Xfee_train',Yfee_train');
    view(netFeedForward);
end


function ButtonShowTrainSelection_Callback(hObject, eventdata, handles)
global color;

global Xperc_train;
global flagPerceptron;

global flagKohonen;
global Xkoxo_train;
global Ykoxo_train;
global classes

global flagRecognition;
global Xrec_train;
global Yrec_train;

global flagFeedForward;
global Xfee_train;
global Yfee_train;

%----------------------------------------------------------
if (flagPerceptron==1)
    %������ ������ � ��������� ��������
    axes(handles.axes1)%������� ��� ��������
    plot3(Xperc_train(:,1),Xperc_train(:,2),Xperc_train(:,3),color{2})%��������� �������
end
if (flagKohonen==1)
    %----------------------------------------------------------
    %������ ������ �������� ������
    axes(handles.axes1)%������� ��� ��������
    for i=1:classes
        cl=find(Ykoxo_train==i);
        plot3(Xkoxo_train(cl,1),Xkoxo_train(cl,2),Xkoxo_train(cl,3),color{i})%��������� �������
        hold on;
    end
    hold off;
    title('��������� �������');
end;
if (flagRecognition==1)
    %----------------------------------------------------------
    %������ ������ �������� ������
    axes(handles.axes1)%������� ��� ��������
    for i=1:classes
        cl=find(Yrec_train==i);
        plot3(Xrec_train(cl,1),Xrec_train(cl,2),Xrec_train(cl,3),color{i})%��������� �������
        hold on;
    end
    hold off;
    title('��������� �������');
end;
if (flagFeedForward==1)
    %----------------------------------------------------------
    %������ ������ �������� ������
    axes(handles.axes1)%������� ��� ��������
    for i=1:classes
        cl=find(Yfee_train==i);
        plot3(Xfee_train(cl,1),Xrec_train(cl,2),Xrec_train(cl,3),color{i})%��������� �������
        hold on;
    end
    hold off;
    title('��������� �������');
end;


function ButtonShowTestSelection_Callback(hObject, eventdata, handles)

global flagPerceptron;
global Xperc_test;

global flagKohonen;
global Xkoxo_test;
global Ykoxo_test;

global color;
global classes;

global flagRecognition;
global Xrec_test;
global Yrec_test;

global flagFeedForward;
global Xfee_test;
global Yfee_test;
%----------------------------------------------------------
if (flagPerceptron==1)
    %������ ������ � ����������� ��������
    axes(handles.axes1)%������� ��� ��������
    plot3(Xperc_test(:,1),Xperc_test(:,2),Xperc_test(:,3),color{1})%��������� �������
    hold off;
end
if (flagKohonen==1)
    %----------------------------------------------------------
    %������ ������ �������� ������
    axes(handles.axes1)%������� ��� ��������
    for i=1:classes
        cl=find(Ykoxo_test==i);
        plot3(Xkoxo_test(cl,1),Xkoxo_test(cl,2),Xkoxo_test(cl,3),color{i})%��������� �������
        hold on;
    end
    hold off;
    title('����������� �������');
end;  
if (flagRecognition==1)
    %----------------------------------------------------------
    %������ ������ �������� ������
    axes(handles.axes1)%������� ��� ��������
    for i=1:classes
        cl=find(Yrec_test==i);
        plot3(Xrec_test(cl,1),Xrec_test(cl,2),Xrec_test(cl,3),color{i})%��������� �������
        hold on;
    end
    hold off;
    title('����������� �������');
end; 
if (flagFeedForward==1)
    %----------------------------------------------------------
    %������ ������ �������� ������
    axes(handles.axes1)%������� ��� ��������
    for i=1:classes
        cl=find(Yfee_test==i);
        plot3(Xfee_test(cl,1),Xfee_test(cl,2),Xfee_test(cl,3),color{i})%��������� �������
        hold on;
    end
    hold off;
    title('����������� �������');
end 
function CBUsePlotPC_Callback(hObject, eventdata, handles)



function ButtonShowTestTrainSelection_Callback(hObject, eventdata, handles)

global flagPerceptron;
global flagKohonen;
global flagFeedForward;
global flagRecognition;

global Xperc_test;
global Xperc_train;
global Xkoxo;
global Ykoxo;
global Xrec;
global Yrec;
global Xfee;
global Yfee;

global classes;
global color;


%----------------------------------------------------------
if (flagPerceptron==1)
    %������ ������ � ����������� ��������
    axes(handles.axes1)%������� ��� ��������
    plot3(Xperc_test(:,1),Xperc_test(:,2),Xperc_test(:,3),color{1})%��������� �������
    %----------------------------------------------------------
    %������ ������ � ��������� ��������
    axes(handles.axes1)%������� ��� ��������
    hold on;
    plot3(Xperc_train(:,1),Xperc_train(:,2),Xperc_train(:,3),color{2})%��������� �������
    hold off;
end
if (flagKohonen==1)
    %----------------------------------------------------------
    %������ ������ �������� ������
    axes(handles.axes1)%������� ��� ��������
    for i=1:classes
        cl=find(Ykoxo==i);
        plot3(Xkoxo(cl,1),Xkoxo(cl,2),Xkoxo(cl,3),color{i})%��������� �������
        hold on;
    end
    hold off;
    title('�������� ������');
end; 
if (flagRecognition==1)
    %----------------------------------------------------------
    %������ ������ �������� ������
    axes(handles.axes1)%������� ��� ��������
    for i=1:classes
        cl=find(Yrec==i);
        plot3(Xrec(cl,1),Xrec(cl,2),Xrec(cl,3),color{i})%��������� �������
        hold on;
    end
    hold off;
    title('�������� ������');
end;
if (flagFeedForward==1)
    %----------------------------------------------------------
    %������ ������ �������� ������
    axes(handles.axes1)%������� ��� ��������
    for i=1:classes
        cl=find(Yfee==i);
        plot3(Xfee(cl,1),Xfee(cl,2),Xfee(cl,3),color{i})%��������� �������
        hold on;
    end
    hold off;
    title('�������� ������');
end

function rb1_Callback(hObject, eventdata, handles)

%TESTING WITH TRAIN SELECTION==============================================
function pushbutton7_Callback(hObject, eventdata, handles)
global  classes
global  color;

global  flagPerceptron;
global  ResultTestingPerc_Xrain;
global  netPerc;
global  Xperc_train;
global  Yperc_train;

global netKoxo;
global Xkoxo_train;
global ResultTestingKoxo_Xtrain;
global flagKohonen;
global indResultTestingKoxo_Xtrain;

global netRec;
global Xrec_train;
global ResultTestingRec_Xtrain;
global flagRecognition;
global indResultTestingRec_Xtrain;

global flagFeedForward;
global Xfee_train;
global ResultTestingFee_Xtrain;
global netFeedForward;
global RoundResultTestingFee_Xtrain;

%--------------------------------------------------------------------------
if (flagPerceptron==1)
    %�������� �� ��������� �������
    %����� � ������ �� 0 ��� 1 �����������, ���������� �� ��������� ����.
    %���� ���������� 20 ������� 3 =60*0,4 = 24
    ResultTestingPerc_Xrain = netPerc(Xperc_train')
    view(netPerc);
    flaguseplotpc=get(handles.CBUsePlotPC,'Value');%���� ����, ����� �� �������� ����������� ���������
    %----------------------------------------------------
    %���������� ������������� ����������� �� ��������� �������
    %�� ��������� �������
    axes(handles.axes1)%������� ��� ��������
    plotpv(Xperc_train',Yperc_train')
    grid on
    hold on
    netPerc.IW{1};%�������� ������� �����
    netPerc.b{1};%�������� ��������
    if (flaguseplotpc==1)
        %����������� �����������  �� ����� � ���������
        plotpc(netPerc.IW{1},netPerc.b{1})
    end
    hold off
end

if (flagKohonen==1)
    ResultTestingKoxo_Xtrain=netKoxo(Xkoxo_train')
    
    %------------------------------------
    %�������������� �������� ���������� ������������� ��� ���� �������� � ������ ind - ������� ������� ��� ������������������ ��������.
    indResultTestingKoxo_Xtrain = vec2ind(ResultTestingKoxo_Xtrain)
    %----------------------------------
    %������������ ������ 
    axes(handles.axes3)%������� ��� ��������
    for i=1:classes 
        cl_tr=find(indResultTestingKoxo_Xtrain==i); 
        plot3(Xkoxo_train(cl_tr,1),Xkoxo_train(cl_tr,2),Xkoxo_train(cl_tr,3),color{i}); 
        hold on;
    end
    title('���������� ������������ �� ��������� �������');
    hold off;
end
if (flagRecognition==1)
    %����� y=����(�������) ��������� ���������� �� ���� � ���������� �������,
    %����� ����� � ������� =����� �������, � 
    %����� �������� =  ����� ��������. 
    %��� �������� ������� �������, ����� ������, ����� 0. 
    %��������� ������� ���������� ����� ����������� �������.
    
    %ind = vec2ind(y) - �������������� ������� � ���������� ������������� 
    % � ������ ind - ������� ������� ��� ������������������ ��������.
    %----------------------------------------------------------------------
    %������������ �� ����
    ResultTestingRec_Xtrain= netRec(Xrec_train');
    %----------------------------------------------------------------------
    %�������������� �������
    indResultTestingRec_Xtrain = vec2ind(ResultTestingRec_Xtrain);
    %----------------------------------------------------------------------
    %������������ ������ 
    axes(handles.axes3)%������� ��� ��������
    for i=1:classes 
        cl_tr=find(indResultTestingRec_Xtrain==i); 
        plot3(Xrec_train(cl_tr,1),Xrec_train(cl_tr,2),Xrec_train(cl_tr,3),color{i}); 
        hold on;
    end
    title('���������� ������������ �� ��������� �������');
    hold off;
end
if (flagFeedForward==1)
    %����� y=����(�������) ��������� ���������� �� ���� � ���������� �������, 
    %����� ����� � ������� ����� ����� ��������. ��� �������� ������� �������, 
    %����� ������, ����� ���������� ���������� �� ����. 
    ResultTestingFee_Xtrain = netFeedForward(Xfee_train');
    RoundResultTestingFee_Xtrain=round(ResultTestingFee_Xtrain);
    %������������ ������ --------------------------------------------------
    axes(handles.axes3)%������� ��� ��������
    for i=1:classes 
        cl_tr=find(RoundResultTestingFee_Xtrain==i); 
        plot3(Xfee_train(cl_tr,1),Xfee_train(cl_tr,2),Xfee_train(cl_tr,3),color{i}); 
        hold on;
    end
    title('���������� ������������ �� ��������� �������');
    hold off;

end




%TESTING WITH TEST SELECTION
% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
global  color;
global  Xperc_test;
global  flagPerceptron;
global  ResultTestingPerc_Xtest;
global  netPerc;
global  Yperc_test;


global netKoxo;
global flagKohonen;
global ResultTestingKoxo_Xtest;
global Xkoxo_test;
global classes
global indResultTestingKoxo_Xtest;

global ResultTestingRec_Xtest;
global netRec;
global Xrec_test;
global indResultTestingRec_Xtest;
global flagRecognition;

global flagFeedForward;
global Xfee_test;
global ResultTestingFee_Xtest;
global netFeedForward;
global RoundResultTestingFee_Xtest;


%--------------------------------------------------------------------------
if (flagPerceptron==1)
    %�������� �� ����������� �������
    ResultTestingPerc_Xtest = netPerc(Xperc_test')%����� � ������ �� 0 ��� 1 �����������, ���������� �� ��������� ����.

    flaguseplotpc=get(handles.CBUsePlotPC,'Value');
    %----------------------------------------------------
    %���������� ������������� ����������� �� ����������� �������
    
    %����������� ������������ ������� �� ��������� ����������������� �������
    axes(handles.axes1)%������� ��� ��������
    plotpv(Xperc_test',Yperc_test')
    grid on
    hold on
    
    netPerc.IW{1};%�������� ������� �����
    netPerc.b{1};%�������� ��������
    if (flaguseplotpc==1)
        plotpc(netPerc.IW{1},netPerc.b{1})%����������� �����������  �� ����� � ���������
    end
    hold off
end

if (flagKohonen==1)
    ResultTestingKoxo_Xtest=netKoxo(Xkoxo_test')
    
    %----------------------------------------------------------------------
    %�������������� �������� ���������� ������������� ��� ���� �������� � ������ ind - ������� ������� ��� ������������������ ��������.
    indResultTestingKoxo_Xtest = vec2ind(ResultTestingKoxo_Xtest)
    %----------------------------------------------------------------------
    %������������ ������ 
    hold off;
    axes(handles.axes3)%������� ��� ��������
    for i=1:classes 
        cl_tr=find(indResultTestingKoxo_Xtest==i); 
        plot3(Xkoxo_test(cl_tr,1),Xkoxo_test(cl_tr,2),Xkoxo_test(cl_tr,3),color{i}); 
        hold on;
    end
    title('���������� ������������ �� ����������� �������');
    hold off;
end

if (flagRecognition==1)
    %����� y=����(�������) ��������� ���������� �� ���� � ���������� �������,
    %����� ����� � ������� =����� �������, � 
    %����� �������� =  ����� ��������. 
    %��� �������� ������� �������, ����� ������, ����� 0. 
    %��������� ������� ���������� ����� ����������� �������.
    
    %ind = vec2ind(y) - �������������� ������� � ���������� ������������� 
    % � ������ ind - ������� ������� ��� ������������������ ��������.
    %-----------------------------------------------------
    %������������ �� ����
    ResultTestingRec_Xtest= netRec(Xrec_test');
    %------------------------------------
    %�������������� �������
    indResultTestingRec_Xtest = vec2ind(ResultTestingRec_Xtest);
    %----------------------------------
    %������������ ������ 
    axes(handles.axes3)%������� ��� ��������
    for i=1:classes 
        cl=find(indResultTestingRec_Xtest==i); 
        plot3(Xrec_test(cl,1),Xrec_test(cl,2),Xrec_test(cl,3),color{i}); 
        hold on;
    end
    title('���������� ������������ �� ����������� �������');
    hold off;
end
if (flagFeedForward==1)
    %����� y=����(�������) ��������� ���������� �� ���� � ���������� �������, 
    %����� ����� � ������� ����� ����� ��������. ��� �������� ������� �������, 
    %����� ������, ����� ���������� ���������� �� ����. 
    ResultTestingFee_Xtest = netFeedForward(Xfee_test');
    RoundResultTestingFee_Xtest=round(ResultTestingFee_Xtest);
    %������������ ������ --------------------------------------------------
    axes(handles.axes3)%������� ��� ��������
    for i=1:classes 
        cl_tr=find(RoundResultTestingFee_Xtest==i); 
        plot3(Xfee_test(cl_tr,1),Xfee_test(cl_tr,2),Xfee_test(cl_tr,3),color{i}); 
        hold on;
    end
    title('���������� ������������ �� ����������� �������');
    hold off;
    
end

function SimWithTrainSelection_Callback(hObject, eventdata, handles)

function PlotSimResult_Callback(hObject, eventdata, handles)

function PlotSimTestResult_Callback(hObject, eventdata, handles)

function CBUsePlotPC_KeyPressFcn(hObject, eventdata, handles)


% --- Executes on button press in ButtonConfusionmat.
function ButtonConfusionmat_Callback(hObject, eventdata, handles)
global ResultTestingPerc_Xrain;
global ResultTestingPerc_Xtest;
global Yperc_train;
global Yperc_test;
global flagPerceptron;

global flagKohonen;
global indResultTestingKoxo_Xtrain;
global indResultTestingKoxo_Xtest;
global Ykoxo_train;
global Ykoxo_test;

global flagRecognition;
global indResultTestingRec_Xtrain;
global indResultTestingRec_Xtest;
global Yrec_train;
global Yrec_test;

global flagFeedForward;
global RoundResultTestingFee_Xtest;
global RoundResultTestingFee_Xtrain;
global Yfee_train;
global Yfee_test;

if (flagPerceptron==1)
    %���������� ������� ��������
    cperc_train=confusionmat(ResultTestingPerc_Xrain,Yperc_train')
    cperc_train_p = bsxfun(@rdivide,cperc_train,sum(cperc_train,2)) * 100
    %���������� ������� ��������
    cperc_test=confusionmat(ResultTestingPerc_Xtest,Yperc_test')
    cperc_test_p = bsxfun(@rdivide,cperc_test,sum(cperc_test,2)) * 100
end 
if (flagKohonen==1)
    %���������� ������� ��������
    ckoxo_train=confusionmat(indResultTestingKoxo_Xtrain',Ykoxo_train)
    ckoxo_train_p = bsxfun(@rdivide,ckoxo_train,sum(ckoxo_train,2)) * 100
    %����������� �������
    ckoxo_test=confusionmat(indResultTestingKoxo_Xtest',Ykoxo_test)
    ckoxo_test_p = bsxfun(@rdivide,ckoxo_test,sum(ckoxo_test,2)) * 100
end
if (flagRecognition==1)
    %���������� ������� ��������
    crec_train=confusionmat(indResultTestingRec_Xtrain',Yrec_train)
    crec_train_p = bsxfun(@rdivide,crec_train,sum(crec_train,2)) * 100
    %����������� �������
    crec_test=confusionmat(indResultTestingRec_Xtest',Yrec_test)
    crec_test_p = bsxfun(@rdivide,crec_test,sum(crec_test,2)) * 100
end
if (flagFeedForward==1)
    %���������� ������� ��������
    cfee_train=confusionmat(RoundResultTestingFee_Xtrain',Yfee_train)
    cfee_train_p = bsxfun(@rdivide,cfee_train,sum(cfee_train,2)) * 100
    %����������� �������
    cfee_test=confusionmat(RoundResultTestingFee_Xtest',Yfee_test)
    cfee_test_p = bsxfun(@rdivide,cfee_test,sum(cfee_test,2)) * 100
end


function rb2_Callback(hObject, eventdata, handles)

function SimWithTestSelection_Callback(hObject, eventdata, handles)

function rb3_Callback(hObject, eventdata, handles)

function rb4_Callback(hObject, eventdata, handles)


function ButtonCreatePerceptron_KeyPressFcn(hObject, eventdata, handles)

