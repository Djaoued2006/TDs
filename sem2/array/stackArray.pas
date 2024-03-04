unit stackArray;

interface 

    const size = 10;

    type
        stack = array[1..size] of integer;

    function init_stack() : integer;
    procedure push(var arr : stack ;var top : integer; value : integer);
    procedure pop(var arr : stack ; var top , result : integer);
    function stack_empty(top : integer) : boolean;
    function stack_full(top : integer) : boolean;
    procedure print(var arr : stack ; top : integer);
    procedure reverse(var arr : stack ;var top : integer);

implementation

procedure setValue(var arr : stack ;top : integer ; value : integer);

    begin
        arr[top] := value; 
    end;

function init_stack() : integer;

    begin
        init_stack := 0; 
    end;

function stack_empty(top : integer) : boolean;

    begin
        stack_empty := (top = 0); 
    end;

function stack_full(top : integer) : boolean;

    begin
        stack_full := (top = size + 1); 
    end;

procedure push(var arr : stack ;var top : integer; value : integer);

    begin
        inc(top);

        if (stack_full(top)) then 
            begin 
                writeln('can''t push the last value!');
                dec(top);
            end
        else 
            setValue(arr , top , value);
    end;

function pop(arr : stack ; var top : integer) : integer;

    begin
        pop := arr[top];
        dec(top); 
    end;

procedure pop(var arr : stack ; var top , result : integer);

    begin
        if (stack_empty(top)) then writeln('the stack is empty!')
        else
            result := pop(arr, top);
    end;

procedure print(var arr : stack ; top : integer);

    var temp: stack;
        topTemp : integer;
        value : integer;
        
    begin
        topTemp := init_stack();

        while (not stack_empty(top)) do 
            begin
                value := pop(arr , top);
                write(value , ' - ');
                push(temp , topTemp , value);
            end;
        
        while (not stack_empty(topTemp)) do 
            push(arr , top , pop(temp , topTemp)); 
        
        writeln;
    end;

procedure reverse(var arr : stack ;var top : integer);

    var temp : stack;
        tempTop : integer;

    begin
        tempTop := init_stack();

        while (not stack_empty(top)) do 
            push(temp , tempTop , pop(arr , top)); 

        
        arr := temp;
        top := tempTop;
    end;

begin 
end.


 
