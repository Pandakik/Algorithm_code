clear
%�����ʼ��
tmax = 500;
r=[];
c_num = 20;%����

for k = 1:2
   if k==1
      n = size(r,1);%��������
rs1 = zeros(n,2);
rs2=rs1;
j=1;
f=1;
for i=1:n
    if r(i,1)==1
        rs1(j,:)=r(i,2:3);
        j=j+1;
    else
         rs2(f,:)=r(i,2:3);
         f=f+1;
    end
end
rd1=rs1(1:j-1,:);%AGV_1����
rd2=rs2(1:f-1,:);%AGV_2����

nv1 = size(rd1,1);%��������
nv2 = size(rd2,1);%��������

%��ͼ����
% x=1:2
% plot(x,rd1,'r*-')
% hold on
% plot(x,rd2,'bo-')



xj1 = zeros(1,size(rd1,1));%��Ʒ1��״̬
xj2 = zeros(1,size(rd2,1));%��Ʒ2��״̬

xv1 = zeros(1,tmax);%agv1״̬
xv2 = zeros(1,tmax);%agv2״̬

sv1 = zeros(1,tmax);%agv1��ǰλ��
sv2 = sv1;%agv2��ǰλ��
sv2(1)=c_num+1;%agv2�ڲֿ�2 
   else
        n = size(r,1);%��������
rs1 = zeros(n,2);
rs2=rs1;
j=1;
f=1;
for i=1:n
    if r(i,1)==2
        rs1(j,:)=r(i,2:3);
        j=j+1;
    else
         rs2(f,:)=r(i,2:3);
         f=f+1;
    end
end
rd1=rs1(1:j-1,:);%AGV_1����
rd2=rs2(1:f-1,:);%AGV_2����

nv1 = size(rd1,1);%��������
nv2 = size(rd2,1);%��������

%��ͼ����
% x=1:2
% plot(x,rd1,'r*-')
% hold on
% plot(x,rd2,'bo-')


xj1 = zeros(1,size(rd1,1));%��Ʒ1��״̬
xj2 = zeros(1,size(rd2,1));%��Ʒ2��״̬

xv1 = zeros(1,tmax);%agv1״̬
xv2 = zeros(1,tmax);%agv2״̬

sv1 = zeros(1,tmax);%agv1��ǰλ��
sv2 = sv1;%agv2��ǰλ��
sv1=sv1+c_num+1;%agv2�ڲֿ�2 
   end
    
    
% sv1(1)=c_num+1
for t = 2:tmax
    if min(rd1(:,1))<100
    if xv1(t)==0
%ȥȡ�� 
       [~,es1]=min(abs(rd1(:,1)-sv1(t-1)));
       tmov = abs(rd1(es1,1)-sv1(t-1))*1;
          
        xv1(t:tmov+t) = 1;
          
           if sv1(t-1)<=rd1(es1,1)
           sv1(t:tmov+t) = sv1(t-1):rd1(es1,1);
           else
              sv1(t:tmov+t)=sort(rd1(es1,1):sv1(t-1),'descend') ;
           end
           %����ȡ��
           xv1(tmov+t+1:tmov+t+1+2)=3;
           sv1(tmov+t+1:tmov+t+1+2)=rd1(es1,1);
            tb = tmov+t+1+2;
         %ȥ�ͻ�
           ta = abs(rd1(es1,1)-rd1(es1,2));

            xv1(tb+1:tb+ta)=2;
           
            if rd1(es1,1)<=rd1(es1,2)
           sv1(tb:tb+ta) = rd1(es1,1):rd1(es1,2);
           else
                sv1(tb:tb+ta)=sort(rd1(es1,2):rd1(es1,1),'descend') ;
            end
           %���ڷŻ�
           xv1(tb+ta+1:tb:tb+1+ta+2)=3;
           sv1(tb+ta+1:tb:tb+1+ta+2)=rd1(es1,2);
           rd1(es1,1)=1/0;
    end
%     else if xv1(t)==0
%         
%         sv1(t:t+8) = sort(0:8,'descend');
%         break
%         end
%    
     
    end
          
    end
        
%   
for j =2:tmax
   a = abs(sv1(j)-sv1(j-1));
    if a>=2
        if k==1
       tsum1 = ( j+sv1(j-1))*5
        sv1(j:j+sv1(j-1))=sort(0:sv1(j-1),'descend');
        break
        else
            tsum2 = ( j+sv1(j-1))*5
             sv1(j:j+21-sv1(j-1))=sort(sv1(j-1):21,'descend');
             break
        end
       
    end
    
end


t=1:tmax;
t = t.*5;
plot(t,sv1(1:tmax),'r*')
  hold on  
    
    
   
end




