function y=smyx(n)
x = zeros(n,n);
k=10
while(k)
for i = 1:n
    for j = 1:n
        if rand(1)<0.5
            x(i,j)=1
    end
    end
end
for i=2:n
    for j = 2:n
         xs = x(i-1,j)+x(i+1,j)+x(i,j+1)+x(i,j-1)+x(i-1,j-1)+x(i+1,j+1);
         if x(i,j)==1
             if xs~=2||xs~=3
                 break
             end
         else
             if xs ==3
                 break
             end
           
         end  
        
    end
end
k=k-1
end