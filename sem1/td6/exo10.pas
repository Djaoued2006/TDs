program shift;

type arr = array [1..15] of integer;

procedure shift3(nums : arr);

    var i : integer;
        temp : arr;

    begin 
        for i := 1 to 15 do 
            begin
                temp[i] := nums[((i+4) mod 5) + 1]  
            end;
    // formule generale 
    // temp[i] := nums[((i+Decalage-1) mod 5) + 1]

        nums := temp;
    end;

var nums : arr;
    i : integer;

begin
    for i := 1 to 15 do 
        nums[i] := random(15);
    
    for i := 1 to 15 do 
        write(nums[i], ' ');

    writeln();
    
    shift3(nums);

end.