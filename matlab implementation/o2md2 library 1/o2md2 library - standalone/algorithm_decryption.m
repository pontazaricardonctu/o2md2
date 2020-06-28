function decipheredTextArray = algorithm_decryption(f,p_1,f_p1,p_2,cipherTextArray)
    %% Decryption (Do not modify)

    cipherTextArray
    
    M0=mod(crossedConvolution(f,cipherTextArray,1),p_2)
    
    M1=mod(M0,p_1)
    
    decipheredTextArray=crossedConvolution(f_p1,M1,p_1)


end