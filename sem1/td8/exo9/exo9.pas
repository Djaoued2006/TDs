program exo;

function insertString(string1 , string2 : string ; p : integer) : string;

    var i : integer;

    begin
        insertString := '';

        for i := 1 to (p - 1) do 
            insertString := insertString + string1[i];

        insertString := insertString + string2;

        for i := p to length(string1) do 
            insertString := insertString + string1[i];
    end;

procedure main();

    var string1 , string2 : string;
        p : integer;

    begin
        write('type string1 : ');readln(string1);
        write('type string2 : ');readln(string2);
        write('type the position in which you wanna insert the string2 to string1 : ');readln(p);

        writeln('the new string after the insertion is : ' , insertString(string1 , string2 , p)); 
    end;

begin
    main();
end.