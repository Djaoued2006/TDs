program findValues;

var n , Un , max : integer;

begin

    write('type a Un: ');readln(Un);

    n := 0;
    max := Un;

    while (Un <> 1) do 

        begin 

            if (n mod 2 = 0) then Un := (Un div 2)
            
            else Un := (3 * Un + 1);

            if (Un > max) then max := Un;

            n := n + 1;

        end;
    
    writeln('the minimum Un of steps to get to the value 1 is : ' , n);
    writeln('the greatest value reached was : ' , max)

end.