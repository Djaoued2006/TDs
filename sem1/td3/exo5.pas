program findingNumber;

var count , hundreds , tens , ones ,i : integer;


begin
    // for loop
    count := 0;
    for i := 150 to 410 do
    begin
        if (count = 4) then exit;
        hundreds := i div 100;
        ones := i mod 10;
        tens := (i - (hundreds * 100 + ones)) div 10;

        if (i = hundreds * hundreds * hundreds + ones * ones * ones + tens * tens * tens) then 
            begin
                write(i , ' ');
                count := count + 1;
            end
    end;

    i := 150;
    count := 0;
    // while loop
    while (i <= 410) and (count <> 4) do
    begin
        hundreds := i div 100;
        ones := i mod 10;
        tens := (i - (hundreds * 100 + ones)) div 10;
        if (i = hundreds * hundreds * hundreds + ones * ones * ones + tens * tens * tens) then 
            begin
                write(i , ' ');
                count := count + 1;
            end;
        i := i + 1;
    end;

    i := 149;
    count := 0;
    // repeat loop
    repeat 
        i := i + 1;
        hundreds := i div 100;
        ones := i mod 10;
        tens := (i - (hundreds * 100 + ones)) div 10;
        if (i = hundreds * hundreds * hundreds + ones * ones * ones + tens * tens * tens) then 
            begin
                write(i , ' ');
                count := count + 1;
            end
    until((i = 410) or (count = 4));
end.