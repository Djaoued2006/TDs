program findALPHA;

const sizeOfArray = 256;

type integerArray = array [1..(sizeOfArray)div 5] of integer;

function find(arr : array of char ; var k : integer) : integerArray;

    var i : longint;
        result : integerArray;
    
    begin
        i := 1;
        k := 0;
        while (i < sizeOfArray - 4) do 
            if (arr[i] = 'A') then 
                if (arr[i+1] = 'L') then 
                    if (arr[i+2] = 'P') then 
                        if (arr[i+3] = 'H') then 
                            if (arr[i+4] = 'A') then 
                                begin   
                                    k := k + 1;
                                    result[k] := i;
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
        find := result;
    end;

procedure replace(arr : array of char ; k : integer; var arr2 : integerArray);
    var i , number : integer;

    begin
        i := 1;
        while (i <= k) do 
            begin
                number := arr2[i];
                arr[number] := 'M';
                arr[number + 1] := 'E';
                arr[number + 2] := 'R';
                arr[number + 3] := 'C';
                arr[number + 4] := 'I';
                i := i + 1;
            end;
    end;
 
var i : integer;
    nums : array[1..256] of char;
    result : integerArray;
    k : integer;

begin
    for i := 1 to sizeOfArray do 
        nums[i] := chr(random(25) + 65);

    nums[1] := 'A';
    nums[2] := 'L';
    nums[3] := 'P';
    nums[4] := 'H';
    nums[5] := 'A';

    result := find(nums , k);
    writeln(k)
        
end.

