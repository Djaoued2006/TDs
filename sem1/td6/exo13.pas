program search; 

const sizeOfArray = 10000;

function find(arr : array of char) : integer;

    var i , count : integer;

    begin
        count := 0;
        for i := 1 to sizeOfArray - 1 do 
            if ((arr[i] = 'C') and (arr[i+1] = 'A')) then 
                count := count + 1; 
        find := count;
    end;

var arr : array[1..sizeOfArray] of char;
    i : integer ;

begin
    for i := 1 to sizeOfArray do 
        arr[i] := CHR(random(25) + 65);

    writeln('the number of times CA shows up is : ' , find(arr));
end.