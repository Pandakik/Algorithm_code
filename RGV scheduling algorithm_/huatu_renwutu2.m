x1 = [1,20;4,11;11,12;16,5;17,8;19,12];
x2 = [2,3;7,8;9,7;10,9;14,7;18,1;20,13];
% x1 = [1	20
% 2	3
% 4	11
% 7	8
% 9	7
% 10	9
% 11	12
% 14	7
% 16	5
% 17	8
% 18	1
% 19	12
% 20	13
% ]

n = size(x1,1)
for i = 1:n
    if x1(i,1)<x1(i,2)
   plot(x1(i,1):x1(i,2),i.*ones(1,1+x1(i,2)-x1(i,1)),'r')
   hold on
   plot(x1(i,1),i,'g*','markersize',10)
   text(x1(i,1)-0.7,i,'起点') ; 
   text(x1(i,2),i,'终点') ; 
   text((x1(i,1)+x1(i,2))/2,i+0.2,'AGV1') ; 
   hold on
    else
           plot(x1(i,2):x1(i,1),i.*ones(1,1+x1(i,1)-x1(i,2)),'r')
           hold on   
           plot(x1(i,1),i,'g*','markersize',10)
              text(x1(i,1),i,'起点') ; 
   text(x1(i,2)-0.7,i,'终点') ; 
      text((x1(i,1)+x1(i,2))/2,i+0.2,'AGV1') ; 
   hold on
    end
end
x1 = x2;
n = size(x1,1)
for i = 1:n
    if x1(i,1)<x1(i,2)
   plot(x1(i,1):x1(i,2),(i+6).*ones(1,1+x1(i,2)-x1(i,1)),'b')
   hold on
   plot(x1(i,1),i+6,'g*','markersize',10)
   text(x1(i,1)-0.7,i+6,'起点') ; 
   text(x1(i,2),i+6,'终点') ; 
      text((x1(i,1)+x1(i,2))/2-0.2,i+6+0.2,'AGV2') ; 
   hold on
    else
           plot(x1(i,2):x1(i,1),(i+6).*ones(1,1+x1(i,1)-x1(i,2)),'b')
           hold on   
           plot(x1(i,1),i+6,'g*','markersize',10)
              text(x1(i,1),i+6,'起点') ; 
   text(x1(i,2)-0.7,i+6,'终点') ; 
         text((x1(i,1)+x1(i,2))/2-0.2,i+6+0.2,'AGV2') ; 
   hold on
    end
end

 ylabel('任务编号')
 xlabel('货槽编号')
 title('实例1任务情况')

