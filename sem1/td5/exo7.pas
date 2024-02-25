program findNumber;

var count , number ,  enteredNumber : integer;

begin 

    write('type number 1 : ');readln(number);

    if (number = 0) then writeln('the number of times you enetered numbers is 1 ')

    else

        begin 

            count := 2;

            enteredNumber := 1;

            while (enteredNumber <> 0) do 

                begin 

                    write('type number ' , count , ' : ');readln(enteredNumber);

                    count := count + 1;

                    if (enterednumber = number) then break ;

                    number := enteredNumber;

                end;
            
            writeln('the number of times you enetered numbers are : ' , count - 1)
            
        end;
end.