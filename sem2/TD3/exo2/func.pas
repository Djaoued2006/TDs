unit func;

interface 

    function readString(s : string) : string;
    function readInteger(s : string) : integer;
    
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

begin 
end.
