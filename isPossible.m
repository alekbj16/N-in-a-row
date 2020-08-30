function answer = isPossible(board,column)
[~,width] = size(board);
output = 0;
if ceil(column) == column %checking if the column is an integer
    if(column <= width && column >= 1) %checking if column is within the board
        if(any(board(:,column) == 0)) %checking for free space in the column
            output = 1;
        end
    end
end
answer = output;
end