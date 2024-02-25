program fill;

procedure fillArray(nums1 , nums2 : array of integer ; var nums3 : array of integer);

    var i : integer;

    begin
        for i := 1 to 10 do 
            begin
                nums1[i] := random(1000);
                nums2[i] := random(9392);
                nums3[i] := nums1[i] + nums2[i] 
            end; 
    end;


var nums1 , nums2, nums3 : array [1..10] of integer;
    i : integer;

begin
    fillArray(nums1 , nums2 , nums3);

    for i := 1 to 10 do 
        writeln(nums1[i] , ' + ' , nums2[i] , ' = ' , nums3[i]);
end.