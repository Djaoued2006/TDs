program expo;

var e , x , result: integer;

begin
    result := 1;
    write('type e : ');readln(e);
    write('type x : ');readln(x);

    while (x > 0) do
    begin
        result := result * e;
        x := x - 1;
    end;
    writeln(e , '^' , x , ' = ' , result);
end.