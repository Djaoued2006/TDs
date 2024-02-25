program findALPHA;

const sizeOfArray = 100000;

function find(arr : array of char) : integer;

    var i : longint;
        count: integer;
    
    begin
        i := 1;
        count := 0;
        while (i < sizeOfArray - 4) do 
            if (arr[i] = 'A') then 
                if (arr[i+1] = 'L') then 
                    if (arr[i+2] = 'P') then 
                        if (arr[i+3] = 'H') then 
                            if (arr[i+4] = 'A') then 
                                begin 
                                    i := i + 1;
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
        find := count;
    end;

var arr : array [1..sizeOfArray] of char;
    i : longint;

begin
    for i := 1 to sizeOfArray do 
        arr[i] := chr(random(25) + 65);

    writeln('the number of times ALPHA shows up is : ' , find(arr));  
end.