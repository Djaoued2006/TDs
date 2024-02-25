program exo;

// exo 7:

function findString(start : integer ; str1 , str2 : string) : integer;

    var i : integer;
        j : integer;
        found : boolean;

    begin
        i := start;
        found := false;

        while (i <= length(str1) - length(str2) + 1) and not found do 
            begin
                if (str1[i] = str2[1]) then 
                    begin

                        j  := 2;
                        
                        if (length(str2) = 1) then found := True 
                        else 
                            begin

                                while (j <= length(str2)) and (str1[i + j - 1] = str2[j]) do 
                                    j := j + 1;
                                
                                if (j = length(str2) + 1) then 
                                    found := true;
                            end;
                    end; 

                if not found then i := i + j - 1;
            end;
            
        if found then findString := i
        else findString := 0;
    
    end;

// exo 8 : 
function numberOfOcc(string1 , string2 : string) : integer;

    var p : integer;

    begin
        p := findString(1 , string1 , string2);

        numberOfOcc := 0;

        while (p <> 0) do 
            begin
                numberOfOcc := numberOfOcc + 1; 

                p := findString(p + length(string2) , string1 , string2);
            end;
    end;


procedure main();
     
    var string1 , string2 : string;

    begin
        write('type the string number 1 : ');readln(string1);
        write('type the string number 2 : ');readln(string2);
        
        writeln('the number of times string2 shows up in string1 is : ' , numberOfOcc(string1 , string2));
    end;

begin
    main();
end.
