program exo;
 

uses CRT;

function find_string(s1 , s2 : string) : integer;   

    var i , j : integer;
        found : boolean;
    
    begin
        found := false;

        i := 1;

        while (i <= length(s1) - length(s2) + 1) and not found do 
            begin
                if (s1[i] = s2[1]) then 
                    begin
                        j := 2;

                        while (j <= length(s2)) and (s1[i + j - 1] = s2[j]) do 
                            begin
                               j := j + 1;
                            end;

                    end;
                
                if (j = length(s2) + 1) then begin 
                    found := True;
                    end;

                if not found then i := i + 1;

            end;
        
        if found then 
            find_string := i
        else 
            find_string := 0;

    end;



procedure show(string1 ,string2 : string ; p : integer);

    var i : integer;

    begin
        textcolor(White);

        for i := 1 to (p-1) do 
            write(string1[i]);
        
        textcolor(Red);

        write(string2);

        textcolor(White);

        for i := (p + length(string2)) to length(string1) do 
            write(string1[i]);
        
        writeln;

    end;


procedure main();

    var string1 , string2 : string;
        answer : string;
        p : integer;

    begin

        textcolor(white);

        repeat  
            write('type the string number 1 : ');readln(string1);
            write('type the string number 2 : ');readln(string2);
            
            p := find_string(string1 , string2);

            if (p <> 0) then 
                begin 
                    writeln;
                    show(string1 , string2 , p);
                    writeln;
                end
            else 
                writeln('got no occurence of the string2 in string1');


            write('do you wanna search for a string again : ');readln(answer);
             
        until(answer[1] = 'n');
    end;



// test!! 
begin
    main();
end.