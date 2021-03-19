clear all;
close all;
clc;
data1 = xlsread('F:\������PANZONGYONG\2020���ڳ尡\��ѧ��ģ�尡\��ѵ\���ĸ�����\2020�����ѧ����ѧ��ģ������ѵģ��4\B�⣺���߿ɳ�紫����������·�߹滮\B�⸽��1.xlsx');
x = data1(:,1);
y = data1(:,2);
C = data1(:,1:2);
% C = [1304 2312;         % ��������
%     3639 1315;
%     4177 2244;
%     3712 1399;
%     3488 1535;
%     3326 1556;
%     3238 1229;
%     4196 1044;
%     4312 790;
%     4386 570;
%     3007 1970;
%     2562 1756;
%     2788 1491;
%     2381 1676;
%     1332 695;
%     3715 1678;
%     3918 2179;
%     4061 2370;
%     3780 2212;
%     3676 2578;
%     4029 2838;
%     4263 2931;
%     3429 1980;
%     3507 2376;
%     3394 2643;
%     3439 3201;
%     2935 3240;
%     3140 3550;
%     2545 2357;
%     2778 2826;
%     2370 2975];
% figure(1);
% scatter(C(:,1),C(:,2),'k','d');
% title('���зֲ�ͼ');
 
[M,N] = size(C);
% MΪ����Ĺ�ģ  M������
distance = zeros(M,M);     % ������¼������������֮��ľ���
% ��������������֮��ľ���
for m=1:M
    for n=1:M
        distance(m,n) = sqrt(sum((C(m,:)-C(n,:)).^2));
    end
end
m = 50;   % ���ϵĸ���   һ��ȡ10-50    
alpha = 1;   %  ��Ϣ�ص���Ҫ�̶�    һ��ȡ��1,4��
beta = 5;    %  ����ʽӢ�ӵ���Ҫ�̶�   һ��ȡ��3,5��
rho = 0.25;    % ��Ϣ������ϵ��
G = 150;
Q = 100; % ��Ϣ������ϵ��
Eta = 1./distance;  % ����ʽ����
Tau = ones(M,M);  % ��Ϣ�ؾ���  �洢��ÿ��������֮�����Ϣ�ص���ֵ
Tabu = zeros(m,M);  % ���ɱ���¼ÿֻ�����߹���·��
gen = 1;  
R_best = zeros(G,M);  % ���������·��
L_best = inf.*ones(G,1);   % ÿһ�������·���ĳ���     ��ʼ����Ϊ�����
%   ��ʼ��������
while gen<G
    %  ��mֻ���Ϸŵ�n��������
    random_pos = [];
    for i=1:(ceil(m/M))  % mֻ�����漴�ŵ�M������ 
        random_pos = [random_pos,randperm(M)];   %  random_pos=[1~31 + 1~31]   ��ÿֻ���Ϸŵ�����ĳ���  ��random_pos �����ѡ��m�������������ϵĳ�ʼ����
    end
    Tabu(:,1) = (random_pos(1,1:m))';   % ��һ�ε���ÿֻ���ϵĽ��ɱ�
    
    for i=2:M      %  �ӵڶ������п�ʼ
        for j=1:m   %  ÿֻ����
            visited = Tabu(j,1:(i-1));   %  �ڷ��ʵ�i�����е�ʱ�򣬵�j�����Ϸ��ʹ��ĳ���
            % visited=visited(1,:);
            unvisited = zeros(1,(M+1-i));  %  �����ʵĳ���
            visit_P = unvisited;   %  ����j����ʣ�µĳ��еĸ���
            count = 1;
            for k=1:M   % ���ѭ�����ҳ�δ���ʵĳ���  
                if isempty(find(visited==k))   %��û�з��ʹ��ĳ���  �����������֤����k������û�з��ʹ�
                    unvisited(count) = k;
                    count = count+1;
                end
            end
            %  �����ѡ����еĸ���
            for k=1:length(unvisited)    % Tau(visited(end),unvisited(k))���ʹ��ĳ��е����һ��������δ���ʵĳ���֮�����Ϣ��
                visit_P(k) = ((Tau(visited(end),unvisited(k)))^alpha)*(Eta(visited(end),unvisited(k))^beta);
            end
            visit_P = visit_P/sum(visit_P);   %  ����ÿ��·���ĸ��ʵĴ�С
            %   ���ո���ѡ����һ��Ҫ���ʵĳ���
            %   �����������̶�ѡ�񷽷�      ����Ҳ����ѡ��ѡ���������·��ȥ�ߣ� ����������̶�ѡ�񷨡�
            Pcum = cumsum(visit_P);
            selected = find(Pcum>=rand);
            to_visited = unvisited(selected(1));
            Tabu(j,i) = to_visited;  % ��ӵ����ɱ�
        end
    end
    if gen>=2
        Tabu(1,:) = R_best(gen-1,:);
    end
    %  ��¼mֻ���ϵ��������·��
    L = zeros(1,m);
    for i=1:m
        R = Tabu(i,:);
        L(i) = distance(R(M),R(1));   % ��ΪҪ��һ�ܻص�ԭ���ĵص�    
        for j=1:(M-1)
            L(i) = L(i)+distance(R(j),R(j+1));
        end
    end
    L_best(gen) = min(L);    %  ��¼ÿһ����·�������ֵ
    pos = find(L==L_best(gen));
    R_best(gen,:) = Tabu(pos(1),:);   % ���ŵ�·��
    
    %  ������Ϣ�ص�ֵ
    Delta_Tau = zeros(M,M);
    for i=1:m   %  mֻ����
        for j=1:(M-1)   %  M������
            Delta_Tau(Tabu(i,j),Tabu(i,j+1)) = Delta_Tau(Tabu(i,j),Tabu(i,j+1)) + Q/L(i);    %  mֻ���ϵ���Ϣ���ۼ� ������õ���������ant-cycleģ��
        end
        Delta_Tau(Tabu(i,M),Tabu(i,1)) = Delta_Tau(Tabu(i,M),Tabu(i,1)) + Q/L(i);
    end
    Tau = (1-rho).*Tau+Delta_Tau;   % ����·���ϵ���Ϣ�غ���
    %  ���ɱ�����
    Tabu = zeros(m,M);
    
    for i=1:(M-1)
        plot([C(R_best(gen,i),1),C(R_best(gen,i+1),1)],[C(R_best(gen,i),2),C(R_best(gen,i+1),2)],'bo-');
        hold on;
    end
    plot([C(R_best(gen,n),1),C(R_best(gen,1),1)],[C(R_best(gen,n),2),C(R_best(gen,1),2)],'ro-');
    title(['���·����',num2str(L_best(gen))]);
    hold off;
    pause(0.05);
    gen = gen+1;
end
figure(2);
plot(L_best);
title('·�����ȱ仯����');
xlabel('��������');
ylabel('·��������ֵ');