clear all
close all
clc;
%% Take user input of number of rows and columns. 
disp('Hello! Welcome to the game');
N = ceil(abs(input('Enter board width: '))); %round up the absolute value of the input 
while (N <3) || (floor(N) ~= N) %if N is smaller than 3 or N should be an integer. 
    prompt = 'Length needs to be greater than 3 and an integer, try again:';
    N = input(prompt);
end
M = ceil(abs(input('Enter board heigth: '))); 
while (M <3) || (floor(M) ~= M)
    prompt = 'Height needs to be greater than 3 and an integer, try again:';
    M = input(prompt);
end
W = ceil(abs(input('Enter winning condition: ')));
while (W > N) || (W > M) || (floor(W) ~= W) || (W < 2)
    prompt = 'winning condition cannot exceed minimum dimension and a positive, non-zero integer,\n try again:';
    W = input(prompt);
end
%% Setting up an empty board. 
Board = zeros(M,N); %zeros(height,width)
turn = 1; %the first player to have a turn is player 1. 
%% visualising in console
disp('Lets start playing')



%% Play
win = winconditions(Board, W); %checking for victory
while(win == 0) %if the board is not full and no player has won
    showBoard(Board);
    
    playerString = num2str(turn);
    promptArray = ['Player ', playerString, ', it is your turn; please choose a column to place your piece: '] ;
    prompt = join(promptArray);
    x = input(prompt);
    possible = isPossible(Board, x); %checking if the column is possible
    while (possible ~= 1) %making the player give a new input %if possible is not 1
        promptArray = ['Player ', playerString, ', this column is not possible. \n please try again. Choose a column to place your piece: '] ;
        prompt = join(promptArray);
        x = input(prompt);
        possible = isPossible(Board, x); %checking if new input is valid and column is avalibale
    end
    
    
    Board = placePiece(Board, x, turn); %placing the piece in the selected column
    
    win = winconditions(Board, W); %checking for win
    if win == 0
        if turn == 1
            turn = 2;
        else
            turn = 1;
        end
    elseif win == 1 %player 1 wins
        disp('Congratulations player 1! You have won the game!')
    elseif win == 2 %player 2 wins
        disp('Congratulations player 2! You have won the game!')
    else %in this case, win = -1
        disp('Sorry, the board is full. No one won. :(')
    end
    
    
end
showBoard(Board);