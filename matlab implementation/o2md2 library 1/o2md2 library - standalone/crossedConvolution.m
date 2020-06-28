function h = crossedConvolution(f,g,modulo)

%modulo = 1

sizeOfF=size(f,2);
sizeOfG=size(g,2);

if (sizeOfF ~= sizeOfG)
    disp('Vectors need to be of same size');
    return;
end

h=zeros(1,sizeOfF);
hpivot=zeros(1,sizeOfF);

for i=1:sizeOfF
    for j=1:i
        h(i)=h(i)+f(j)*g(i-j+1);
        if i==1
            h(i);
        end
    end
    
    for j=i+1:sizeOfF
        h(i)=h(i)+f(j)*g(sizeOfG+i+1-j);
        if i==1
            h(i);
        end
    end    
end

for i=1:sizeOfF
    if(i==1)
        hpivot(1)=h(sizeOfF);
    else
        hpivot(i)=h(i-1);
    end
end

for i=1:sizeOfF
    h(i)=hpivot(i);
end

if (modulo==1)
    h;
else
    sizeOfH=size(h,2);
    h1=zeros(1,sizeOfH);
    for i=1:sizeOfH
        h1(i)=mod(h(i),modulo);
    end
h=h1;
end

end