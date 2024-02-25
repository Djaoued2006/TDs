program calcul;

function sum(nums : array of integer) : longint;

    var result : longint;
        i : integer;

    begin
        result := 0;
        for i := 1 to 256 do 
            result := result + nums[i];
        sum := result; 
    end;
 

var nums : array [1..256] of integer;
    i : integer;
    somme : longint;

begin
    for i := 1 to 256 do 
        nums[i] := random(256);

    somme := sum(nums);
    writeln('the sum is : ' , somme);
    writeln('the average is : ', (somme/256):0:2);
     
end.