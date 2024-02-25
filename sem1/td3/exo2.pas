program UpdateDays;

var i  , number , UpdatedDays , UpdatedMonth : integer ;


begin 

    readln(number);
    i := 1;

    while i < 13 do 

        begin 

            UpdatedDays := number;

            case i of 
                1 : number := number - 31;
                2 : number := number - 29;
                3 : number := number - 31;
                4 : number := number - 30;
                5 : number := number - 31;
                6 : number := number - 30;
                7 : number := number - 31;
                8 : number := number - 31;
                9 : number := number - 30;
                10 : number := number - 31;
                11 : number := number - 30;
                12 : number := number - 31;
            end;

            if (number >= 0) then i := i + 1
            else 
                begin 
                    UpdatedMonth := i;
                    break
                end;
        end;

    writeln('the updated date is : ') ;
    writeln(UpdatedMonth);
    writeln(UpdatedDays + 1);

end.