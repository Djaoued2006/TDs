program exo;

procedure reverse(var str : string);

    var i : integer;
        len : integer;
        temp : char;

    begin
        len := length(str);

        i := 1;

        while (i <= len div 2) do 
            begin
                temp := str[i];
                str[i] := str[len - i + 1];
                str[len - i + 1] := temp;
                i := i + 1;
            end;
    end;

procedure main();

    var str : string;

    begin
        write('type something : ');readln(str);

        reverse(str);

        writeln('the reversed string is : ' ,  str); 
    end;

begin
    main();
end.