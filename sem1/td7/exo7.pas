// Fibonacci problems

program find;

const size = 1000;

type arr = array[1..size] of integer;

function isFound(number : integer) : boolean;

    var U0 , U1 , Un : integer;
        found : boolean;

    begin
        U0 := 1;
        U1 := 1;
        Un := 1;
        found := false; 

        while True do 
            begin
                if (Un = number) then 
                    begin
                        found := True;
                        break; 
                    end
                else 
                    if (Un > number) then 
                        begin
                            found := False;
                            break; 
                        end
                    else 
                        begin
                            Un := U0 + U1;
                            U0 := U1;
                            U1 := Un;
                        end;
            end;

        isFound := found;
    end;
 
function countFibo(nums : arr) : integer;

    var i , count: integer;

    begin
        count := 0;

        for i := 1 to size do 
            begin
                if isFound(nums[i]) then 
                    count := count + 1;
            end; 

        countFibo := count;
    end;

var nums : arr;
    i : integer;

begin

    for i := 1 to size do 
        nums[i] := random(size); 
     
    for i := 1 to size do 
        write(nums[i] , ' ');
    
    writeln;
    writeln;

    writeln('the number of terms that belong to the fibo sequence is : ' , countFibo(nums))
end.