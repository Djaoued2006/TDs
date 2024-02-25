program EucDiv;

var x , y , result , r : integer;

begin
    result := 0;
    write('enter x : ');readln(x);
    write('enter y : ');readln(y);
    while (True)
    begin
        r := x - y;
        if (r < y) then 
        begin
            writeln(x , ' div ' , y , ' = ' , result);
            exit;
        end
        else
        begin
            result := result + 1;
            x := r;
        end
    end;
end.