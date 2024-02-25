program findreverse;

procedure reverse(number : single ; var result : integer);

    var i , nombre : integer;

    begin
        result := 0;
        i := 1;
        
        nombre := number * 1000;
        
        for i := 1 to 3 do 
            begin
                result := result + (nombre mod 10) * pow(10 , (3 - i));
                nombre := nombre div 10;
            end;
        result := result / 1000;

        for i := 1 to 4 do 
            begin 
                result := result + (nombre mod 10) * pow(10 , (5 - i));
                nombre := nombre div 10;
            end;

    end;

var number , result : double;

begin
    write('type a number : ');readln(number);
    reverse(number , result);
    writeln(result);
end.