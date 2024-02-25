program main;

function count_spaces(str : string) : integer;

    var i : integer;

    begin
        count_spaces := 0;

        for i := 1 to length(str) do 
            if (str[i] = ' ') then count_spaces := count_spaces + 1;
        
        count_spaces := count_spaces + 1;
    end;

procedure make();

    var str : string;

    begin   
        write('type something that has spaces in it : ');readln(str);

        writeln('the number of words is :  ' , count_spaces(str)); 
    end;

begin
    make();
end.
