program exo6;

function findNumberOfOcc(str : string ; c: char) : integer;

    var i : integer;

    begin
        findNumberOfOcc := 0;

        for i := 1 to length(str) do 
            if (str[i] = c) then 
                findNumberOfOcc := findNumberOfOcc + 1;

    end;

procedure main();

    var str : string;
        c : char;

    begin
        write('type something : ');readln(str);
        write('type a char : ');readln(c);

        writeln('the number of times ' , c , ' shows up in ' , str , ' is : ' , findNumberOfOcc(str ,c)) ;
    end;

begin
    main();
end.