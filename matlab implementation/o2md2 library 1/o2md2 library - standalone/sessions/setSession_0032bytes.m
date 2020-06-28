function setSession_0032bytes()

%% Retrieve global variables (Do not modify)

global m b_tilde r
global f a_tilde p_1 
global p_2 f_p1 f_p2

%% Variables assignation (Do not modify)

disp('=== Example: 32 bytes ===')

% Session variables

disp('--- Session variables S=(m,b_tilde,r) ----')
m = 32
b_tilde = 41
r= 149

% Inputs and inverses
disp('--- Private key K_priv=(f,p_1,a_tilde) ---')
f=[100 81 105 100 27 20 150 26 5 85 133 101 29 56 70 148 24 129 97 57 29 65 73 19 89 34 58 88 38 44 93 40]

p_1=131
a_tilde = 31

p_2=5328047

f_p1=[121 48 52 121 32 129 76 13 89 72 49 114 112 82 23 85 118 28 61 108 125 10 81 16 116 125 7 115 0 69 17 41 ];
f_p2=[3159809 5008926 256539 1654051 2412107 4125178 1218423 4937728 3369294 4481819 4587015 1061251 2226737 317337 1533400 1081615 3823218 1462581 4639609 3850791 1522454 43523 3752185 72822 41432 1203737 1998695 2617828 372928 3086844 1246715 3917220];


%% Verification of variables (Do not modify)

%Check variables sizes

if(size(f,2)~=m)
    warning('setSession_0032bytes error: Instance f is not of size m.')
    return;
end

if(size(f_p1,2)~=m)
    warning('setSession_0032bytes error: f_p1 is not of size m.')
    return;
end

if(size(f_p2,2)~=m)
    warning('setSession_0032bytes error: f_p2 is not of size m.')
    return;
end

if(p_2<max(p_1*m*a_tilde*b_tilde,m*max(f)*r))
    warning('setSession_0032bytes error: Invalid p_2 detected.')
    return;
end
    
end