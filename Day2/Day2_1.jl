x = readlines( "D://repos//julia//AdventOfCode2022//Day2//Day2.txt" );

function scoreCalc(p1::AbstractString, p2::AbstractString)
    points = 0;

    # A, X = Rock
    # B, Y = Paper
    # C, Z = Scissors

    # if (p2 == "X");
    #     points = 1;
    # elseif ( p2 == "Y")
    #     points = 2;
    # elseif (p2 == "Z")
    #     points = 3;
    # end



    if ( p1 == "A" )
        if (p2 == "X");
            points = 0 + 3;
        elseif ( p2 == "Y")
            points = 3 + 1;
        elseif (p2 == "Z")
            points = 6 + 2;
        end
    elseif ( p1 == "B")
        if (p2 == "X");
            points = 0 + 1;
        elseif ( p2 == "Y")
            points = 3 + 2;
        elseif (p2 == "Z")
            points = 6 + 3;
        end
        
    elseif ( p1 == "C" )
        if (p2 == "X");
            points = 0 + 2;
        elseif ( p2 == "Y")
            points = 3 + 3;
        elseif (p2 == "Z")
            points = 6 + 1;
        end
    end
    # if ( ( p1 == "A" && p2 == "X" ) || ( p1 == "B" && p2 == "Y" ) || ( p1 == "C" && p2 == "Z") )
    #     points = points + 3;
    # elseif( ( p1 == "A" && p2 == "Y") || ( p1 == "B" && p2 == "Z") || ( p1 == "C" && p2 == "X") )
    #     points = points + 6;
    # end
    return points
    
end

pointsTot = 0;
for i = 1:length(x);
    val = split(x[i], " ");
    points = scoreCalc( val[1], val[2])
    pointsTot = pointsTot + points;
end

println("$pointsTot");







