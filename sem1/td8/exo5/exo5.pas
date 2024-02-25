program exo;

function findString(string1 : string) : string;

    var i : integer;

    begin
        if length(string1) < 15 then findString := ''
        else 
            begin 
                findString := '';
                for i := 7 to 15 do 
                    findString := findString + string1[i];
            end;


    end;

procedure main();

    var temp : string;

    begin
        write('type the string : ');readln(temp);

        temp := findString(temp);
        
        if (temp = '') then writeln('the length of the given string is less than 15')
        else 
            writeln(temp);
    end;

begin
    main();
end.