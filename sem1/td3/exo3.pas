program factorial;

var  number , i , result1 , result2 , result3 : longint;

begin
    writeln('========================== FACTORIAL CALCULATOR ==============================');
    write('type a positive number : ');readln(number);
    
    if number < 0 then number := (-1) * number;
    
    if (number = 0) then writeln('0! = 1');
    result1 := 1 ; result2 := 1 ; result3 := 1;
    
    
    // for loop
    for i := 2 to number do 
    begin
        result1 := result1 * i;
    end;

    // while loop
    while (i > 0) do
    begin
        result2 := result2 * i;
        i := i - 1;
    end;

    // repeat loop
    repeat 
        i := i + 1;
        result3 := result3 * i;
    until(i = number);


    // check
    if (number <> 0 ) then 
    begin
        writeln('(' , number , ')! = ' , result1);
        if (result1 = result2) and (result2 = result3) then 
            writeln('This code works well! ')
    end;


end.
