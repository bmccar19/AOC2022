x = readlines( "D://repos//julia//AdventOfCode2022//Day3//Day3.txt" );

# thisLine = x[1]
# firstHalf = thisLine[1:div(length(thisLine),2)];
#     secondHalf = thisLine[div(length(thisLine),2)+1:length(thisLine)];

function calcPriority( thisLine::AbstractString )

    firstHalf = thisLine[1:div(length(thisLine),2)];
    secondHalf = thisLine[div(length(thisLine),2)+1:length(thisLine)];

    val = 0;
    for i in firstHalf;
        for j in secondHalf;
            if ( i-j == 0 );
                val = calcValue( i );
            end
        end
    end

    return val;

end

function calcPriorityGroup( g1::AbstractString, g2::AbstractString, g3::AbstractString )

    val = 0;
    for i in g1;
        for j in g2;
            for k in g3;
                if ( i == j && i == k  && j == k );
                    val = calcValue( i );
                end
            end
        end
    end

    return val;

end

    
function calcValue( x::Char )
    strThis = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return findfirst(x, strThis);
end

function calcTotalPriorty( x::Vector{String} )
    valTot = 0;
    for thisStr in x
        valTot = valTot + calcPriority( thisStr );
    end
    return valTot;
end;

function calcTotalPriorityGroup( x::Vector{String} )

    valTot = 0;
    for i= 1:3:length(x)
        valTot = valTot + calcPriorityGroup( x[i], x[i+1], x[i+2])
    end
    
    return valTot
end
        