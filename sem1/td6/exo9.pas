program what;

procedure remplir(number : integer);

    var arr : array[1..5] of char;
        sizeNumber , p  , i: integer;
    
    begin
        sizeNumber := 0;
        i := number;
        while (i <> 0) do
            begin
                sizeNumber := sizeNumber + 1;
                i := i div 10;
            end;

        for i := sizeNumber downto 1 do 
            begin
                p := number mod 10;
                arr[i] := chr(p + 48);
                number := number div 10;
            end;
        for i := sizeNumber + 1 to 5 do 
            begin
                arr[i] := '0' 
            end;
        for i := 1 to 5 do 
            begin
                write(arr[i] , ' '); 
            end;
    end;

var arr : array[1..5] of char;
    number : integer;

begin
    readln(number);
    remplir(number);
end.