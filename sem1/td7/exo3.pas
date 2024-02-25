program ex3;

type T1 = array[1..100] of char;
    T2 = array[1..25] of char;
 
var text : T1;
    wordd : T2;

function find() : boolean;

    var i, j : integer;
        found : boolean;

    begin 

        i := 1; 
        j := 0;
        found := False;
        
        while (i <= 75) and (not found) do 
            begin 
                if (text[i] = wordd[1]) then 
                    begin
                        found := True;
                        j := 1;
                        while (j < 26) and found do 
                            if (text[i+ j- 1] <> wordd[j]) then 
                                found := False
                            else 
                                begin
                                   j := j + 1;
                                   writeln(text[i+j-1] ,  wordd[j])
                                end;
                    end;
                
                if found then 
                    find := True;
                
                if j <> 0 then 
                    i := i + j
                else
                    i := i + 1;
                
            end;
          
    end;

procedure fill_array(); 

    var i : integer;

    begin

        Randomize ;
     
        for i := 1 to 100 do 
            begin 
                text[i] := chr(random(25) + 65);

                if (i < 26) then 
                    wordd[i] := chr(random(25) + 65);
            end; 
    end;

begin
    fill_array();
    writeln(find);
end.