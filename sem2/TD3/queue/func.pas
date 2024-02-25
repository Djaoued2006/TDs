unit func;

interface 

    function readString(s : string) : string;
    function readInteger(s : string) : integer;
    function readReal(s : string) : real;
    
implementation

function readInteger(s : string) : integer;

    var number : integer;

    begin
        write(s);
        readln(number); 
        readInteger := number;
    end;

function readString(s : string) : string;

    var result : string;

    begin
        write(s);
        readln(result); 
        readString := result;
    end;

function readReal(s : string) : real;

    var result : real;

    begin
        write(s);
        readln(result);
        readReal := result; 
    end;

begin 
end.
