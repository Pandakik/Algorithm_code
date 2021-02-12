x1 = [1,20;4,11;11,12;16,5;17,8;19,12];
x2 = [2,3;7,8;9,7;10,9;14,7;18,1;20,13];

% t = 1:2;
%plot(t,x1,t,x2)
% plotyy(t,x1(1,:),t,x2(1,:))
% hold
%  plot(t,x1,'r*-',t,x2,'bo-')
n = size(x1,1)
for i = 1:n
    if x1(i,1)<x1(i,2)
   plot(x1(i,1):x1(i,2),i.*ones(1,1+x1(i,2)-x1(i,1)),'r')
   hold on
   plot(x1(i,1),i,'b*')
   text(x1(i,1),i,'起点') ; 
   text(x1(i,2),i,'终点') ; 
   hold on
    else
           plot(x1(i,2):x1(i,1),i.*ones(1,1+x1(i,1)-x1(i,2)),'r')
           hold on   
           plot(x1(i,1),i,'b*')
              text(x1(i,1),i,'起点') ; 
   text(x1(i,2),i,'终点') ; 
   hold on
    end
end

 ylabel('货槽编号')
 xlabel('左侧为任务取料货槽 右侧为任务送料货槽')
 title('实例1任务情况')
%  hold on
%  plot(t,x1(1,:),'r*-')
%     legend('TASK_AGV1')
%     hold on
%     plot(t,x2(1,:),'bo-')
%     legend('TASK_AGV2')
%     hold on
% for i  =1: size(x1,1)
%   plotyy(t,x1(i,:),t,x2(i,:))
%     hold on
% end
