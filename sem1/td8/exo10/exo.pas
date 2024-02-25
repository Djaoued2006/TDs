program exo;

function findNewString(string1 : string ; p , l : integer) : string;

    var i : integer;

    begin
        findNewString := '';

        for i := 1 to (p-1) do 
            findNewString := findNewString + string1[i];

        for i := (p + l) to length(string1) do 
            findNewString := findNewString + string1[i]

    end;

procedure main();

    var string1: string;
        p , l : integer;
    
    begin
        write('type the string : ') ; readln(string1);

        write('type the position : ');readln(p);

        write('type the length of the removed string : ');readln(l);

        writeln('the new string is : ' , findNewString(string1 , p , l)); 
    end;

begin
    main();
end.