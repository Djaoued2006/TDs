program calcul;

function calc(nums : array of (array of integer)) : longint;

    var sum : longint;
        i , j : integer;
    
    begin
        sum := 0;

        for i := 1 to 16 do 
            for j := 1 to 16 do
                sum := sum + nums[i][j];
        
        calc := sum;
    end;
 
var nums : array[1..16] of array[1..16] of integer;
    i , j : integer;
  
 
begin
    for i := 1 to 16 do 
        for j := 1 to 16 do 
            nums[i][j] := random(16);

    writeln('the sum of all the elements of the matrix is : ' , calc(nums));
end.