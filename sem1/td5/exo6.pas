program reverseNumber;

uses sysUtils;

function findIntPart(number : double):string;

    var stringNumber , result : string;
        i : integer;


    begin
        stringNumber := floattostr(number);
        result := '';
        for i := 1 to 4 do 
            begin
                result := result + stringNumber[i];
            end; 
        findIntPart := result;
    end;
  

function findFracPart(number : double):string;

    var result , numberString : string;
        i : integer;

    begin
        numberString := floattostr(number);
        result := '';
        for i := 6 to 8 do 
            begin
                result := result + numberString[i]; 
            end; 
        findFracPart := result;
    end;


function reverse(number : double):string;

    var i : integer; 
        string1 , string2 : string;
        tmp : char;

    begin
        string1 := findIntPart(number) ; string2 := findFracPart(number);
        for i := 1 to 2 do 
            begin
                tmp := string1[i];
                string1[i] := string1[5 - i];
                string1[5 - i] := tmp;
            end;
        for i := 1 to 1 do 
            begin
                tmp := string2[i];
                string2[i] := string2[4 - i];
                string2[3 - i] := tmp;
            end;
        reverse := string1 + '.' + string2;
    end;

var number : double;


begin
    write('type a number : ');readln(number);
    writeln(findIntPart(number));
    writeln(findFracPart(number));
    writeln(strtofloat(reverse(number)):0:3)
end.

