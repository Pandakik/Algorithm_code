plot(1:10.08,2*ones(1,size(1:10.08,2)),'b')
hold on
text(1,2,'AGV1��ʼ��������') ;
text(10.08,2,'AGV1�����������') ;
text(10.08,1,'AGV1����ά��') ;
plot(10.08,1,'*','markersize',8)
hold on
plot(1,2,'b*','markersize',8)


plot(1:28,3*ones(1,size(1:28,2)),'r')
text(1,3,'AGV2��ʼ��������') ;
text(28,1,'AGV2����ά��') ;
plot(28,1,'r*','markersize',8)
hold on
plot(1,3,'*','markersize',8)

hold on
plot(28:33,1*ones(1,size(28:33,2)),'r')
plot(28:33,3*ones(1,size(28:33,2)),'b')
plot(10.08:28,1*ones(1,size(10.08:28,2)),'b')
text(28,3,'AGV1���AGV2δ�������') ;
plot(28,3,'b*','markersize',8)
text(33,0,'AGV1��AGV2������ɣ����زֿ�ά�޵ȴ���һ������') ;
plot(33,0,'g*','markersize',8)
xlabel('Time(min)')

plot(33:38,zeros(1,6),'g')

title('AGV1��AGV2�������')