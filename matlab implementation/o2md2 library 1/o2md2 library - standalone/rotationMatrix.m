function M = rotationMatrix(f)
    
    %VERSION 3: [g3 g2 g1 g0] -> [g0 g3 g2 g1; g1 g0 g3 g2; g2 g1 g0 g3; g3 g2 g1 g0]

%    sizeOfF=size(f,2);
%    %verify correct size
%    if (sizeOfF <=1)
%        disp('Vectors size not enough');
%        return;
%    end
%    %rotation matrix
%    M=zeros(sizeOfF);
%    
%    counter = 1;
%    for i=1:sizeOfF
%        for j=1:sizeOfF
%            index=mod((-1)*(j+counter),sizeOfF)+1;
%            M(i,j)=sym(f(index));
%        end
%        counter=counter+1;
%    end
    
    sizeOfF=size(f,2);
    %verify correct size
    if (sizeOfF <=1)
        disp('Vectors size not enough');
        return;
    end
    %rotation matrix
    M=zeros(sizeOfF);

    counter=1;
    for i=1:sizeOfF
        for j=1:sizeOfF
            index=mod(j-counter,sizeOfF);
            if index==0
                index=sizeOfF;
            end
            M(i,j)=sym(f(index));
        end
        counter=counter+1;
        
        if(counter==sizeOfF)
            counter = 0;
        end
    end
end