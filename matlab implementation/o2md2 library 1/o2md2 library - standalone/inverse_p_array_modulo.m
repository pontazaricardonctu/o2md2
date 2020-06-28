function result = inverse_p_array_modulo(f,modulo)
    %% Algebraic inverse calculation (Do not modify)
    
    g=inverse_p_array(f);
    sizeOfG=size(g,2);
    result=zeros(1,sizeOfG);

    for i=1:sizeOfG
        [n,d]=numden(sym(g(i)));
        d_vec=mod(d,modulo);
        %inverse=mulinv(double(d_vec),modulo);
        inverse=mulinv_new(double(d_vec),modulo);
        value=mod(n*inverse,modulo);
        result(i)=value;
    end

end

