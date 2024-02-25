program exo;


type T = array[1..100] of integer;
    M = array[1..25] of integer;

function find(tab1 : T ; tab2 : M) : boolean;

    var i , j : integer;
        temp : Boolean;

    begin
        i := 1;
        find := False;

        while (i <= 76) and (not find) do 
            begin
                if (tab1[i] = tab2[1]) then 
                    begin
                        j := 2;
                        temp := True;

                        while (j <= 25) and (temp) do 
                            if (tab1[i + j - 1] <> tab2[j]) then temp := false
                            else j := j + 1;
                        
                        find := temp;
                        
                    end;  
                
                    i := i + 1;
            end; 
    end;