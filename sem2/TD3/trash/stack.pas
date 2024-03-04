unit stack;

interface 

    pNode = ^Node;
    Node = record 
        value : integer;
        next : pNode;
    end;

    procedure push(var top : pNode ; value : integer);
    function pop(var top : pNode) : integer;
    function isEmpty(top : pNode) : boolean;
    procedure print(var top : pNode);
    procedure free(var top : pNode);

implementation 

function make(value : integer) : pNode;

    var result : pNode;

    begin
        new(result);
        result^.next := NIL;
        result^.value := value;
        make := result;
        result := NIL; 
    end;

procedure push(var top : pNode ; value : integer);

    var node : pNode;

    begin
        node := make(value);
        node^.next := top;
        top := node;
    end;

function pop(var top : pNode) : integer;

    var temp : pNode;

    begin
        pop := (top^.value);
        temp := top^.next;
        dispose(top);
        top := temp;
        temp := NIL;
    end;

function isEmpty(top : pNode): boolean;

    begin
        isEmpty := (top = NIL); 
    end;

procedure print(var top : pNode);

    var value : integer ; 
        temp : pNode;

    begin
        temp := NIL;

        while (not isEmpty(top)) do 
            begin
                value := pop(top);
                write(value , ' - ');
                push(temp , value);
            end; 
        
        while (not isEmpty(temp)) do 
            begin
                 
            end;

    end;