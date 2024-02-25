program change;

const size = 32767;

type T1 = array[1..size] of char;

var tab : T1;
    found : boolean;
    i : integer;
    count : integer;

procedure replace();

    begin
        tab[1] := 'A';
        tab[2] := 'L';
        tab[3] := 'P';
        tab[4] := 'H';
        tab[5] := 'A';
    end;


procedure change_alpha(var yes : boolean ; var count : integer);
    
    var i : integer;


    begin
        i := 1;
        yes := false;
        count := 0;

        while (i < 96) do 
            begin
                if (tab[i] = 'A') then 
                    if (tab[i+1] = 'L') then 
                        if (tab[i+2] = 'P') then    
                            if (tab[i+3] = 'H') then 
                                if (tab[i+4] = 'A') then 
                                    begin
                                        found := True;
                                        yes := True;
                                        count := count + 1;
                                    end
                                else 
                                    i := i + 4
                            else 
                                i := i + 4
                        else 
                            i := i + 3
                    else 
                        i := i + 2
                else 
                    i := i + 1;

                if found then 
                    begin
                        tab[i] := 'O';
                        tab[i+1] := 'M';
                        tab[i+2] := 'E';
                        tab[i+3] := 'G';
                        tab[i+4] := 'A';
                        i := i + 5
                    end;
            end;
    end;

begin
    randomize;
    for i := 1 to size do 
        tab[i] := chr(random(25) + 65);
    
    change_alpha(found , count);

    if found then 
        for i := 1 to size do 
            write(tab[i] , ' ')
    else 
        begin
            writeln('NOT FOUND');
            writeln('Replacing ALPHA with OMEGA');
            writeln;
            writeln('Here''s the result : ');
            writeln;
            replace();
           change_alpha(found , count);
           if found then writeln('FOUND');
           writeln;
           for i := 1 to 5 do 
                writeln(tab[i]);
            
            writeln('the number of times ALPHA shows up is : ' , count); 
        end;
  
end.