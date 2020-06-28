function cipherTextArray = algorithm_encryption(k_pub,p_2,b_tilde,r,plainTextArray)

    %% Ephemeral array creation (Do not modify)
    
    %k_e2=randi(b_tilde,1,length(k_pub))-1;

    %% Testing environment (Modifiable)
    % If needed to replicate the encryption output multiple times, uncomment
    % the following line:

    % ============== MODIFY BEGIN ==============

    %k_e2 = [50,6,110,115,59,59,41,109,45,13,95,47,29,49,11,16,114,116,70,7,28,43,100,1,5,20,79,89,79,55]
    %k_e2 = [66,36,90,23,83,22,44,76,95,9,113,94,59,53,54,37,62,62,99,96,78,46,99,65,42,114,106,67,75,71]
    %k_e2 = [25,36,57,28,103,23,27,20,27,53,37,112,52,22,110,119,53,13,31,49,72,31,73,86,27,14,36,38,51,61]
    k_e2 = [10,32,97,3,113,89,59,70,28,55,117,66,63,28,59,76,82,48,44,120,4,107,111,97,12,31,40,82,16,87]
    
    %k_e2=[52,45,91,95,22]
    plainTextArray

    % ============== MODIFY END ==============

    % Keep in mind that:
    % 1. k_e2's dimension and k_pub's dimension must match.
    % 2. k_e2's can only have values between 0 and b_tilde.


    %% Input verification (Do not modify)

    if(size(k_pub,2)~=size(k_e2,2))
        warning('algorithm_encryption error: Ephemeral key k_e2 dimension mismatch')
        return;
    end
    
    if(max(k_e2)>b_tilde)
        warning('algorithm_encryption error: Ephemeral key k_e2 has entries bigger than b_tilde')
        return;
    end
    
    if(max(plainTextArray)>r)
        str = sprintf('algorithm_encryption error: Detected ASCII code in the plaintext greater than r. Please use r > %d',max(plainTextArray));
        warning(str)
        return;
    end
    
    %% Encryption (Do not modify)
    
    R=crossedConvolution(k_e2,k_pub,1)
    cipherTextArray=mod(R+plainTextArray,p_2)

end

