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

global netKoxo;%сеть Кохонена
global Xkoxo;
global Ykoxo;
global Xkoxo_train;
global Xkoxo_test;
global Ykoxo_train;
global Ykoxo_test;

global netRec; %сеть распознавания
global Xrec;
global Yrec;
global Xrec_train;
global Xrec_test;
global Yrec_train;
global Yrec_test;

global netFeedForward; %сеть прямого распространения
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
global flagPerceptron;  %Вид нейронной сети
global flagKohonen;     %Вид нейронной сети
global flagRecognition; %Вид нейронной сети
global flagFeedForward; %Вид нейронной сети

flagPerceptron  =get(handles.rb1,'Value');%выбираем вид сети из radiobutton
flagKohonen     =get(handles.rb2,'Value');
flagRecognition =get(handles.rb3,'Value');
flagFeedForward =get(handles.rb4,'Value');

classes     =  str2num(get(handles.edit1,'String'));
attributes  =  str2num(get(handles.edit2,'String'));
range       =  str2num(get(handles.edit3,'String'));
count       =  str2num(get(handles.edit4,'String'));
%Если пользователь выбрал сеть Персептрона то генерируем исходные данные,
%делим исходные данные на обучающую и тестирующую выборки и создаем сеть 
if (flagPerceptron==1)
    classes=2;
    [Xperc,~]=gererateRandom(classes, attributes, range, count);
    %Xperc %вывод в командную строку матрицы Х
    %--------------------------------------------------------- 
    %Генерировать вектор классификации
    %мы не можем использовать вектор классификации который получается
    %выходным аргументом у функции gererateRandom потому что
    %классифицировать нужно с помощью нуля и единицы, так как активирующая
    %функция персептрона имеет значения только ноль или единица. 
    Yperc(1:count,:)=0;
    Yperc(count+1:(2*count),:)=1;
    %Yperc
    %----------------------------------------------------------
    %Разбиение массива исходных данных на обучающую
    % и тестирующую выборки
    cv = cvpartition((classes*count),'holdout',0.40);

    % Обучающее множество
    %training(c) – возвращает логический вектор  
    %для отличия номеров обучающей выборки (1) от номеров тестирующей выборки (0).
    %X(training(cv),:) формирует подматрицу X из строк обучающей выборки.
    Xperc_train = Xperc(training(cv),:);
    Yperc_train = Yperc(training(cv),:);
    
    %тестирующая выборка
    Xperc_test = Xperc(test(cv),:);
    Yperc_test = Yperc(test(cv),:);
    %----------------------------------------------------------
    %рисуем график исходных данных
    axes(handles.axes1)%Сделать оси текущими
    plot3(Xperc(:,1),Xperc(:,2),Xperc(:,3),'.');%Рисование графика
    %----------------------------------------------------------
    %создание сети
    netPerc = perceptron;
    netPerc.trainParam.epochs=150;%установка количества эпох - количество итераций для обучения
    view(netPerc)
