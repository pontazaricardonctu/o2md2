function file_decrypt(m,f,p_1,p_2,f_p1,cipherTextFileName, decipheredTextFileName)

%% Ciphertext read (Do not modify)
    
    %Read ciphertext file and split into arrays of size m.
    
    str = sprintf('Loading ciphertext from file: %s ...\n',cipherTextFileName);
    disp(str)
    
    fileId_cipherTextFile = fopen(cipherTextFileName,'r');
    cipherTextRaw = fscanf(fileId_cipherTextFile,'%d')';
    fclose(fileId_cipherTextFile);
    
    cipherTexts = vec2mat(cipherTextRaw,m);  %Split plaintext into arrays of size m.
    decipheredTexts = zeros(size(cipherTexts));
    
    str = sprintf('Loaded!\n');
    disp(str)
    
%% Deciphered text creation (Do not modify)
    
    str = sprintf('Decrypting ...\n');
    disp(str)

    for i=1:size(cipherTexts,1)
        
        cipherTextArray = cipherTexts(i,1:m);
        decipheredTextArray = algorithm_decryption(f,p_1,f_p1,p_2,cipherTextArray); % Decryption of ciphertext
        
        decipheredTexts(i,:)=decipheredTextArray;
    end
    
    str = sprintf('Decrypted!\n');
    disp(str)
    
%% Deciphered text save (Do not modify)

    str = sprintf('Saving deciphertext into file: %s ...\n',decipheredTextFileName);
    disp(str)

    fileId_decipheredTextFile = fopen(decipheredTextFileName,'w');
    
    for i=1:size(cipherTexts,1)
        for j=1:m
            fprintf(fileId_decipheredTextFile,'%c',char(decipheredTexts(i,j)));
        end
    end
    
    fclose(fileId_decipheredTextFile);
    
    str = sprintf('Deciphered text saved!\n');
    disp(str)
end