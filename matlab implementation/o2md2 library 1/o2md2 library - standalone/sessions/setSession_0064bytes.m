function setSession_0064bytes()

%% Retrieve global variables (Do not modify)

global m b_tilde r
global f a_tilde p_1 
global p_2 f_p1 f_p2

%% Variables assignation (Do not modify)

disp('=== Example: 64 bytes ===')

% Session variables

disp('--- Session variables S=(m,b_tilde,r) ----')
m = 64
b_tilde = 41
r= 149

% Inputs and inverses
disp('--- Private key K_priv=(f,p_1,a_tilde) ---')
f=[102 60 56 149 6 133 137 120 15 40 51 102 21 109 17 99 75 117 108 136 134 51 105 30 5 112 76 72 136 92 93 129 121 87 28 36 133 5 74 26 147 107 76 71 9 103 7 11 79 15 123 123 109 23 99 78 146 98 121 69 65 124 13 20]

p_1=131
a_tilde = 31

p_2=10656067

f_p1=[96 111 70 66 49 111 25 8 40 96 2 127 67 64 66 16 82 106 97 55 38 78 7 121 44 27 125 50 126 107 41 3 74 98 123 93 29 130 31 105 49 55 71 118 50 11 34 85 118 66 121 29 127 60 56 19 27 93 96 63 14 110 44 127];
f_p2=[2899501 7703509 5683162 7517970 8284596 8713790 10008557 1182950 2311727 118004 4392531 7568665 9274740 659438 3152218 6826122 10529435 979840 826962 3749316 1966746 6604374 2102530 3629698 5766127 7934623 8949560 1119080 4629138 5781992 2387740 1130336 5883666 1974597 7598691 6678545 7484045 5333674 3690634 7641646 494063 2223806 9461149 6032437 168645 3970872 10473445 6817157 8936076 319608 8006544 2007550 2940046 7272310 5717849 3683815 495266 8527664 8459989 7814957 355974 693593 2708440 5534939];


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