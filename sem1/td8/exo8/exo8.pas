program exo;

function insertChar(str : string ; c : char ; p : integer) : string;

    var result : string;
        i : integer;    

    begin 

        result := '';

        for i := 1 to (p-1) do 
            result := result + str[i];
        
        result := result + c;

        for i := p to length(str) do 
            result := result + str[i];
        
        insertChar := result;
    end; 

procedure main();

    var str2 : string;
        p : integer;
        str : string;
        i : integer;
    
    begin
        write('type a string : ');readln(str);
        write('type the position : ');readln(p);
        write('type the string you wanna insert : ');readln(str2);


        for i := 1 to length(str2) do 
            begin
                str := insertChar(str , str2[i] , p);
                p := p + 1; 
            end;
        
        writeln('the result is : ', str);
    end;

begin
    main();
end.
