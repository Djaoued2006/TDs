program checkFind;

const size = 100;

type arr = array[1..size] of integer;

function sortedInc(nums : arr) : boolean;

    var i : integer;
        result : boolean;

    begin
        result := True;

        for i := 1 to size - 1 do 
            if (nums[i+1] < nums[i]) then 
                result := False;
        
        sortedInc := result;
    end;    

function sortedDec(nums : arr) : boolean;

    var i : integer;
        result : boolean;

    begin
        result := True;

        for i := 1 to size - 1 do 
            if (nums[i+1] > nums[i]) then 
                result := False;
        
        sortedDec := result;
    end;

var nums : arr;
    i : integer;

begin
    for i := 1 to size do 
        nums[i] := random(9);
    
    writeln(sortedInc(nums));
    writeln(sortedDec(nums));

    if (sortedInc(nums) or  sortedDec(nums)) then 
        writeln('Sorted Correctly')
    else 
        writeln('not sorted');
end.