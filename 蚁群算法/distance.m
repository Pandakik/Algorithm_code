d = zeros(30,30)
for i = 1:30
    for j = i+1:30
        d(i,j)=6371004*acos((sin(y(i)*pi/180)*sin(y(j)*pi/180)+cos(y(i)*pi/180)*cos(y(j)*pi/180)*cos((x(j)-x(i))*pi/180)))
    end
end

d=d+d';