end
if (flagKohonen==1)
    [Xkoxo,Ykoxo]=gererateRandom(classes, attributes, range, count);
    %----------------------------------------------------------
    %Разбиение массива исходных данных на обучающую
    % и тестирующую выборки
    cv = cvpartition((classes*count),'holdout',0.40)

    % Обучающее множество
    %training(c) – возвращает логический вектор  
    %для отличия номеров обучающей выборки (1) от номеров тестирующей выборки (0).
    %X(training(cv),:) формирует подматрицу X из строк обучающей выборки.
    Xkoxo_train = Xkoxo(training(cv),:);
    Ykoxo_train = Ykoxo(training(cv),:);

    %тестирующая выборка
    Xkoxo_test = Xkoxo(test(cv),:);
    Ykoxo_test = Ykoxo(test(cv),:);
        
    
    %----------------------------------------------------------
    %рисуем график исходных данных
    axes(handles.axes1)%Сделать оси текущими
    for i=1:classes
        cl=find(Ykoxo==i);
        plot3(Xkoxo(cl,1),Xkoxo(cl,2),Xkoxo(cl,3),color{i})%Рисование графика
        hold on;
    end
    hold off;
    title('Исходные данные');

    %----------------------------------------------------------
    %создание сети
    netKoxo=competlayer(3);%формирование слоя
    configure(netKoxo,Xkoxo_train');%настройка весов
    netKoxo.trainParam.epochs=50;%установка количества эпох
    view(netKoxo)
end
if (flagRecognition==1)
    [Xrec,Yrec]=gererateRandom(classes, attributes, range, count);
    Xrec=Xkoxo; 
    Yrec=Ykoxo; 
    %----------------------------------------------------------
    %Разбиение массива исходных данных на обучающую
    % и тестирующую выборки
    cv = cvpartition((classes*count),'holdout',0.40)

    % Обучающее множество
    %training(c) – возвращает логический вектор  
    %для отличия номеров обучающей выборки (1) от номеров тестирующей выборки (0).
    %X(training(cv),:) формирует подматрицу X из строк обучающей выборки.
    Xrec_train = Xrec(training(cv),:);
    Yrec_train = Yrec(training(cv),:);
    
    Xrec_train=Xkoxo_train;
    Yrec_train=Ykoxo_train;

    %тестирующая выборка
    Xrec_test = Xrec(test(cv),:);
    Yrec_test = Yrec(test(cv),:);
    
    Xrec_test=Xkoxo_test;
    Yrec_test=Ykoxo_test;
    %----------------------------------------------------------
    %рисуем график исходных данных
    axes(handles.axes1)%Сделать оси текущими
    for i=1:classes
        cl=find(Yrec==i);
        plot3(Xrec(cl,1),Xrec(cl,2),Xrec(cl,3),color{i})%Рисование графика
        hold on;
    end
    hold off;
    title('Исходные данные');
    %----------------------------------------------------------
    %создание сети
    %net=patternnet(hiddenSizes) – создание двухслойной сети (первый слой  скрытый, второй – выходной) прямого распространения.
    %Входной параметр hiddenSizes – число нейронов в скрытом слое.
    %Выходной параметр net = структура созданной сети.

    netRec=patternnet(10);
    netRec.trainParam.epochs=50;%установка количества эпох
    view(netRec)
end
if (flagFeedForward==1)
    [Xfee,Yfee]=gererateRandom(classes, attributes, range, count);
    %----------------------------------------------------------
    %Разбиение массива исходных данных на обучающую
    % и тестирующую выборки
    cv = cvpartition((classes*count),'holdout',0.40)

    % Обучающее множество
    %training(c) – возвращает логический вектор  
    %для отличия номеров обучающей выборки (1) от номеров тестирующей выборки (0).
    %X(training(cv),:) формирует подматрицу X из строк обучающей выборки.
    Xfee_train = Xfee(training(cv),:);
    Yfee_train = Yfee(training(cv),:);
    
    Xfee_train=Xkoxo_train;
    Yfee_train=Ykoxo_train;

    %тестирующая выборка
    Xfee_test = Xfee(test(cv),:);
    Yfee_test = Yfee(test(cv),:);
    
    Xfee_test=Xkoxo_test;
    Yfee_test=Ykoxo_test;
    
    %----------------------------------------------------------
    %рисуем график исходных данных
    axes(handles.axes1)%Сделать оси текущими
    for i=1:classes
        cl=find(Yfee==i);
        plot3(Xfee(cl,1),Xfee(cl,2),Xfee(cl,3),color{i})%Рисование графика
        hold on;
    end
    hold off;
    title('Исходные данные');
    %СОЗДАНИЕ СЕТИ---------------------------------------------------------
    %net= feedforwardnet(hiddenSizes) – создание двухслойной сети 
    %(первый слой  скрытый, второй – выходной) прямого распространения.
    %Входной параметр hiddenSizes – число нейронов в скрытом слое.
    %Выходной параметр net = структура созданной сети
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
global flagPerceptron;%вид сети

global netKoxo;
global flagKohonen;

global netRec;
global flagRecognition;

global netFeedForward; %сеть прямого распространения
global flagFeedForward; %Вид нейронной сети

if (flagPerceptron==1)
    %net = train(net,P,T) - обучение нейронной сети
    %Входные аргументы:
    %net  - сеть
    %P    - входы - матрица RхQ из Q входных векторов обучающего множества – столбцов размерности R каждый (R-количество признаков).
    %T   - целевые значения  - вектор из Q значений (значения 0 или 1)
    %Выход:
    % net  - обученная сеть (та же, что на входе или другая)
    netPerc=train(netPerc,Xperc_train',Yperc_train');
    %Yperc_train
    view(netPerc);
end
if (flagKohonen==1)
    netKoxo=train(netKoxo,Xkoxo_train');
    view(netKoxo);
end
if (flagRecognition==1)
    %Цель обучения сети распознавания – это минимизация ошибки обучения. 
    %net = train(net,x,t) – обучение сети распознавания
    %x –  Q входных  столбцов размерности R каждый (R-количество признаков).
    %t - матрица выходных значений KxQ, в которой каждый столбец содержит все 0, кроме одного значения, равного 1в элементе i, где i – номер класса, к которому относится объект.
    %Матрицу t можно сформировать с помощью 
    %t=full(ind2vec(Y'))
    %------------------------------------
    %обучение сети
    %------------------------------------
    t = full(ind2vec(Yrec_train'));
    netRec = train(netRec,Xrec_train',t);
    view(netRec) 
end
if(flagFeedForward==1)
    %net = train(net,x,t) – обучение сети прямого распространения сигнала
    %x –  Q входных векторов обучающего множества – столбцов размерности R каждый (R-количество признаков).
    %t   - матрица выходных  значений 1xQ, в которой каждый элемент равен номеру класса вектора обучающего множества.
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
    %рисуем график с обучающей выборкой
    axes(handles.axes1)%Сделать оси текущими
    plot3(Xperc_train(:,1),Xperc_train(:,2),Xperc_train(:,3),color{2})%Рисование графика
end
if (flagKohonen==1)
    %----------------------------------------------------------
    %рисуем график исходных данных
    axes(handles.axes1)%Сделать оси текущими
    for i=1:classes
        cl=find(Ykoxo_train==i);
        plot3(Xkoxo_train(cl,1),Xkoxo_train(cl,2),Xkoxo_train(cl,3),color{i})%Рисование графика
        hold on;
    end
    hold off;
    title('Обучающая выборка');
end;
if (flagRecognition==1)
    %----------------------------------------------------------
    %рисуем график исходных данных
    axes(handles.axes1)%Сделать оси текущими
    for i=1:classes
        cl=find(Yrec_train==i);
        plot3(Xrec_train(cl,1),Xrec_train(cl,2),Xrec_train(cl,3),color{i})%Рисование графика
        hold on;
    end
    hold off;
    title('Обучающая выборка');
end;
if (flagFeedForward==1)
    %----------------------------------------------------------
    %рисуем график исходных данных
    axes(handles.axes1)%Сделать оси текущими
    for i=1:classes
        cl=find(Yfee_train==i);
        plot3(Xfee_train(cl,1),Xrec_train(cl,2),Xrec_train(cl,3),color{i})%Рисование графика
        hold on;
    end
    hold off;
    title('Обучающая выборка');
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
    %рисуем график с тестирующей выборкой
    axes(handles.axes1)%Сделать оси текущими
    plot3(Xperc_test(:,1),Xperc_test(:,2),Xperc_test(:,3),color{1})%Рисование графика
    hold off;
end
if (flagKohonen==1)
    %----------------------------------------------------------
    %рисуем график исходных данных
    axes(handles.axes1)%Сделать оси текущими
    for i=1:classes
        cl=find(Ykoxo_test==i);
        plot3(Xkoxo_test(cl,1),Xkoxo_test(cl,2),Xkoxo_test(cl,3),color{i})%Рисование графика
        hold on;
    end
    hold off;
    title('Тестирующая выборка');
end;  
if (flagRecognition==1)
    %----------------------------------------------------------
    %рисуем график исходных данных
    axes(handles.axes1)%Сделать оси текущими
    for i=1:classes
        cl=find(Yrec_test==i);
        plot3(Xrec_test(cl,1),Xrec_test(cl,2),Xrec_test(cl,3),color{i})%Рисование графика
        hold on;
    end
    hold off;
    title('Тестирующая выборка');
end; 
if (flagFeedForward==1)
    %----------------------------------------------------------
    %рисуем график исходных данных
    axes(handles.axes1)%Сделать оси текущими
    for i=1:classes
        cl=find(Yfee_test==i);
        plot3(Xfee_test(cl,1),Xfee_test(cl,2),Xfee_test(cl,3),color{i})%Рисование графика
        hold on;
    end
    hold off;
    title('Тестирующая выборка');
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
    %рисуем график с тестирующей выборкой
    axes(handles.axes1)%Сделать оси текущими
    plot3(Xperc_test(:,1),Xperc_test(:,2),Xperc_test(:,3),color{1})%Рисование графика
    %----------------------------------------------------------
    %рисуем график с обучающей выборкой
    axes(handles.axes1)%Сделать оси текущими
    hold on;
    plot3(Xperc_train(:,1),Xperc_train(:,2),Xperc_train(:,3),color{2})%Рисование графика
    hold off;
end
if (flagKohonen==1)
    %----------------------------------------------------------
    %рисуем график исходных данных
    axes(handles.axes1)%Сделать оси текущими
    for i=1:classes
        cl=find(Ykoxo==i);
        plot3(Xkoxo(cl,1),Xkoxo(cl,2),Xkoxo(cl,3),color{i})%Рисование графика
        hold on;
    end
    hold off;
    title('Исходные данные');
end; 
if (flagRecognition==1)
    %----------------------------------------------------------
    %рисуем график исходных данных
    axes(handles.axes1)%Сделать оси текущими
    for i=1:classes
        cl=find(Yrec==i);
        plot3(Xrec(cl,1),Xrec(cl,2),Xrec(cl,3),color{i})%Рисование графика
        hold on;
    end
    hold off;
    title('Исходные данные');
end;
if (flagFeedForward==1)
    %----------------------------------------------------------
    %рисуем график исходных данных
    axes(handles.axes1)%Сделать оси текущими
    for i=1:classes
        cl=find(Yfee==i);
        plot3(Xfee(cl,1),Xfee(cl,2),Xfee(cl,3),color{i})%Рисование графика
        hold on;
    end
    hold off;
    title('Исходные данные');
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
    %тестирую на обучающей выборке
    %Выход – вектор из 0 или 1 результатов, полученных по обученной сети.
    %если наблюдений 20 классов 3 =60*0,4 = 24
    ResultTestingPerc_Xrain = netPerc(Xperc_train')
    view(netPerc);
    flaguseplotpc=get(handles.CBUsePlotPC,'Value');%Флаг того, нужно ли рисовать разделяющую плоскость
    %----------------------------------------------------
    %визуальное представление результатов по обучающей выборке
    %на обучающей выборке
    axes(handles.axes1)%Сделать оси текущими
    plotpv(Xperc_train',Yperc_train')
    grid on
    hold on
    netPerc.IW{1};%Значения входных весов
    netPerc.b{1};%Значения смещений
    if (flaguseplotpc==1)
        %Разделяющая поверхность  по весам и смещениям
        plotpc(netPerc.IW{1},netPerc.b{1})
    end
    hold off
end

if (flagKohonen==1)
    ResultTestingKoxo_Xtrain=netKoxo(Xkoxo_train')
    
    %------------------------------------
    %преобразование матрицы– результата классификации для сети Кохонена в массив ind - номеров классов для классифицированных объектов.
    indResultTestingKoxo_Xtrain = vec2ind(ResultTestingKoxo_Xtrain)
    %----------------------------------
    %Визуализация данных 
    axes(handles.axes3)%Сделать оси текущими
    for i=1:classes 
        cl_tr=find(indResultTestingKoxo_Xtrain==i); 
        plot3(Xkoxo_train(cl_tr,1),Xkoxo_train(cl_tr,2),Xkoxo_train(cl_tr,3),color{i}); 
        hold on;
    end
    title('Результаты тестирования по обучающей выборке');
    hold off;
end
if (flagRecognition==1)
    %Вызов y=сеть(выборка) выполняет вычисление по сети и возвращает матрицу,
    %число строк в матрице =числу классов, а 
    %число столбцов =  числу объектов. 
    %Все элементы каждого столбца, кроме одного, равны 0. 
    %Единичный столбец определяет номер победившего нейрона.
    
    %ind = vec2ind(y) - преобразование матрицы – результата классификации 
    % в массив ind - номеров классов для классифицированных объектов.
    %----------------------------------------------------------------------
    %тестирование по сети
    ResultTestingRec_Xtrain= netRec(Xrec_train');
    %----------------------------------------------------------------------
    %преобразование матрицы
    indResultTestingRec_Xtrain = vec2ind(ResultTestingRec_Xtrain);
    %----------------------------------------------------------------------
    %Визуализация данных 
    axes(handles.axes3)%Сделать оси текущими
    for i=1:classes 
        cl_tr=find(indResultTestingRec_Xtrain==i); 
        plot3(Xrec_train(cl_tr,1),Xrec_train(cl_tr,2),Xrec_train(cl_tr,3),color{i}); 
        hold on;
    end
    title('Результаты тестирования по обучающей выборке');
    hold off;
end
if (flagFeedForward==1)
    %Вызов y=сеть(выборка) выполняет вычисление по сети и возвращает матрицу, 
    %число строк в которой равно числу объектов. Все элементы каждого столбца, 
    %кроме одного, равны результату вычисления по сети. 
    ResultTestingFee_Xtrain = netFeedForward(Xfee_train');
    RoundResultTestingFee_Xtrain=round(ResultTestingFee_Xtrain);
    %Визуализация данных --------------------------------------------------
    axes(handles.axes3)%Сделать оси текущими
    for i=1:classes 
        cl_tr=find(RoundResultTestingFee_Xtrain==i); 
        plot3(Xfee_train(cl_tr,1),Xfee_train(cl_tr,2),Xfee_train(cl_tr,3),color{i}); 
        hold on;
    end
    title('Результаты тестирования по обучающей выборке');
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
    %тестирую на тестирующей выборке
    ResultTestingPerc_Xtest = netPerc(Xperc_test')%Выход – вектор из 0 или 1 результатов, полученных по обученной сети.

    flaguseplotpc=get(handles.CBUsePlotPC,'Value');
    %----------------------------------------------------
    %визуальное представление результатов по тестирующей выборке
    
    %отображение тестрирующей выборки по исходномй классифицирующему массиву
    axes(handles.axes1)%Сделать оси текущими
    plotpv(Xperc_test',Yperc_test')
    grid on
    hold on
    
    netPerc.IW{1};%Значения входных весов
    netPerc.b{1};%Значения смещений
    if (flaguseplotpc==1)
        plotpc(netPerc.IW{1},netPerc.b{1})%Разделяющая поверхность  по весам и смещениям
    end
    hold off
end

if (flagKohonen==1)
    ResultTestingKoxo_Xtest=netKoxo(Xkoxo_test')
    
    %----------------------------------------------------------------------
    %преобразование матрицы– результата классификации для сети Кохонена в массив ind - номеров классов для классифицированных объектов.
    indResultTestingKoxo_Xtest = vec2ind(ResultTestingKoxo_Xtest)
    %----------------------------------------------------------------------
    %Визуализация данных 
    hold off;
    axes(handles.axes3)%Сделать оси текущими
    for i=1:classes 
        cl_tr=find(indResultTestingKoxo_Xtest==i); 
        plot3(Xkoxo_test(cl_tr,1),Xkoxo_test(cl_tr,2),Xkoxo_test(cl_tr,3),color{i}); 
        hold on;
    end
    title('Результаты тестирования по тестирующей выборке');
    hold off;
end

if (flagRecognition==1)
    %Вызов y=сеть(выборка) выполняет вычисление по сети и возвращает матрицу,
    %число строк в матрице =числу классов, а 
    %число столбцов =  числу объектов. 
    %Все элементы каждого столбца, кроме одного, равны 0. 
    %Единичный столбец определяет номер победившего нейрона.
    
    %ind = vec2ind(y) - преобразование матрицы – результата классификации 
    % в массив ind - номеров классов для классифицированных объектов.
    %-----------------------------------------------------
    %тестирование по сети
    ResultTestingRec_Xtest= netRec(Xrec_test');
    %------------------------------------
    %преобразование матрицы
    indResultTestingRec_Xtest = vec2ind(ResultTestingRec_Xtest);
    %----------------------------------
    %Визуализация данных 
    axes(handles.axes3)%Сделать оси текущими
    for i=1:classes 
        cl=find(indResultTestingRec_Xtest==i); 
        plot3(Xrec_test(cl,1),Xrec_test(cl,2),Xrec_test(cl,3),color{i}); 
        hold on;
    end
    title('Результаты тестирования по тестирующей выборке');
    hold off;
end
if (flagFeedForward==1)
    %Вызов y=сеть(выборка) выполняет вычисление по сети и возвращает матрицу, 
    %число строк в которой равно числу объектов. Все элементы каждого столбца, 
    %кроме одного, равны результату вычисления по сети. 
    ResultTestingFee_Xtest = netFeedForward(Xfee_test');
    RoundResultTestingFee_Xtest=round(ResultTestingFee_Xtest);
    %Визуализация данных --------------------------------------------------
    axes(handles.axes3)%Сделать оси текущими
    for i=1:classes 
        cl_tr=find(RoundResultTestingFee_Xtest==i); 
        plot3(Xfee_test(cl_tr,1),Xfee_test(cl_tr,2),Xfee_test(cl_tr,3),color{i}); 
        hold on;
    end
    title('Результаты тестирования по тестирующей выборке');
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
    %вычисление матрицы различий
    cperc_train=confusionmat(ResultTestingPerc_Xrain,Yperc_train')
    cperc_train_p = bsxfun(@rdivide,cperc_train,sum(cperc_train,2)) * 100
    %вычисление матрицы различий
    cperc_test=confusionmat(ResultTestingPerc_Xtest,Yperc_test')
    cperc_test_p = bsxfun(@rdivide,cperc_test,sum(cperc_test,2)) * 100
end 
if (flagKohonen==1)
    %вычисление матрицы различий
    ckoxo_train=confusionmat(indResultTestingKoxo_Xtrain',Ykoxo_train)
    ckoxo_train_p = bsxfun(@rdivide,ckoxo_train,sum(ckoxo_train,2)) * 100
    %тестирующая выборка
    ckoxo_test=confusionmat(indResultTestingKoxo_Xtest',Ykoxo_test)
    ckoxo_test_p = bsxfun(@rdivide,ckoxo_test,sum(ckoxo_test,2)) * 100
end
if (flagRecognition==1)
    %вычисление матрицы различий
    crec_train=confusionmat(indResultTestingRec_Xtrain',Yrec_train)
    crec_train_p = bsxfun(@rdivide,crec_train,sum(crec_train,2)) * 100
    %тестирующая выборка
    crec_test=confusionmat(indResultTestingRec_Xtest',Yrec_test)
    crec_test_p = bsxfun(@rdivide,crec_test,sum(crec_test,2)) * 100
end
if (flagFeedForward==1)
    %вычисление матрицы различий
    cfee_train=confusionmat(RoundResultTestingFee_Xtrain',Yfee_train)
    cfee_train_p = bsxfun(@rdivide,cfee_train,sum(cfee_train,2)) * 100
    %тестирующая выборка
    cfee_test=confusionmat(RoundResultTestingFee_Xtest',Yfee_test)
    cfee_test_p = bsxfun(@rdivide,cfee_test,sum(cfee_test,2)) * 100
end


function rb2_Callback(hObject, eventdata, handles)

function SimWithTestSelection_Callback(hObject, eventdata, handles)

function rb3_Callback(hObject, eventdata, handles)

function rb4_Callback(hObject, eventdata, handles)


function ButtonCreatePerceptron_KeyPressFcn(hObject, eventdata, handles)

