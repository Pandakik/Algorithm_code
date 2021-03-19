%data2 = xlsread('F:\潘宗勇PANZONGYONG\2020暑期冲啊\数学建模冲啊\集训\第四个任务\结果\第一问.xlsx')
data2=[1	18	21	20	19	26	27	30	22	24	25	29	23	5	4	6	11	14	17	28	16	13	9	12	15	7	8	10	2	3	1]
datad = xlsread('F:\潘宗勇PANZONGYONG\2020暑期冲啊\数学建模冲啊\集训\第四个任务\2020杭电大学生数学建模竞赛集训模型4\B题：无线可充电传感器网络充电路线规划\各节点间距离.xlsx');
dis = 0
s = length(data2)-1;
for i = 1:s
   
    n = data2(i)
    n2 = data2(i+1)
    
   dis =  dis +datad(n,n2)
   
end