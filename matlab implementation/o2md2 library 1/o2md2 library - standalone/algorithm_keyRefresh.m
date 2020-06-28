function [k_pub] = algorithm_keyRefresh(f_p2,p_1,p_2,a_tilde)
    %% Ephemeral array creation (Do not modify)

    k_e = randi(a_tilde,1,length(f_p2))-1;

    %% Testing environment (Modifiable)
    % If needed to replicate the key refresh output multiple times, uncomment
    % the following line:

    % ============== MODIFY BEGIN ==============

    %k_e = [9,6,64,95,113,15,69,57,1,41,19,96,37,64,20,73,32,79,84,91,54,10,27,111,18,100,65,121,9,54]
    k_e = [13,117,0,94,99,105,10,48,31,97,52,111,22,32,17,16,106,70,67,17,104,75,42,62,49,9,29,15,22,29]
    
    %k_e = [98,83,38,114,4]

    % ============== MODIFY END ==============

    % Keep in mind that:
    % 1. k_e's dimension and f_p2's dimension must match.
    % 2. k_e's can only have values between 0 and a_tilde.


    %% Input verification (Do not modify)

    if ~(isempty(k_e))  %Only check when the ephemeral key is not null

        if(size(f_p2,2)~=size(k_e,2))
            warning('algorithm_keyRefresh error: Ephemeral key k_e dimension mismatch')
            return;
        end
    
        if(max(k_e)>a_tilde)
            warning('algorithm_keyRefresh error: Ephemeral key k_e has entries bigger than a_tilde')
            return;
        end
    end

    %% Key refresh (Do not modify)

    k_pub=mod(algorithm_Randomization(f_p2,p_1,a_tilde,k_e),p_2);

end

