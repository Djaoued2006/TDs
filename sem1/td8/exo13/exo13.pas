program exo;

const size = 3;

type full_name = record
        first , last : string;
    end;

    T = array[1..size] of full_name;

procedure sort(var names : T);

    var i , j : integer;
        min : integer;
        temp : full_name;

    begin

        i := 1;

        //we're going to sort the names by first names

        for i := 1 to (size - 1) do 
            begin
                min := i;

                for j := (i + 1) to size do 
                    begin
                        if (names[min].first > names[j].first) then 
                            min := j; 
                    end; 
                
                if (min <> i) then 
                    begin
                        temp := names[min];
                        names[min] := names[i];
                        names[i] := temp; 
                    end;
            end;
        
        // now we sort them by last name

        for i := 1 to (size - 1) do 
            begin
                for j := (i + 1) to size do 
                    begin
                        if (names[min].last > names[j].last) and (names[min].first = names[j].first) then 
                            min := j; 
                    end; 
                
                if (min <> i) then 
                    begin
                        temp := names[min];
                        names[min] := names[i];
                        names[i] := temp; 
                    end;
            end;
    end;

procedure main();

    var names : T;
        i : integer;

    begin
        for i := 1 to size do 
            begin
                write('type the first name of the person number ' , i , ' : ');readln(names[i].first);
                write('type the last name of the person number ' , i  , ' : ');readln(names[i].last); 
            end;
        
        sort(names);

        writeln('the new list of names after sorting is : ');

        writeln;

        for i := 1 to size do 
            writeln(i , ' : ' , names[i].first , ' ' , names[i].last);


    end;

begin
    main();
end.