program findOcc;

function findOcc(nums : array of integer ; target : integer) : integer; 

    var i , count : integer;

    begin
        count := 0;

        for i := 1 to 128 do 
            if (nums[i] = target) then 
                count := count + 1;
        findOcc := count;
    end; 

var nums : array[1..128] of integer; 
    target , i: integer;

begin
    for i := 1 to 128 do 
        nums[i] := random(5);
    write('type the target :  ');readln(target);
    writeln('the number of occurences of ' , target , ' is the array is : ' , findOcc(nums , target));
end.
