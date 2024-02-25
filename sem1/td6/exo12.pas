program reverse; 

procedure reverse(var nums : array of integer);

    var i , tmp : integer;

    begin
        for i := 1 to 500 do 
            tmp := nums[i];
            nums[i] := nums[1000 - i + 1];
            nums[1001 - i] := tmp;
    end;

var nums : array [1..1000] of integer ;
    i : integer;

begin
    for i := 1 to 1000 do 
        nums[i] := random(100);

    for i := 1 to 1000 do   
        write(nums[i] , ' ');

    reverse(nums);

    writeln();
    writeln('=========================================================================================');
    writeln('=========================================================================================');

    for i := 1 to 1000 do 
        write(nums[i] , ' ');
end.