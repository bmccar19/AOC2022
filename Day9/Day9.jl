x = readlines( "D://repos//julia//AdventOfCode2022//Day9//Day9.txt" );


function parseDirections( x )

    moveDir = String[];
    moveNum = zeros(Int64, length(x) );
    i = 1;
    for thisX in x
        thisLine = split( thisX, " ");
        push!( moveDir, thisLine[1] );
        moveNum[i] = parse(Int64, thisLine[2] );
        i = i + 1;
    end;

    return moveDir, moveNum;

    
end


function moveHead( hLoc, dir );

    if ( dir == "U" );
        hLoc[1] = hLoc[1] + 1;
    elseif ( dir == "D" )
        hLoc[1] = hLoc[1] - 1;
    elseif ( dir == "L")
        hLoc[2] = hLoc[2] - 1;
    elseif ( dir == "R" )
        hLoc[2] = hLoc[2] + 1;
    end;

    return hLoc;
end;

function moveTail( tLoc, dir );

    if ( dir == "U" );
        tLoc[1] = tLoc[1] + 1;
    elseif ( dir == "D" )
        tLoc[1] = tLoc[1] - 1;
    elseif ( dir == "L")
        tLoc[2] = tLoc[2] - 1;
    elseif ( dir == "R" )
        tLoc[2] = tLoc[2] + 1;
    else;
        tLoc[2] = tLoc[2] + 0;
    end;

    return tLoc;

end;

function visited( tLoc, tLocRows, tLocCols )

    flag = false;
    i = 1;
    for x in tLocRows
        if (  tLoc[1] == x ) && ( tLoc[2] == tLocCols[i] )
            flag = true;
        end
        i = i + 1;
    end

    return flag;      

end;

function processMoves( moveDirs, moveNums );

    hLoc = [1,1];
    tLoc = [1,1];
    tLocRow = [];
    tLocCol = [];

    push!(tLocRow, tLoc[1]);
    push!(tLocCol, tLoc[2]);

    i = 1;
    for thisNum in moveNums

        for j = 1:thisNum

            hLoc = moveHead( hLoc,moveDirs[i]);

            if ( hLoc[1] - tLoc[1] ) > 1
                tLoc[1] = hLoc[1]-1;
                tLoc[2] = hLoc[2];
            elseif ( hLoc[1] - tLoc[1] ) < 1
                tLoc[1] = hLoc[1]+1;
                tLoc[2] = hLoc[2];
            elseif ( hLoc[2] - tLoc[2] ) > 1
                tLoc[1] = hLoc[1];
                tLoc[2] = hLoc[2]-1;
            elseif ( hLoc[2] - tLoc[2] ) < 1
                tLoc[1] = hLoc[1];
                tLoc[2] = hLoc[2]+1;
            end

                
            if ( visited(tLoc, tLocRow, tLocCol) == false )
                push!(tLocRow, tLoc[1]);
                push!(tLocCol, tLoc[2]);
            end;
        end
        i = i + 1;

    end
    return tLocRow, tLocCol;

end;

hLoc = (1,1);
tLoc = (1,1);




    