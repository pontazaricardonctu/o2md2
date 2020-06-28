function result = inverse_p_array(f)
%% Inverse calculator (Do not modify)
    sizeOfF=size(f,2);

    %verify correct size
    if (sizeOfF <=1)
        disp('Vectors size not enough');
        return;
    end

    %create identity element
    e=zeros(1,sizeOfF);
    e(1)=1;

    M=rotationMatrix(f);

    %tic
    M_inv=inv(sym(M));
    %toc
    result=sym(e*M_inv);
end

