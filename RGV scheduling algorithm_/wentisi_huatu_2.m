plot(1:10.08,2*ones(1,size(1:10.08,2)),'b')
hold on
text(1,2,'AGV1开始运输任务') ;
text(10.08,2,'AGV1运输任务结束') ;
text(10.08,1,'AGV1返回维修') ;
plot(10.08,1,'*','markersize',8)
hold on
plot(1,2,'b*','markersize',8)


plot(1:28,3*ones(1,size(1:28,2)),'r')
text(1,3,'AGV2开始运输任务') ;
text(28,1,'AGV2返回维修') ;
plot(28,1,'r*','markersize',8)
hold on
plot(1,3,'*','markersize',8)

hold on
plot(28:33,1*ones(1,size(28:33,2)),'r')
plot(28:33,3*ones(1,size(28:33,2)),'b')
plot(10.08:28,1*ones(1,size(10.08:28,2)),'b')
text(28,3,'AGV1完成AGV2未完成任务') ;
plot(28,3,'b*','markersize',8)
text(33,0,'AGV1及AGV2任务完成，返回仓库维修等待下一批任务') ;
plot(33,0,'g*','markersize',8)
xlabel('Time(min)')

plot(33:38,zeros(1,6),'g')

title('AGV1及AGV2调度情况')