function result = mulinv_new(f,m)
sizeOfF=size(f,2);
h=zeros(1,sizeOfF);
f=mod(f,m);

for i=1:sizeOfF
    for j=1:m-1
        number=mod(f(i)*j,m);
        if number==1
            h(i)=j;
            break;
        end
    end
end

result=h;
end

