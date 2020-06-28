function [f_p1_local,f_p2_local,k_pub] = algorithm_keyGeneration(m,b_tilde,r,f,p_1,a_tilde,exampleCase)
    %% Find prime p_2 (Do not modify)

    global f_p1 f_p2
    global p_2

    if(strcmp(exampleCase,'none'))  % Only calculate for custom cases (not library examples)
        b=max(f);
        %p_2_local=algorithm_suggestPrimes(p_1,m,a_tilde,b_tilde,b,r)    % Gets the first possible value for p2. Note: Any prime greater than p_2 also works.
        p_2_local = 59932501;
    else
        p_2_local=p_2; % Use global values (library example)
    end

    %% Inverses generation (Do not modify)

    if(strcmp(exampleCase,'none'))  % Only calculate for custom cases (not library examples)
        %f_p1_local=inverse_p_array_modulo(f,p_1)     % Inverse of f modulo p_1
        %f_p2_local=inverse_p_array_modulo(f,p_2_local)     % Inverse of f modulo p_2
        
        f_p1_local=[62    38   127   128    64    68    64    17    27   115    12    85    33    59    40    83    94   115    15   124    78   117    69    12  109    77   127    29  100   79 ]
        f_p2_local=[28482336    40320689    14603867     9789558    20305297    22044053     7307698    28476566    25962598    31354254    24993586  21228786    40968676    37274924     4211261    55618285    32078823    28017282    36873795    57355078    15242822    30629128    59330103    16915852  12304881    19320588    52132283    16151942  3012913 48364311]
    else
        f_p1_local = f_p1;  % Use global values (library example)
        f_p2_local = f_p2;  % Use global values (library example)
    end

    %% Public key generation (Do not modify)

    k_pub = algorithm_keyRefresh(f_p2_local,p_1,p_2_local,a_tilde); %% For testing mode, please modify the values inside the algorithm_keyRefresh function in the "Testing environment"

end

