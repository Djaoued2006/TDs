program sum;

var sum1 , sum2 , sum3 , i : integer;

begin

    sum1 := 0; sum2 := 0; sum3 := 0;

    // for loop 
    for i := 10 to 30 do 
    begin 
        sum1 := sum1 + i;
    end;

    // while loop
    i := 10;
    while(i <= 30) do 
    begin 
        sum2 := sum2 + i;
        i := i + 1;
    end;

    i := 9;

    // repeat loop
    repeat
        i := i + 1; // i did this just for the last iteration
        sum3 := sum3 + i 
    until (i >= 30);

    if (sum1 = sum2) and (sum2 = sum3) then writeln('this code works well');
end.