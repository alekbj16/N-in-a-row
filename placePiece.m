%place piece places the piece in the bottom avalibale slot of the given
%colum, and marks the colum with either a 1 or a 2, depending on the player
function board = placePiece(board, column, player)
[heigth,~] = size(board);
if board(heigth, column) == 0 %checking if the column is empty
    board(heigth, column) = player; %placing either 1 or 2
else     
    rowN=find(board(:,column), 1);% search for the "upper most" row with a non-zero element %give the first nonZero
    board(rowN-1,column)=player; %placing 1 or 2 on the row above
end
end
