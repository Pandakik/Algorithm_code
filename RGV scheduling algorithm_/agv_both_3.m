clear
%任务初始化
tmax = 1000;
r=[]

n = size(r,1);%任务数量
rs1 = zeros(n,2);
rs2=rs1;
j=1;
k=1;
for i=1:n
    if r(i,1)==1
        rs1(j,:)=r(i,2:3);
        j=j+1;
    else
         rs2(k,:)=r(i,2:3);
         k=k+1;
    end
end
rd1=rs1(1:j-1,:);%AGV_1任务
rd2=rs2(1:k-1,:);%AGV_2任务

c_num = 61;%槽数

xv1 = zeros(1,tmax);%agv1状态
xv2 = zeros(1,tmax);%agv2状态

sv1 = zeros(1,tmax);%agv1当前位置
sv2 = sv1;%agv2当前位置
sv2=sv2+c_num+1;

sm1 = zeros(1,tmax)-1;%AGV1当前目标位置
sm2=zeros(1,tmax)+c_num+1;

for t = 2:tmax
    
   %RGV1

   if xv1(t) == 0
       if sm1(t)<0%agv1没有目标位置
             if min(rd1(:,1))<210
        [~,es1]=min(abs(rd1(:,1)-sv1(t-1)));
                 sm1(t) = rd1(es1,1);
                    %判断当前位置是否会对AGV2造成影响
                   if sv1(t-1)<sm2(t)-1
                            if sm1(t)<sm2(t)-1
                               %去取货
                               
                                      tmov = abs(rd1(es1,1)-sv1(t-1))*1;
          
                                xv1(t:tmov+t) = 1;
                                sm1(t:tmov+t) = sm1(t);
                                   if sv1(t-1)<=rd1(es1,1)
                                   sv1(t:tmov+t) = sv1(t-1):rd1(es1,1);
                                   else
                                      sv1(t:tmov+t)=sort(rd1(es1,1):sv1(t-1),'descend') ;
                                   end
                                   %正在取货
                                   xv1(tmov+t+1:tmov+t+1+2)=3;
                                   sv1(tmov+t+1:tmov+t+1+2)=rd1(es1,1);
                                   sm1(tmov+t+1:tmov+t+1+2)=rd1(es1,1);
                                    tb = tmov+t+1+2;
                                    
                                    xv1(tb+1) = 0;
                                    sm1(tb+1) = rd1(es1,2);
                                    rd1(es1,1)=1/0;

                            else
                                %如果AGV1的目标位置在AGV2当前目标位置之前，则保持不动。
                                xv1(t)=1;
                                sv1(t)=sv1(t-1);    
                            end
                       
                  
                       
                  else
                     %当前位置为AGV2目标位置之前，需要向后退
                     ab = sm2(t)-2;
                     
                     if ab<=0
                         ab=0
                           tmov = sv1(t-1)-ab;%注意t-1
                    
                    
                    xv1(t:t+tmov)=1;
                    sv1(t:t+tmov)=sort(ab:sv1(t-1),'descend');
                    sm1(t:t+tmov)=ab;
                     else
                     
                    tmov = sv1(t-1)-ab;%注意t-1
                    
                    
                    xv1(t:t+tmov)=1;
                    sv1(t:t+tmov)=sort(ab:sv1(t-1),'descend');
                    sm1(t:t+tmov)=ab;
                     end
                  end
