x = readlines( "D://repos//julia//AdventOfCode2022//Day5//Day5.txt" );

function parseBoxInfo( x )

    boxOrders = String[];

    ids = [2, 2+4, 2+4*2, 2+4*3, 2+4*4, 2+4*5, 2+4*6, 2+4*7, 2+4*8]
    
    thisStr = "";
    for i = 1:9
        thisStr = "";
        for j = 1:8;
            if (x[j][ids[i]] != ' ' )
                thisStr = x[j][ids[i]] * thisStr;
            end
        end
        push!(boxOrders,thisStr);
    end

    startLoc = [];
    endLoc = [];
    numOfBoxes = [];

    for i = 11:length(x);
        thisStr = split( x[i], " " );
        push!( numOfBoxes, parse(Int64, thisStr[2] ) );
        push!( startLoc, parse(Int64, thisStr[4] ) );
        push!( endLoc, parse(Int64, thisStr[6] ) );
    end


    
    return boxOrders, numOfBoxes, startLoc, endLoc;
    
end


function moveBoxes( initBoxOrders, numOfBoxes, startLoc, endLoc );
    boxOrders = initBoxOrders;
    for i = 1:length(boxOrders);

        boxesToMove = boxOrders[startLoc[i]][end-(numOfBoxes[i]-1):end];
        boxOrders[startLoc[i]] = boxOrders[startLoc[i]][1:end-numOfBoxes[i]];
        boxOrders[endLoc[i]] = boxOrders[endLoc[i]] * reverse(boxesToMove);

    end

    return boxOrders;
end;