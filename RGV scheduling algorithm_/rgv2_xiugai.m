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
                                    tb = tmov+t+1+14;
                                    
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
                               
                                      tmov = abs(sm2(t)-sv2(t-1))*5;
          
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
                                    sm2(tb+1) = -1;

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
                    sm2(t:t+tmov+1)=sma;
                     else
                         tmov = sv2(t-1)-sma;%ע��t-1
                    
                    
                    xv2(t:t+tmov)=1;
                    sv2(t:t+tmov)=sv2(t-1):sma;
                    sm2(t:t+tmov+1)=sma;
                         
                     end

                  end
           
           
           
       
             end
       
   end