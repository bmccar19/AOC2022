x = readlines( "D://repos//julia//AdventOfCode2022//Day7//Day7.txt" );


function parseData( x );

    commands = [];
    fileDic = Dict();

    for i = 1:length(x);
        thisStrArray = split(x[i], " ");

        if ( thisStrArray[2]  == "cd")
            j = 1;
            returnStr = split( x[i+1], " " );
            while ( returnStr[1] != "\$")

                fileDict( returnStr =>  )
            end
        end





            