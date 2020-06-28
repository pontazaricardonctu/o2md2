function [randomization] = algorithm_Randomization(g,c,a,randVect)

    %% Input verification (Do not modify)
    if isempty(randVect)
        % if randVect does not exists, we construct it.
        randVect = randi(a,1,length(g))-1
    end

    if(max(randVect)>a)
        warning('algorithm_Randomization error: randVect has entries bigger than a')
        return;
    end

    %% Randomization (Do not modify)

    randomization = c*crossedConvolution(g,randVect,1);

end

