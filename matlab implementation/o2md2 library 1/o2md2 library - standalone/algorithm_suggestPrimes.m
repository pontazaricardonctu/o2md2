function [p_2] = algorithm_suggestPrimes(p_1,m,a_tilde,b_tilde,b,r)

    %% Prime p_2 calculation (Do not modify)

    candidate1=p_1*m*a_tilde*b_tilde
    candidate2=m*b*r

    p2_lowerBound=max(candidate1,candidate2);   % We find the max between p1*m*a1*b1 and m*b*r
    list=primes(p2_lowerBound);

    list2=primes(2*p2_lowerBound);     % There will be at least one new prime because of Bertrand's postulate

    positionOfLastInvalidPrime=size(list,2);    % list2 will have available values for p2 after position positionOfLastInvalidPrime.

    p_2=list2(positionOfLastInvalidPrime+1);     % We pick the next prime after max(p1*m*a1*b1, m*b*r)

end

