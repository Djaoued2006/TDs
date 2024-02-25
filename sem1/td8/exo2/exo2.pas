program exo2;

const size = 50;


type 
    rec = record
        int : integer;
        c : char;
    end;

    T = array[1..size] of rec;

procedure sortAscending(var tab : T);

    var i , j : integer;
        min : integer;
        temp : rec;

    begin
        for i := 1 to (size - 1) do 
            begin
                min := i;

                for j := i + 1 to size do 
                    begin
                        if (tab[min].c > tab[j].c) then 
                            min := j;
                    end; 
                
                if (i <> min) then 
                    begin
                        temp := tab[i];
                        tab[i] := tab[min];
                        tab[min] := temp;
                    end;
            end;
        
        for i := 1 to (size - 1) do 
            begin

                min := i;

                for j := i + 1 to size do   

                    begin
                        if (tab[min].int > tab[j].int) and (tab[min].c = tab[j].c) then 
                            min := j; 
                    end; 

                if (min <> i) then 
                    begin 
                        temp := tab[i];
                        tab[i] := tab[min];
                        tab[min] := temp;
                    end;
            end;
        end;
    
procedure sortDescending(var tab : T);

    var i , j : integer;
        min : integer;
        temp : rec;

    begin
        for i := 1 to (size - 1) do 
            begin
                min := i;

                for j := i + 1 to size do 
                    begin
                        if (tab[min].c < tab[j].c) then 
                            min := j;
                    end; 
                
                if (i <> min) then 
                    begin
                        temp := tab[i];
                        tab[i] := tab[min];
                        tab[min] := temp; 
                    end;
            end;
        
        for i := 1 to (size - 1) do 
            begin

                min := i;

                for j := i + 1 to size do   

                    begin
                        if (tab[min].int < tab[j].int) and (tab[min].c = tab[j].c) then 
                            min := j; 
                    end; 
                
                if (i <> min) then 
                    begin 
                        temp := tab[min];
                        tab[min] := tab[i];
                        tab[i] := temp;
                    end;
            end;
        end;

procedure fillArray(var tab : T);

    var i : integer;

    begin
        randomize;

        for i := 1 to size do
            begin 
                tab[i].int := random(size);
                tab[i].c := chr(random(26) + 65);
            end;
    end;

procedure displayArray(tab : T);

    var i : integer;

    begin   
        for i := 1 to size do 
            begin 
                if (i mod 5 = 0) then 
                    writeln;
                write('(' , tab[i].c , ' , ' , tab[i].int , ') -> ');  
            end;
        writeln;
    end;    


procedure main();

    var tab : T;
        c : char;

    begin

        fillArray(tab);

        write('Type a char : ');readln(c);

        if (c = 'C') or (c = 'c') then 
            sortAscending(tab)
        else 
            if (c = 'D') or (c = 'd') then 
                sortDescending(tab)
            else 
                writeln('Invalid input!');
            
        displayArray(tab);
    end;

begin
    main();
end.