% Harmony Search Algorithm
%By GuangDong University of Technology
%By 机电工程学院
%By 机械设计制造及其自动化（卓越）
clc;clear all;close all
%% Problem Prametters
Dim=14; % problem Dimention
Low=[0 0 0 0 0 0 0 0 0 0 0 0 0 0]; % Low Boundry of Problem
High=[5 5 5 5 5 5 5 5 5 5 5 5 5 5]; % High Boundry of Problem

Min=0; % Minimaization or maximaiz of Fun? if Min=1 it will be minimaze the function and if Min=0 it will be maximized the function.

%% Harmony Search Parametters

HMS=100;%Harmony Memory Size (Population Number)
bw=0.2;
HMCR=0.95;%[1], Harmony Memory Considering Rate
PAR=0.3;%[1], Pitch Adjustment Rate

MaxItr=10000;% Maximum number of Iteration

%% Initialization
HM=zeros(HMS,Dim);
HF=zeros(HMS,1);
for i=1:HMS
    HM(i,:)=Low+(High-Low).*rand(1,Dim);
      HF(i,1)=HM(i,1);
end

if Min==1
    [WorstFit,WorstLoc]=max(HF);
else
    [WorstFit,WorstLoc]=min(HF);
end


%% Iteration Loop
for Itr=1:MaxItr
    HarmonyIndex=fix(rand(1,Dim)*HMS)+1;% Random Selection of Harmony
    Harmony=diag(HM(HarmonyIndex,1:Dim))';% Extraxt Value of harmony from Memory(Can Be better???)
    CMMask=rand(1,Dim)<HMCR;
    NHMask=(1-CMMask);
    PAMask=(rand(1,Dim)<PAR).*(CMMask);
    CMMask=CMMask.*(1-PAMask);
    NewHarmony=CMMask.*Harmony+PAMask.*(Harmony+bw*(2*rand(1,Dim)-1))+NHMask.*(Low+(High-Low).*rand(1,Dim));
    OutOfBoundry=(NewHarmony>High)+(NewHarmony<Low);
    NewHarmony(OutOfBoundry==1)=Harmony(OutOfBoundry==1);
    NHF=NewHarmony(:,1);
    if (NHF<WorstFit)&&(Min==1)
        HM(WorstLoc,:)=NewHarmony;
        HF(WorstLoc)=NHF;
        [WorstFit,WorstLoc]=max(HF);
    elseif (NHF<WorstFit)&&(Min==0)
        HM(WorstLoc,:)=NewHarmony;
        HF(WorstLoc)=NHF;
        [WorstFit,WorstLoc]=min(HF);
    end
end

%% Present Best Answer
if Min==1
    [BestFit,BestLoc]=min(HF);
else
    [BestFit,BestLoc]=max(HF);
end
Best=HM(BestLoc,:);

display(Best)
display(BestFit)