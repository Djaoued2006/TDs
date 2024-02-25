program multiplying;

var x , y , result : integer;

begin
    result := 0;
    write('type the number x : ');readln(x);
    write('type the number y : ');readln(y);
    while (x > 0) do
    begin
        result := result + y;
        x := x - 1;
    end;
    writeln(result);
end.