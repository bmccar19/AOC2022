x = readlines( "Day1//Day1.txt" );
v = parse.(Int64, x[1]);

tot = 0;
totMax = 0;
k = 1;
totAll = [0];

for i = 1:length(x);

    if ( x[i] != "" )
        tot = tot + parse.(Int64, x[i]);
    else
        if ( tot >= totMax )
            totMax = tot;
        end
        push!(totAll, tot);
        tot = 0;
        k = k + 1;
    end
end

ans = sum(sort(totAll)[end-2:end]);

                        
