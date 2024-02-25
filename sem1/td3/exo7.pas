program sqrt;

var number , i : integer;

begin
    repeat 
        write('type a positive number : ');readln(number);
    until(number >= 0)

    // for loop
    for i := 0 to number do 
    begin 
        if (i = number) and (i * i <> number) then
            writeln(number , ' has no sqrt in N');
        if (i * i = number) then
        begin
            write('sqrt(' , number , ')= ' , i);
            exit;
        end;
    end; 

    // while loop
    i := 0;
    while (i <= number) do
    begin
        if (i = number) and (number * number <> number) then 
        begin
            writeln(number ,' has no sqrt in N');
        end
        else  
            begin
                if (i * i = number) then 
                begin
                    write('sqrt(' , number , ')= ' , i);
                    exit;
                end
            end;
        i := i + 1;
    end;

    // repeat 
    i := -1;
    repeat
        i := i + 1;
        if (i = number) and (number * number <> number) then 
        begin
            writeln(number , ' has no sqrt in N');
        end
        else 
            begin
                if (i * i = number) then 
                begin
                    write('sqrt(' , number , ')= ' , i);
                    exit;
                end 
            end;
    until(i = number);
end.