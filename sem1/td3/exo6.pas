program perfectNumbercheck;

var i , sum  , j : integer;

begin
    // for loop
    for i := 1 to 1000 do
    begin
        sum := 0;
        for j := 1 to i - 1 do
        begin   
            if (i mod j = 0) then
                sum := sum + j ;
        end;
        if (sum = i) then writeln(i , ' is a perfect number');
    end;

    //while loop
    i := 1;
    while (i <= 1000) do
    begin
        j := 1;
        sum := 0;
        while (j < i) do
        begin
            if (i mod j = 0) then
                sum := sum + j;
            j := j + 1
        end;
        if (sum = i) then writeln(i , ' is a perfect number');
        i := i + 1;
    end;

    // repeat loop
    i := 0;
    repeat
    
        i := i + 1;
        sum := 0;
        j := 1;
        
        repeat 
            if (i mod j = 0) then 
            begin
                sum := sum + j;
            end;
            j := j + 1;
        until(j = i);
        
        if (sum = i) then writeln(i , ' is a perfect number');
        
    until(i = 1000);

end.