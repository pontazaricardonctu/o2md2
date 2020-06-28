function useExample(caseValue)
%% Load library (Do not modify)

addpath(genpath('o2md2 library - standalone/sessions'));  %We add the path to the sessions

%% Examples set up (Do not modify)

    switch(caseValue)
    case '32-bytes'
        setSession_0032bytes()
    case '64-bytes'
        setSession_0064bytes()
    case '128-bytes'
        setSession_0128bytes()
    case '256-bytes'
        setSession_0256bytes()
    case '512-bytes'
        setSession_0512bytes()
    case '1024-bytes'
        setSession_1024bytes()
    case 'none'
        %No example is loaded
    otherwise
        warning('useExample error: Undefined case.')
        clearvars -global m b_tilde r %Clear global variables
        clearvars -global f a_tilde p_1 
        clearvars -global p_2 f_p1 f_p2
        return;
    end

end