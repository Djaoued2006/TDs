program doSomething;

function max(nums : array of real ; i , j : integer) : real;

    var maxx : real;
        k : integer;
    
    begin
        maxx := nums[i];
        for k := i + 1 to j do 
            if (nums[k] > maxx) then 
                maxx := nums[k];
        
        max := maxx;
    end;

var nums : array[1..100] of real;
    k : integer;
    i , j : integer;

begin
    for k := 1 to 100 do 
        nums[k] := random(100) + random(1000) * 0.001;
    repeat
      write('type i and j : ');readln(i,j);
    until(j >= i);
    
   writeln('the maximum number in the array between the indices ' , i , ' and ' , j  , ' is ' , max(nums , i , j):0:5);
end.