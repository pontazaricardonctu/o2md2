%% Define variables and load library (Do not modify)

clc;clear;clearvars;  %Clears screen and previous tests
format long 
pause on

addpath(genpath('o2md2 library - standalone'));  %We add the path to the libraries

global m b_tilde r
global f a_tilde p_1 
global p_2 f_p1 f_p2


%% Case setup (Modifiable)

% - The variable exampleCase determines if the user wants to use an example
% from the library or a custom case. Its valid values are:
%   1. '32-bytes'
%   2. '64-bytes'
%   3. '128-bytes'
%   4. '256-bytes'
%   5. '512-bytes'
%   6. '1024-bytes'
%   7. 'none'

% - Use the 'none' case if you want to set up your own variables in the
% Initial Values section.

% ============== MODIFY BEGIN ==============

exampleCase = 'none';   % User can modify this variable according to the chart above.


% - Names of the files where to read the plaintext, where to save the
% ciphertext and the deciphered text (They need to be in the same
% folder as this file):

plainTextFileName = 'plainText.txt'
cipherTextFileName = 'cipherText.txt'
decipheredTextFileName = 'decipheredText.txt'

% ============== MODIFY END ==============

%% Initial values (Modifiable)

if(~strcmp(exampleCase,'none'))
    useExample(exampleCase) %User is loading an example from the library
else
    
    % ============== MODIFY BEGIN ==============
    
    disp('--- Session variables S=(m,b_tilde,r) ----')

    m=30
    b_tilde=125
    r=130

    disp('--- Private key K_priv=(f,p_1,a_tilde) ---')

    f=abs([835,340,516,452,556,414,811,340,627,497,721,360,871,396,636,658,675,408,899,407,873,569,724,444,1047,535,726,650,772,474]) %it needs to have m entries.
    
    p_1=131
    a_tilde=122
    
    p_2 = 59932501
    
    %f=[2,81,27,9,3]
    %m=5
    %b_tilde = 120
    %r=120
    %a_tilde = 120
    %p_1=251
    
    
    
    % ============== MODIFY END ==============
    
    if(size(f,2)~=m)    % Check if f has m entries. If not, it cannot be used in this session. Exit.
        warning('Error in size of f')
        return;
    end
end

%% Key Generation (Do not modify)

disp('--- Key generation ---')

% At this point, we have:
%   1. The session variables m,b_tilde,r
%   2. The instance f
%   3. The prime p_1 and positive integer a_tilde.
% We proceed with the key generation

[f_p1,f_p2,k_pub]=algorithm_keyGeneration(m,b_tilde,r,f,p_1,a_tilde,exampleCase);
k_pub   % Display public key


%% Encryption (Do not modify)

disp('--- Encryption ---')
disp(' ')

file_encrypt(m, b_tilde, r, k_pub,p_2,plainTextFileName, cipherTextFileName) % Encrypts plaintext file and saves to the ciphertext file. NOTE: Read and write permissions are needed in the folder.

%% Decryption (Do not modify)

disp('--- Decryption ---')
disp(' ')

file_decrypt(m,f,p_1,p_2,f_p1,cipherTextFileName, decipheredTextFileName)   % Decrypt ciphertext file and saves to the deciphered text file. NOTE: Read and write permissions are needed in the folder.
