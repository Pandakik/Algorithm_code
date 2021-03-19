function [R_best,L_best,L_ave,Shortest_Route,Shortest_Length]=ACATSP(C,NC_max,m,Alpha,Beta,Rho,Q)
%%-------------------------------------------------------------------------
%% 主要符号说明
%% C n个城市的坐标，n×2的矩阵
%% NC_max 最大迭代次数
%% m 蚂蚁个数
%% Alpha 表征信息素重要程度的参数
%% Beta 表征启发式因子重要程度的参数
%% Rho 信息素蒸发系数
%% Q 信息素增加强度系数
%% R_best 各代最佳路线
%% L_best 各代最佳路线的长度
%%=========================================================================
%%第一步：变量初始化
n=size(C,1);%n表示问题的规模（城市个数）
D=zeros(n,n);%D表示完全图的赋权邻接矩阵
%datad = xlsread('F:\潘宗勇PANZONGYONG\2020暑期冲啊\数学建模冲啊\集训\第四个任务\2020杭电大学生数学建模竞赛集训模型4\B题：无线可充电传感器网络充电路线规划\各节点间距离.xlsx');



Eta=1./D;          %Eta为启发因子，这里设为距离的倒数
Tau=ones(n,n);     %Tau为信息素矩阵，任意一条路径
Tabu=zeros(m,n);   %存储并记录路径的生成，m只蚂蚁的路径,一条路径即n个城市的排序
NC=1;               %迭代计数器，记录迭代次数
R_best=zeros(NC_max,n);       %各代最佳路线,NC_max次迭代
L_best=inf.*ones(NC_max,1);   %各代最佳路线的长度, infinity无穷大，初始值为无穷大
L_ave=zeros(NC_max,1);        %各代路线的平均长度
%%开始迭代计算
while NC<=NC_max        %停止条件之一：达到最大迭代次数，停止
%%第二步：将m只蚂蚁放到n个城市上
Randpos=[];   %随即存取
for i=1:(ceil(m/n))     %
Randpos=[Randpos,randperm(n)];  %randperm,n个最大值为n的正整数的随机排列，得到ceil(m/n)个1-n的随机排列。即蚂蚁被平均随机分配到个城市
end
Tabu(:,1)=(Randpos(1,1:m))';    %蚂蚁初位置，各蚂蚁被平均随机分配到个城市
%%第三步：m只蚂蚁按概率函数选择下一座城市，完成各自的周游；第i蚂蚁开始选择访问第j城市
for j=2:n     %所在城市不计算
for i=1:m     %每只蚂蚁分别计算
visited=Tabu(i,1:(j-1)); %记录当前只蚂蚁已访问的城市，避免重复访问
J=zeros(1,(n-j+1));      %设置数组，记录待访问的城市
P=J;                     %对于当前蚂蚁，待访问城市的选择概率分布
Jc=1;
for k=1:n
if length(find(visited==k))==0   %开始时，蚂蚁还未访问的城市，放入待访问矩阵
J(Jc)=k;
Jc=Jc+1;                         %访问的城市个数自加1
end
end
%下面计算待选城市的概率分布，第k个城市
for k=1:length(J)
P(k)=(Tau(visited(end),J(k))^Alpha)*(Eta(visited(end),J(k))^Beta);%visited(end)当前所在城市
end
P=P/(sum(P));
%按概率原则选取下一个城市
Pcum=cumsum(P);     %cumsum，0-1的区间上按概率分配区间的大小
Select=find(Pcum>=rand); %rand 0-1随机数，随机数落在哪个区间就选择哪个城市  %这个方法厉害厉害了
to_visit=J(Select(1));
Tabu(i,j)=to_visit; %记录i蚂蚁访问的j城市·
end
end
if NC>=2
Tabu(1,:)=R_best(NC-1,:);
end
%%第四步：记录本次迭代最佳路线
L=zeros(m,1);     %开始距离为0，m*1的列向量
for i=1:m
R=Tabu(i,:);
for j=1:(n-1)
L(i)=L(i)+D(R(j),R(j+1));    %原距离加上第j个城市到第j+1个城市的距离
end
L(i)=L(i)+D(R(1),R(n));      %一轮下来后走过的距离
end
L_best(NC)=min(L);           %最佳距离取最小
pos=find(L==L_best(NC));     %读出最佳蚂蚁，可能有几个
R_best(NC,:)=Tabu(pos(1),:); %此轮迭代后的最佳路线
L_ave(NC)=mean(L);           %此轮迭代后的平均距离
NC=NC+1                      %迭代继续
%%第五步：更新信息素
Delta_Tau=zeros(n,n);        %开始时信息素为n*n的0矩阵
for i=1:m
for j=1:(n-1)
Delta_Tau(Tabu(i,j),Tabu(i,j+1))=Delta_Tau(Tabu(i,j),Tabu(i,j+1))+Q/L(i);          
%此次循环在路径（i，j）上的信息素增量，第i蚂蚁的信息素在路径上平均分配
end
Delta_Tau(Tabu(i,n),Tabu(i,1))=Delta_Tau(Tabu(i,n),Tabu(i,1))+Q/L(i);
%此次循环在整个路径上的信息素增量
end
Tau=(1-Rho).*Tau+Delta_Tau; %考虑信息素挥发，更新后的信息素
%%第六步：禁忌表清零
Tabu=zeros(m,n);             %%直到最大迭代次数
end
%%第七步：输出结果
Pos=find(L_best==min(L_best)); %找到最佳路径（非0为真）
Shortest_Route=R_best(Pos(1),:) %最大迭代次数后最佳路径
Shortest_Length=L_best(Pos(1)) %最大迭代次数后最短距离
subplot(1,2,1)                  %绘制第一个子图形
DrawRoute(C,Shortest_Route)     %画路线图的子函数
subplot(1,2,2)                  %绘制第二个子图形
plot(L_best)
hold on                         %保持图形
plot(L_ave,'r')
title('平均距离和最短距离')     %标题
function DrawRoute(C,R)
%%=========================================================================
%% DrawRoute.m
%% 画路线图的子函数
%%-------------------------------------------------------------------------
%% C Coordinate 节点坐标，由一个N×2的矩阵存储
%% R Route 路线
%%=========================================================================
N=length(R);
scatter(C(:,1),C(:,2));
hold on
plot([C(R(1),1),C(R(N),1)],[C(R(1),2),C(R(N),2)],'g')
hold on
for ii=2:N
plot([C(R(ii-1),1),C(R(ii),1)],[C(R(ii-1),2),C(R(ii),2)],'g')
hold on
end
for i=1:30
    text(C(i,1)+0.0002,C(i,2),num2str(i)) ; %加上0.01使标号和点不重合，可以调整
end
title('旅行商问题优化结果 ')