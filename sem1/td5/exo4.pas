program implementingFunction;

var i  , number : integer;

begin   

    write('type a number : ');readln(number);

    writeln('using the for loop!');
    for i := 0 to number do 
         
        begin 

            if (i mod 2 = 0) then 
                begin
                    writeln('Hello ' , i);
                end;

        end;

    i := 0;
    writeln('==============================================');
    writeln('using the while loop!');
    while (i <= number) do 

        begin 

            writeln('hello ' , i);

            i := i + 2;

        end;
    
    i := 0;
    writeln('==============================================');
    writeln('using the repeat loop!');
    repeat 

        writeln('hello ' , i);
        i := i + 2

    until(i > number);



    
end.