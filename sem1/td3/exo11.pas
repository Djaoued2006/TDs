program check;

var number : integer;

begin
    write('type a number : ');readln(number);
    i := number;
    if (number = 0) then writeln(number , ' is odd');
    while(i <> 0) do
    begin
        if (i > 0) then
            i := i - 2;

        if (i = 0) then 
        begin
            writeln(number , ' is odd');
            exit;
        end;

        if (i < 0) then
        begin
            writeln(number , ' is even');
            exit;
        end;

    end;
end.