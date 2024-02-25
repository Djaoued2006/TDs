program inverseValues;

uses sysUtils;

var tmp : char;
    len , i , number : integer;
    something : string;

begin 

    repeat  

        write('type a number between 0 and 59999 : ');readln(number);

    until((number >= 0) and (number <= 59999));

    something := IntToStr(number);
    len := length(something);
    i := 1;

    while (i <= (len div 2)) do 

        begin 

            tmp := something[i];
            something[i] := something[len - i + 1];
            something[len - i + 1] := tmp;
            inc(i);

        end;
    
    writeln(something , ' is the inverse of the number ' , number);
end.
