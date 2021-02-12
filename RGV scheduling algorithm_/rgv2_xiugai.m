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
                                    tb = tmov+t+1+14;
                                    
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
                               
                                      tmov = abs(sm2(t)-sv2(t-1))*5;
          
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
                                    sm2(tb+1) = -1;

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
                    sm2(t:t+tmov+1)=sma;
                     else
                         tmov = sv2(t-1)-sma;%注意t-1
                    
                    
                    xv2(t:t+tmov)=1;
                    sv2(t:t+tmov)=sv2(t-1):sma;
                    sm2(t:t+tmov+1)=sma;
                         
                     end

                  end
           
           
           
       
             end
       
   end