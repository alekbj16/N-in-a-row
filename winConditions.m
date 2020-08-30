function [ output ] = winconditions( A,W )
%input
%A = [1 2 0 0; 2 2 2 0;0 1 2 0; 0 0 0 0];
dimensions = size(A); 
elements = numel(A); %number of elements in A
N = dimensions(1); %number of rows
M = dimensions(2); %number of columns
%W = 3;

draw = any(any(A == 0)); %number of elements in the matrix that is zero

%winning condition matrices
%winning condition length is determined by W, all B matrices will be WxW
%and filled to be a NxM matrix with 0 columns. To generate and access these
%winning conditions, use a cell array (cell()), then acces it with cell2mat.
L = M-W+1; %additional columns
H = N-W+1; %additional rows
G = H*L; %amount of eye win conditions
B = cell(1, ((2*G)+M*L+N*H)); %main win cell array
C = B;

Beye = eye(W);
k = 1; %win condition index

for h = 1:H %diagonal wins
    for l = 1:L
        b = zeros(N,M);
        b(h:(W+h-1),l:(W+l-1)) = Beye;
        B(k) = {b}; 
        k = k+1;
    end
end



for h = 1:H %flipped diagonal wins
    for l = 1:L
        b = zeros(N,M);
        b(h:(W+h-1),l:(W+l-1)) = Beye;
        B(k) = {flip(b)}; 
        k = k+1;
    end
end



for h = 1:H %column wins
    for m = 1:M 
        b = zeros(N,M);
        b(h:(W+h-1),m) = ones(W,1);
        B(k) = {b};
        k = k+1;
    end
end



for l = 1:L %row wins
    for n = 1:N 
        b = zeros(N,M);
        b(n,l:(W+l-1)) = ones(1,W);
        B(k) = {b};
        k = k+1;
    end
end

%There seems to be some missing value for some of the cells as the board
%becomes increasingly less square (more rectangular), this might be missing
%winning conditions or they might be unnecessary cells.

D = zeros(k-1,1);
E = D;

for K = 1:k-1
    b = cell2mat(B(K));
    c = A.*b;
    C(K) = {c}; %matrix product
    D(K) = sum( sum ( c == b ) ); %win matrix player 1
    E(K) = sum( sum ( (c/2) == b ) ); %win matrix player 2
    win1 = sum( D == elements);
    win2 = sum( E == elements);
end

if win1 == 1
    output = 1;
    
elseif win2 == 1
    output = 2;
elseif draw == 0
    output = -1;
else
    output = 0;
end

    
        
    
