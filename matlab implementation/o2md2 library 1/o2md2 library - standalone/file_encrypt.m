function file_encrypt(m, b_tilde, r, k_pub,p_2,plainTextFileName, cipherTextFileName)

%% Plaintext read (Do not modify)

    %Read plaintext file and split into arrays of size m.

    str = sprintf('Loading plaintext from file: %s ...\n',plainTextFileName);
    disp(str)
    
    fileId_plainTextFile=fopen(plainTextFileName,'r');
    plainTextRaw = fscanf(fileId_plainTextFile,'%c');
    fclose(fileId_plainTextFile);
    plainTextAscii = double(plainTextRaw);      % Conver plaintext into ASCII code.
    
    
    plainTextAscii = [84, 104, 105, 115, 32, 105, 115, 32, 97, 32, 109, 105, 100, 100, 108, 101, 32, 115, 105, 122, 101, 32, 109, 101, 115, 115, 97, 103, 101, 46];
    
    
    plainTexts = vec2mat(plainTextAscii,m);     % Split plaintext into arrays of size m.
    cipherTexts = zeros(size(plainTexts));      % Buffer to load the ciphertext
    
    str = sprintf('Loaded!\n');
    disp(str)
    
    str = sprintf('Length of plaintext: %d characters.\n',size(plainTextRaw,2));
    disp(str)
    
    if(size(plainTextRaw,2)>20)
        str = sprintf('First 20 characters: %s\n',plainTextRaw(1:20));
        disp(str)
    end
    
%% Ciphertext creation (Do not modify)
    
    str = sprintf('Encrypting ...\n');
    disp(str)

    for i=1:size(plainTexts,1)

        plainTextArray = plainTexts(i,1:m);
        cipherTextArray = algorithm_encryption(k_pub,p_2,b_tilde,r,plainTextArray); %Encryption of plaintext
        
        cipherTexts(i,:)=cipherTextArray;
    end
    
    str = sprintf('Encrypted!\n');
    disp(str)

%% Ciphertext saving (Do not modify)

    str = sprintf('Saving ciphertext into file: %s ...\n',cipherTextFileName);
    disp(str)

    fileId_cipherTextFile = fopen(cipherTextFileName,'w');   % Open (or create) ciphertext file.
    
    for i=1:size(plainTexts,1)
        for j=1:m
            fprintf(fileId_cipherTextFile,'%d',cipherTexts(i,j));
            if(j<m)
                fprintf(fileId_cipherTextFile,' '); % Save ciphertext block to ciphertext file
            end
        end
        
        fprintf(fileId_cipherTextFile,'\n');
    end
    
    fclose(fileId_cipherTextFile);
    
    str = sprintf('Ciphertext saved!\n');
    disp(str)

end