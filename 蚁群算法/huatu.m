
%subplot(1,2,1)                  %绘制第一个子图形
DrawRoute(C,Shortest_Route)     %画路线图的子函数
% subplot(1,2,2)                  %绘制第二个子图形
% plot(L_best)
% hold on                         %保持图形
% plot(L_ave,'r')
% title('平均距离和最短距离')     %标题
plot(x(1),y(1),'*')
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
end