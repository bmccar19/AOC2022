x = readlines( "D://repos//julia//AdventOfCode2022//Day6//Day6.txt" );

function processPacket( x::AbstractString )
    
    val = 0;
    for i = 14:length(x)
        if ( length( unique( x[i-13:i] ) ) == 14 )
            val = i;
            break;
        end;
    end
    return val;
end
