x = readlines( "D://repos//julia//AdventOfCode2022//Day8//Day8.txt" );

function parseTrees( x );
    m = zeros(Int64, length(x), length(x[1]) )
    for i = 1:length(x);
        for j = 1:length(x[i]);
            m[i,j] = parse(Int64, x[i][j] );
        end
    end;
    return m;
end;

function visibleTrees( m::AbstractMatrix );

    totVis = 0;
    totVis = 99 + 99 + 97 + 97;
    for i = 2:(length(m[:,1])-1)
        for j = 2:(length(m[1,:])-1)
            if ( all(x-> x < m[i,j], m[i,1:j-1]) == true )
                totVis = totVis + 1;
            elseif ( all(x-> x < m[i,j], m[i,j+1:end]) == true )
                totVis = totVis + 1;
            elseif ( all(x-> x < m[i,j], m[1:i-1,j]) == true )
                totVis = totVis + 1;
            elseif ( all(x-> x < m[i,j], m[i+1:end,j]) == true )
                totVis = totVis + 1;
            end
        end
    end

    return totVis;
end

function scenicScore( m::AbstractMatrix )
    scores = [];

    thisScore = 0;
    for i = 2:(length(m[:,1])-1)
        for j = 2:(length(m[1,:])-1)
            leftScore = 0;
            rightScore = 0;
            upScore = 0;
            downScore = 0;
            # left
            ii = j-1;
            while ( 1==1 )
                if ii == 0
                    break
                end;
                if m[i,j] > m[i,ii]
                    leftScore = leftScore + 1;
                end
                if m[i,j] <= m[i,ii] 
                    leftScore = leftScore + 1;
                    break;
                end
                ii = ii - 1; 
            end

            # right
            ii = j+1;
            while ( 1==1 )
                if ii == 100
                    break
                end;
                if m[i,j] > m[i,ii]
                    rightScore = rightScore + 1;
                end
                if m[i,j] <= m[i,ii] 
                    rightScore = rightScore + 1;
                    break;
                end
                ii = ii + 1; 
            end

            # down
            ii = i+1;
            while ( 1==1 )
                if ii == 100
                    break
                end;
                if m[i,j] > m[ii,j]
                    downScore = downScore + 1;
                end
                if m[i,j] <= m[ii,j] 
                    downScore = downScore + 1;
                    break;
                end
                ii = ii + 1; 
            end

            # up
            ii = i-1;
            while ( 1==1 )
                if ii == 0
                    break
                end;
                if m[i,j] > m[ii,j]
                    upScore = upScore + 1;
                end
                if m[i,j] <= m[ii,j] 
                    upScore = upScore + 1;
                    break;
                end
                ii = ii - 1; 
            end
            push!(scores, upScore*downScore*rightScore*leftScore);
            
        end
    end

    return scores;

end

