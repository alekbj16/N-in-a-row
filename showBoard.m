function showBoard(board)
%showBoard(board) displays the game board including the pieces placed.
%Player 1's pieces are represented by red coins.
%Player 2's pieces are represented by yellow coins. 
%Empty spaces are shown as black circles
%% obtaining some initial values
[rows, columns]  = size(board);
places = rows*columns; %number of possible places for coins on the board
halfPlaces = places/2;
%% setting up information storage arrays
%player 1 - red
        %if the number of places is uneven, 
        %player 1 can have one more piece board than player 2. 
        %For this reason ciel is used here
    xRed = zeros([1, ceil(halfPlaces)]);
    yRed = zeros([1, ceil(halfPlaces)]);
%player 2 - yellow
    xYellow = zeros([1, floor(halfPlaces)]);
    yYellow = zeros([1, floor(halfPlaces)]);
%empty places
    xEmpty = zeros([1, places]);
    yEmpty = zeros([1, places]);    
%% giving initial values for some counters:
    redCounter = 1;
    yellowCounter = 1;
    emptyCounter = 1;
%% looking at the matrix and extracting info about the gameboard
% this section stores the coordinates of coins/empty places in the
% appropriate information storage arrays. 
for r = 1:1:rows %loop through all rows
    for c = 1:1:columns %loop through all columns in a row
        value = board(r, c);
        % if value -1  / 0/ 1
        if value == 0 
            xEmpty(emptyCounter) = c;
            yEmpty(emptyCounter) = rows + 1 - r;
            emptyCounter = emptyCounter + 1;
        elseif value == 1
            xRed(redCounter) =  c;
            yRed(redCounter) = rows + 1 - r;
            redCounter = redCounter + 1;        
        elseif value == 2 
            xYellow(yellowCounter) =  c;
            yYellow(yellowCounter) = rows + 1 - r;
            yellowCounter = yellowCounter + 1;             
        else
            fprintf('Something went wrong \n') 
        end  
    end
end
%% removing unused spaces from the information arrays
% remove zeros, subtract 0.5
%keep the places that differ from zero
xEmpty = xEmpty(xEmpty ~= 0);
yEmpty = yEmpty(yEmpty ~= 0);
xRed = xRed(xRed ~= 0);
yRed = yRed(yRed ~= 0);
xYellow = xYellow(xYellow ~= 0);
yYellow = yYellow(yYellow ~= 0);
%% outputting a figure
coinSize = 800;

title('The current board looks like')
box on
hold on 
xlim([0.5 (columns+0.5)]) %some space to the left and to the right
ylim([0.5 (rows+0.5)]) %some space to the top and the bottom
xticks(0:1:columns) %how to mark the values on the x axis
yticks(0:1:rows) %how to mark the value on the y axis
scatter(xEmpty,yEmpty,coinSize,'MarkerFaceColor','none','MarkerEdgeColor',	'black','LineWidth',1)
scatter(xRed,yRed,coinSize,'MarkerFaceColor','red','MarkerEdgeColor',	'black')
scatter(xYellow,yYellow,coinSize,'MarkerFaceColor','yellow','MarkerEdgeColor',	'black')
box off
hold off %the next time we draw, we draw everything again

end