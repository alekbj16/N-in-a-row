function [M, turn] = initializeBoard(N, K)
%M should be a matrix with N +3 columns and N +2 rows
%For each element, 0 means an empty slot,
%1 means a yellow piece by player 1 and
%2 means a red piece by player 2.
%
%turn should either be 1 or 2 and
%indicates which player can start.
%
%The board M should be ?lled with K yellow pieces and red pieces,
%added randomly (one after the other) with a normal distribution,
%with mean at the centre of the board and
%standard deviation equal to an eight of the board width.
rows  = N+2;
columns = N+3;
board = zeros(rows, columns); %empty board

%add K red pieces and K yellow pieces
%add K red pieces and K yellow pieces
mean = columns/2;
sigma = columns/8;
colour = ceil(2*rand(1)); % find starting colour for the initial pieces
for p = 1:(2*K)
    placed = 0;% the piece p is not yet placed
    while placed == 0
        chosenCol = round(sigma.*randn(1) + mean); 
            %candidate column to place the piece, chosen with normal 
            %distibution with the determined mean (middle of board) 
            %and standard deviation (An eigth of the board width)
        if chosenCol >= 1 && chosenCol <= columns 
            %if the chosen column is part of the board
            
            %look for (lowest) emty place in the chosen column:
            testRow = rows; %row of place in column that will be tested,
                %starts at the lowest place in column.
            while testRow >= 1 && placed == 0
                if board(testRow,chosenCol) == 0
                    board(testRow,chosenCol) = colour;
                    placed = 1;
                else %tested place in board is not empty
                    testRow = testRow - 1;
                end
            end
            
            
        else % the chosen column does not exist in the game
          placed = 0;  
        end
            
    end
    
    %change colour for the next piece
    if colour == 1
        colour = 2;
    else %colour == 2
        colour =  1;
    end
end

M = board; %board with K red and K yellow starting pieces.

turn = ceil(2*rand(1)); % find starting player
end