%              else
%                  if sv1(t)>0
%                  sv1(t:t+sv1(t))=sort(0:sv1(t),'descend')
%                  end
             end
       else
           %去送货
                   if sv1(t-1)<sm2(t)-1
                            if sm1(t)<sm2(t)-1
                               %去送货
                               
                                      tmov = abs(sm1(t)-sv1(t-1))*1;
          
                                xv1(t:tmov+t) = 1;
                                sm1(t:tmov+t) = sm1(t);
                                   if sv1(t-1)<=sm1(t)
                                   sv1(t:tmov+t) = sv1(t-1):sm1(t);
                                   else
                                      sv1(t:tmov+t)=sort(sm1(t):sv1(t-1),'descend') ;
                                   end
                                   %正在送货
                                   xv1(tmov+t+1:tmov+t+1+2)=3;
                                   sv1(tmov+t+1:tmov+t+1+2)=sm1(t);
                                   sm1(tmov+t+1:tmov+t+1+2)=sm1(t);
                                   tb = tmov+t+1+2;
                                    
                                    xv1(tb+1) = 0;
                                    sm1(tb+1) = -1;

                            else
                                %如果AGV1的目标位置在AGV2当前目标位置之前，则保持不动。
                                xv1(t)=0;
                                sv1(t)=sv1(t-1);
                                sm1(t+1)=sm1(t);
                            end
                       
                       
                       
                  else
                     %当前位置为AGV2目标位置之前，需要向后退
                     sma = sm2(t)-2;
                     
                     if sma<=0
                         sma = 0;
                    tmov = sv1(t-1)-sma;%注意t-1
                    
                    
                    xv1(t:t+tmov)=1;
                    sv1(t:t+tmov)=sort(sma:sv1(t-1),'descend');
                    sm1(t+1:t+tmov)=sma;
                    sm1(t+tmov+1)=sm1(t);
                     else
                           tmov = sv1(t-1)-sma;%注意t-1

                    xv1(t:t+tmov)=1;
                    sv1(t:t+tmov)=sort(sma:sv1(t-1),'descend');
                    sm1(t+1:t+tmov)=sma;
                    sm1(t+tmov+1)=sm1(t);
                         
                     end

                  end
           
           
           
       
             end
       
   end
   
   
 %RGV1

   if xv2(t) == 0
       if sm2(t)>c_num%agv1没有目标位置
             if min(rd2(:,1))<210
        [~,es1]=min(abs(rd2(:,1)-sv2(t-1)));
                 sm2(t) = rd2(es1,1);
                    %判断当前位置是否会对AGV2造成影响
                   if sv2(t-1)>sm1(t)+1
                            if sm2(t)>sm1(t)+1
                               %去取货
                               
                                      tmov = abs(rd2(es1,1)-sv2(t-1))*1;%777
          
                                xv2(t:tmov+t) = 1;
                                sm2(t:tmov+t) = sm2(t);
                                   if sv2(t-1)<=rd2(es1,1)
                                   sv2(t:tmov+t) = sv2(t-1):rd2(es1,1);
                                   else
                                      sv2(t:tmov+t)=sort(rd2(es1,1):sv2(t-1),'descend') ;
                                   end
                                   %正在取货
                                   xv2(tmov+t+1:tmov+t+1+2)=3;
                                   sv2(tmov+t+1:tmov+t+1+2)=rd2(es1,1);
                                   sm2(tmov+t+1:tmov+t+1+2)=rd2(es1,1);%77777
                                    tb = tmov+t+1+2;
                                    
                                    xv2(tb+1) = 0;
                                    sm2(tb+1) = rd2(es1,2);
                                    rd2(es1,1)=1/0;

                            else
                                %如果AGV1的目标位置在AGV2当前目标位置之前，则保持不动。
                                xv2(t)=1;
                                sv2(t)=sv2(t-1);    
                            end
                       
                  
                       
                  else
                     %当前位置为AGV2目标位置之前，需要向后退
                     ab = sm1(t)+2;
                     
                     if ab>=21
                         ab=21;
                           tmov = (ab-sv2(t-1))*1;%注意t-1777777777777777777777777
                    
                    
                    xv2(t:t+tmov)=1;
                    sv2(t:t+tmov)=sv2(t-1):ab;
                    sm2(t:t+tmov)=ab;
                     else
                     
                    tmov = (ab-sv2(t-1))*1;%注意t-1777777777777777777777777;%注意t-1

                      xv2(t:t+tmov)=1;
                    sv2(t:t+tmov)=sv2(t-1):ab;
                    sm2(t:t+tmov)=ab;
                     end
                  end
       
             end
       else
           %去送货
                   if sv2(t-1)>sm1(t)+1
                            if sm2(t)>sm1(t)+1
                               %去送货
                               
                                      tmov = abs(sm2(t)-sv2(t-1))*1;
          
                                xv2(t:tmov+t) = 1;
                                sm2(t:tmov+t) = sm2(t);
                                   if sv2(t-1)<=sm2(t)
                                   sv2(t:tmov+t) = sv2(t-1):sm2(t);
                                   else
                                      sv2(t:tmov+t)=sort(sm2(t):sv2(t-1),'descend') ;
                                   end
                                   %正在送货
                                   xv2(tmov+t+1:tmov+t+1+2)=3;%7777777777
                                   sv2(tmov+t+1:tmov+t+1+2)=sm2(t);
                                   sm2(tmov+t+1:tmov+t+1+2)=sm2(t);
                                   tb = tmov+t+1+2;
                                    
                                    xv2(tb+1) = 0;
                                    sm2(tb+1) = c_num+1;

                            else
                                %如果AGV1的目标位置在AGV2当前目标位置之前，则保持不动。
                                xv2(t)=0;
                                sv2(t)=sv2(t-1);
                                sm2(t+1)=sm2(t);
                            end
                       
                       
                       
                  else
                     %当前位置为AGV2目标位置之前，需要向后退
                     sma = sm1(t)+2;
                     
                     if sma>=21
                         sma = 21;
                    tmov = sv2(t-1)-sma;%注意t-1
                    
                    
                    xv2(t:t+tmov)=1;
                    sv2(t:t+tmov)=sv2(t-1):sma;
                    sm2(t+1:t+tmov)=sma;
                    sm2(t+tmov+1)=sm2(t);
                     else
                         tmov = sv2(t-1)-sma;%注意t-1
                    
                    
                    xv2(t:t+tmov)=1;
                    sv2(t:t+tmov)=sv2(t-1):sma;
                    sm2(t+1:t+tmov)=sma;
                    sm2(t+tmov+1)=sm2(t);
                     end

                  end
           
           
           
       
             end
       
   end
end
%   sv2(204:204+21-4)=4:21
%   sv1(177:177+8)=sort(0:8,'descend')
% t=177;
%  sv1(t:t+sv1(t))=sort(0:sv1(t),'descend') 
% 
%    % sv2(t:t+(21-sv1(t)))=sv1(t):21;
%    sv2(1:2)=21;
%    sv2(225:500)=21;
t=1:1000;
 % t=t.*4;
plot(t,sv1(1:1000),'r*',t,sv2(1:1000),'b*')      
    legend('RGV1','RGV2')
xlabel('Time(s)')
ylabel('货槽编号')
title('实例一RGV1及RGV2共轨调度情况')
    
    %位置出现负一
    
    

