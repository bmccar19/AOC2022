x = readlines( "D://repos//julia//AdventOfCode2022//Day4//Day4.txt" );

function GetAssignments( thisStr::AbstractString )
    halves = split( thisStr, "," );
    firstRangeStr = split( halves[1], "-" );
    secondRangeStr = split( halves[2], "-" );
    firstRange = parse(Int64,firstRangeStr[1]):1:parse(Int64,firstRangeStr[2]);
    secondRange = parse(Int64,secondRangeStr[1]):1:parse(Int64,secondRangeStr[2]);

    return firstRange, secondRange;
end

function AssignmentCompare( r1::AbstractRange, r2::AbstractRange )
    if ( ( r1[1] <= r2[1] && r1[end] >= r2[end] ) || ( r2[1] <= r1[1] && r2[end] >= r1[end] ) )
        return 1
    else
        return 0
    end
end

function AssignmentOverlap( r1::AbstractRange, r2::AbstractRange )
    

    val = 0;

    if ( ( r1[1] <= r2[1] && r1[end] >= r2[end] ) || ( r2[1] <= r1[1] && r2[end] >= r1[end] ) )
        val = 1
    else
        
        for r in r1
            if ( sum( ( r .- r2 ) .== 0 ) >= 1 )
                val = 1;
            end
        end

    end

    return val;

end

function CheckAll( x::Vector{String} )

    totVal = 0;
    for thisX in x
        rs = GetAssignments( thisX );
        totVal = totVal + AssignmentCompare( rs[1], rs[2] );
    end
    return totVal
end

function CheckAllOverlap( x::Vector{String} )

    totVal = 0;
    for thisX in x
        rs = GetAssignments( thisX );
        totVal = totVal + AssignmentOverlap( rs[1], rs[2] );
    end
    return totVal
end