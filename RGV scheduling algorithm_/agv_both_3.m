clear
%�����ʼ��
tmax = 1000;
r=[]

n = size(r,1);%��������
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
rd1=rs1(1:j-1,:);%AGV_1����
rd2=rs2(1:k-1,:);%AGV_2����

c_num = 61;%����

xv1 = zeros(1,tmax);%agv1״̬
xv2 = zeros(1,tmax);%agv2״̬

sv1 = zeros(1,tmax);%agv1��ǰλ��
sv2 = sv1;%agv2��ǰλ��
sv2=sv2+c_num+1;

sm1 = zeros(1,tmax)-1;%AGV1��ǰĿ��λ��
sm2=zeros(1,tmax)+c_num+1;

for t = 2:tmax
    
   %RGV1

   if xv1(t) == 0
       if sm1(t)<0%agv1û��Ŀ��λ��
             if min(rd1(:,1))<210
        [~,es1]=min(abs(rd1(:,1)-sv1(t-1)));
                 sm1(t) = rd1(es1,1);
                    %�жϵ�ǰλ���Ƿ���AGV2���Ӱ��
                   if sv1(t-1)<sm2(t)-1
                            if sm1(t)<sm2(t)-1
                               %ȥȡ��
                               
                                      tmov = abs(rd1(es1,1)-sv1(t-1))*1;
          
                                xv1(t:tmov+t) = 1;
                                sm1(t:tmov+t) = sm1(t);
                                   if sv1(t-1)<=rd1(es1,1)
                                   sv1(t:tmov+t) = sv1(t-1):rd1(es1,1);
                                   else
                                      sv1(t:tmov+t)=sort(rd1(es1,1):sv1(t-1),'descend') ;
                                   end
                                   %����ȡ��
                                   xv1(tmov+t+1:tmov+t+1+2)=3;
                                   sv1(tmov+t+1:tmov+t+1+2)=rd1(es1,1);
                                   sm1(tmov+t+1:tmov+t+1+2)=rd1(es1,1);
                                    tb = tmov+t+1+2;
                                    
                                    xv1(tb+1) = 0;
                                    sm1(tb+1) = rd1(es1,2);
                                    rd1(es1,1)=1/0;

                            else
                                %���AGV1��Ŀ��λ����AGV2��ǰĿ��λ��֮ǰ���򱣳ֲ�����
                                xv1(t)=1;
                                sv1(t)=sv1(t-1);    
                            end
                       
                  
                       
                  else
                     %��ǰλ��ΪAGV2Ŀ��λ��֮ǰ����Ҫ�����
                     ab = sm2(t)-2;
                     
                     if ab<=0
                         ab=0
                           tmov = sv1(t-1)-ab;%ע��t-1
                    
                    
                    xv1(t:t+tmov)=1;
                    sv1(t:t+tmov)=sort(ab:sv1(t-1),'descend');
                    sm1(t:t+tmov)=ab;
                     else
                     
                    tmov = sv1(t-1)-ab;%ע��t-1
                    
                    
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
           %ȥ�ͻ�
                   if sv1(t-1)<sm2(t)-1
                            if sm1(t)<sm2(t)-1
                               %ȥ�ͻ�
                               
                                      tmov = abs(sm1(t)-sv1(t-1))*1;
          
                                xv1(t:tmov+t) = 1;
                                sm1(t:tmov+t) = sm1(t);
                                   if sv1(t-1)<=sm1(t)
                                   sv1(t:tmov+t) = sv1(t-1):sm1(t);
                                   else
                                      sv1(t:tmov+t)=sort(sm1(t):sv1(t-1),'descend') ;
                                   end
                                   %�����ͻ�
                                   xv1(tmov+t+1:tmov+t+1+2)=3;
                                   sv1(tmov+t+1:tmov+t+1+2)=sm1(t);
                                   sm1(tmov+t+1:tmov+t+1+2)=sm1(t);
                                   tb = tmov+t+1+2;
                                    
                                    xv1(tb+1) = 0;
                                    sm1(tb+1) = -1;

                            else
                                %���AGV1��Ŀ��λ����AGV2��ǰĿ��λ��֮ǰ���򱣳ֲ�����
                                xv1(t)=0;
                                sv1(t)=sv1(t-1);
                                sm1(t+1)=sm1(t);
                            end
                       
                       
                       
                  else
                     %��ǰλ��ΪAGV2Ŀ��λ��֮ǰ����Ҫ�����
                     sma = sm2(t)-2;
                     
                     if sma<=0
                         sma = 0;
                    tmov = sv1(t-1)-sma;%ע��t-1
                    
                    
                    xv1(t:t+tmov)=1;
                    sv1(t:t+tmov)=sort(sma:sv1(t-1),'descend');
                    sm1(t+1:t+tmov)=sma;
                    sm1(t+tmov+1)=sm1(t);
                     else
                           tmov = sv1(t-1)-sma;%ע��t-1

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
       if sm2(t)>c_num%agv1û��Ŀ��λ��
             if min(rd2(:,1))<210
        [~,es1]=min(abs(rd2(:,1)-sv2(t-1)));
                 sm2(t) = rd2(es1,1);
                    %�жϵ�ǰλ���Ƿ���AGV2���Ӱ��
                   if sv2(t-1)>sm1(t)+1
                            if sm2(t)>sm1(t)+1
                               %ȥȡ��
                               
                                      tmov = abs(rd2(es1,1)-sv2(t-1))*1;%777
          
                                xv2(t:tmov+t) = 1;
                                sm2(t:tmov+t) = sm2(t);
                                   if sv2(t-1)<=rd2(es1,1)
                                   sv2(t:tmov+t) = sv2(t-1):rd2(es1,1);
                                   else
                                      sv2(t:tmov+t)=sort(rd2(es1,1):sv2(t-1),'descend') ;
                                   end
                                   %����ȡ��
                                   xv2(tmov+t+1:tmov+t+1+2)=3;
                                   sv2(tmov+t+1:tmov+t+1+2)=rd2(es1,1);
                                   sm2(tmov+t+1:tmov+t+1+2)=rd2(es1,1);%77777
                                    tb = tmov+t+1+2;
                                    
                                    xv2(tb+1) = 0;
                                    sm2(tb+1) = rd2(es1,2);
                                    rd2(es1,1)=1/0;

                            else
                                %���AGV1��Ŀ��λ����AGV2��ǰĿ��λ��֮ǰ���򱣳ֲ�����
                                xv2(t)=1;
                                sv2(t)=sv2(t-1);    
                            end
                       
                  
                       
                  else
                     %��ǰλ��ΪAGV2Ŀ��λ��֮ǰ����Ҫ�����
                     ab = sm1(t)+2;
                     
                     if ab>=21
                         ab=21;
                           tmov = (ab-sv2(t-1))*1;%ע��t-1777777777777777777777777
                    
                    
                    xv2(t:t+tmov)=1;
                    sv2(t:t+tmov)=sv2(t-1):ab;
                    sm2(t:t+tmov)=ab;
                     else
                     
                    tmov = (ab-sv2(t-1))*1;%ע��t-1777777777777777777777777;%ע��t-1

                      xv2(t:t+tmov)=1;
                    sv2(t:t+tmov)=sv2(t-1):ab;
                    sm2(t:t+tmov)=ab;
                     end
                  end
       
             end
       else
           %ȥ�ͻ�
                   if sv2(t-1)>sm1(t)+1
                            if sm2(t)>sm1(t)+1
                               %ȥ�ͻ�
                               
                                      tmov = abs(sm2(t)-sv2(t-1))*1;
          
                                xv2(t:tmov+t) = 1;
                                sm2(t:tmov+t) = sm2(t);
                                   if sv2(t-1)<=sm2(t)
                                   sv2(t:tmov+t) = sv2(t-1):sm2(t);
                                   else
                                      sv2(t:tmov+t)=sort(sm2(t):sv2(t-1),'descend') ;
                                   end
                                   %�����ͻ�
                                   xv2(tmov+t+1:tmov+t+1+2)=3;%7777777777
                                   sv2(tmov+t+1:tmov+t+1+2)=sm2(t);
                                   sm2(tmov+t+1:tmov+t+1+2)=sm2(t);
                                   tb = tmov+t+1+2;
                                    
                                    xv2(tb+1) = 0;
                                    sm2(tb+1) = c_num+1;

                            else
                                %���AGV1��Ŀ��λ����AGV2��ǰĿ��λ��֮ǰ���򱣳ֲ�����
                                xv2(t)=0;
                                sv2(t)=sv2(t-1);
                                sm2(t+1)=sm2(t);
                            end
                       
                       
                       
                  else
                     %��ǰλ��ΪAGV2Ŀ��λ��֮ǰ����Ҫ�����
                     sma = sm1(t)+2;
                     
                     if sma>=21
                         sma = 21;
                    tmov = sv2(t-1)-sma;%ע��t-1
                    
                    
                    xv2(t:t+tmov)=1;
                    sv2(t:t+tmov)=sv2(t-1):sma;
                    sm2(t+1:t+tmov)=sma;
                    sm2(t+tmov+1)=sm2(t);
                     else
                         tmov = sv2(t-1)-sma;%ע��t-1
                    
                    
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
ylabel('���۱��')
title('ʵ��һRGV1��RGV2����������')
    
    %λ�ó��ָ�һ
    
    

