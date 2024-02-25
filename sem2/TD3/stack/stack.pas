unit stack;

interface 

    type pNode = ^Node;

        data = record 
            str : string;
            number : real;
        end;

        Node = record 
            d : data;
            next , prev : pNode;
        end;
    
    function make(number : real ; str : string) : pNode;
    procedure push(var base , top : pNode ; number : real ; str : string);
    function pop(var base , top : pNode) : data;
    function isEmpty(base : pNode) : boolean;
    function getTop(top : pNode) : data;
    procedure getRandomStack(var base , top : pNode ; size : integer);
    procedure print(base : pNode);
    procedure free(var base , top : pNode);

implementation 

function make(number : real ; str : string) : pNode;

    var node : pNode;

    begin
        new(node);
        node^.next := NIL;
        node^.prev := NIL;
        node^.d.str := str;
        node^.d.number := number;
        make := node; 
    end;

procedure push(var base : pNode ; var top : pNode ; number : real ; str : string);

    var node : pNode;

    begin
        node := make(number , str);

        if (isEmpty(base)) then 
            begin
                base := node;
                top := node; 
            end
        else 
            begin
               top^.next := node;
               node^.prev := top;
               top := node;
            end;
    end;

function pop(var base , top : pNode) : data;

    var result : data;
        temp : pNode;

    begin
        
        result.number := -1;
        result.str := 'empty';

        if (not isEmpty(base)) then 
            begin
                if (base^.next = NIL) then 
                    begin
                        result.number := base^.d.number;
                        result.str := base^.d.str;
                        dispose(base);
                        base := NIL;
                        top := NIL; 
                    end
                else 
                    begin
                        result.str := top^.d.str;
                        result.number := top^.d.number;
                        top := top^.prev;
                        dispose(top^.next);
                        top^.next := NIL;
                    end;
            end; 
        
        pop := result;
    end;


function isEmpty(base : pNode) : boolean;

    begin
        isEmpty := (base = NIL); 
    end;

function getTop(top : pNode) : data;

    var result : data;

    begin   
        result.number := -1;
        result.str := 'empty';

        if (top <> NIL) then    
            begin
                result.number := top^.d.number;
                result.str := top^.d.str;
            end;
        
        getTop := result;
    end;

procedure getRandomStack(var base , top : pNode ; size : integer);

    function getRandomReal() : real;

        begin
            getRandomReal := (random(100) / (random(24) + 1)); 
        end;
    
    function getRandomString(length : integer) : string;

        var result : string;

        begin
            result := '';

            while (length <> 0) do 
                begin
                    result := result + chr(random(26) + ord('A'));
                    length := length - 1; 
                end; 
            
            getRandomString := result;
        end;
    
    begin

        while (size <> 0) do 
            begin
                push(base , top , getRandomReal() , getRandomString(random(5) + 5));
                size := size - 1; 
            end;
        
    end;

procedure print(base : pNode);

    var current : pNode;

    begin
        if (isEmpty(base)) then writeln('the stack is empty!')
        else 
            begin
                current := base;
                while (current <> NIL) do 
                    begin
                        writeln('number = ' , current^.d.number , ' , string = ' , current^.d.str);
                        current := current^.next; 
                    end; 
            end; 
    end;

procedure free(var base , top : pNode);

    var current , temp : pNode;

    begin
        if (not isEmpty(base)) then 
            begin
                current := base;
                while (current <> NIL) do 
                    begin
                        temp := current^.next;
                        dispose(current);
                        current := temp; 
                    end; 
            end; 
        
        base := NIL;
        top := NIL;
    end;

begin
    
end.



