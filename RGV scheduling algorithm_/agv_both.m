clear
%�����ʼ��
tmax = 2000;
% r=[2	1	20
% 1	2	3
% 2	4	11
% 1	7	8
% 1	9	7
% 1	10	9
% 2	11	12
% 1	14	7
% 2	16	5
% 2	17	8
% 1	18	1
% 2	19	12
% 1	20	13
% ]
r=[1	1	8
2	2	14
1	3	6
1	3	18
1	5	15
2	7	1
2	9	11
2	9	19
2	10	2
2	10	4
1	10	5
2	12	20
1	13	10
2	18	12
1	19	7
]
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

nv1 = size(rd1,1);%��������
nv2 = size(rd2,1);%��������


c_num = 20;%����

xj1 = zeros(1,size(rd1,1));%��Ʒ1��״̬
xj2 = zeros(1,size(rd2,1));%��Ʒ2��״̬

xv1 = zeros(1,tmax);%agv1״̬
xv2 = zeros(1,tmax);%agv2״̬

sv1 = zeros(1,tmax);%agv1��ǰλ��
sv2 = sv1;%agv2��ǰλ��
sv2=sv2+c_num+1;
sv2(1)=c_num+1;%agv2�ڲֿ�2

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
                    tmov = sv1(t-1)-ab;%ע��t-1
                    
                    
                    xv1(t:t+tmov)=1;
                    sv1(t:t+tmov)=sort(ab:sv1(t-1),'descend');
                    sm1(t:t+tmov)=ab;
                    
                  end
       
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
                    tmov = sv1(t-1)-sma;%ע��t-1
                    
                    
                    xv1(t:t+tmov)=1;
                    sv1(t:t+tmov)=sort(sma:sv1(t-1),'descend');
                    sm1(t:t+tmov+1)=sma;

                  end
           
           
           
       
             end
       
   end
   
   
    %RGV2

   if xv2(t) == 0
       if sm2(t)>c_num%agv1û��Ŀ��λ��
             if min(rd2(:,1))<210
        [~,es1]=min(abs(rd2(:,1)-sv2(t-1)));
                 sm2(t) = rd2(es1,1);
                    %�жϵ�ǰλ���Ƿ���AGV2���Ӱ��
                   if sv2(t-1)>sm1(t)+1
                            if sm2(t)>sm1(t)+1
                               %ȥȡ��
                               
                                      tmov = abs(rd2(es1,1)-sv2(t-1))*1;
          
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
                                   sm2(tmov+t+1:tmov+t+1+2)=rd2(es1,1);
                                    tb = tmov+t+1+2;
                                    
                                    xv2(tb+1) = 0;
                                    sm2(tb+1) = rd2(es1,2);
                                    rd2(es1,1)=1/0;

                            else
                                xv2(t)=1;
                                sv2(t)=sv1(t-1);    
                            end
                       
                  
                       
                  else
                     
                     ab = sm1(t)+2;
                    tmov = ab-sv2(t-1);%ע��t-1
                    
                    
                    xv2(t:t+tmov)=1;
                    sv2(t:t+tmov)=sv2(t-1):ab;
                    sm2(t:t+tmov)=ab;

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
                                   xv2(tmov+t+1:tmov+t+1+2)=3;
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
                   
                     sma = sm1(t)+1;
                    tmov = sma-sv2(t-1);%ע��t-1
                    
                    
                    xv2(t:t+tmov)=1;
                    sv2(t:t+tmov)=sv2(t-1):sma;
                    sm2(t+tmov+1)=sm2(t);

                  end
           
           
           
       
             end
       
   end
end
  sv2(204:204+21-4)=4:21
  sv1(177:177+8)=sort(0:8,'descend')
  t=1:100;
  t=t
plot(t,sv1(1:100),'r*',t,sv2(1:100),'b*')      
    legend('RGV1','RGV2')
xlabel('Time(s)')
ylabel('���۱��')
    
    %λ�ó��ָ�һ
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


















































