program findMultiples;

var number : integer;

begin
    
    number := 600;

    while (number >= 500) do 

        begin 

            if (number mod 13 = 0) then writeln(number);

            number := number - 1;

        end;

    
end.