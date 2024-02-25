program calcul;

procedure calc(arr : array of integer ; var sum : longint ; var min , max : integer);

    var i : integer;

    begin
        min := 32767;
        max := -32768;
        sum := 0;

        for i := 2 to 128 do 
            begin 
                sum := sum + arr[i];
                if (min  > arr[i]) then 
                    min := arr[i];
                if (arr[i] > max) then 
                    max := arr[i];
            end; 
    end;

var i , min , max  : integer;
    nums : array [1..128] of integer;
    sum : longint;

begin
    nums[1] := -1;
    for i := 2 to 128 do 
        nums[i] := random(128);
    calc(nums , sum , min , max);
    writeln('the sum is : ' , sum);
    writeln('the min is : ' , min);
    writeln('the max is  : ' , max);
end.