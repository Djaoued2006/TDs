program shift;


type arr = array [1..15] of integer;

procedure fill(number : integer ; var nums : arr);

    var i : integer;

    begin
        for i := 1 to number do 
            nums[i] := random(100); 
    end;

function shift3(nums : arr ; size : integer) : arr;

    var i : integer;
        result : arr;

    begin
        for i := 1 to size - 3 do 
            result[3+i] := nums[i];

        for i := size - 2 to size do 
            result[(i - (size - 3))] := nums[i];

        shift3 := result;  
    end;

var i , size : integer;
    nums : arr;

begin
    write('type the size of the array : ');readln(size);
    
    fill(size , nums);
   
    for i := 1 to size do 
        write(nums[i] , ' ');

    writeln();

    nums := shift3(nums ,size);

    for i := 1 to size do 
        write(nums[i] , ' ');

    writeln();
end.
