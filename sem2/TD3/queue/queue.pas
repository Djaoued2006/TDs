unit queue;

interface 

    type pNode = ^Node;
        Node = record
            str : string;
            next , prev : pNode;
        end;
    
    function make(value : string) : pNode;
    procedure enqueue(var rear , front : pNode ; value : string);
    function dequeue(var rear , front : pNode) : string;
    procedure print(rear : pNode);
    procedure free(var rear , front : pNode);
    function isEmpty(rear : pNode) : boolean;
    procedure getRandomQueue(var rear , front : pNode ; size : integer);


implementation

// rear is the first end of the queue
// front is the other end

// rear -> value1 -> value2 -> value3 -> front

function make(value : string) : pNode;

    var node : pNode;

    begin
        new(node);
        node^.str := value;
        node^.next := NIL;
        node^.prev := NIL;
        make := node; 
    end;

procedure enqueue(var rear , front : pNode ; value : string);

    var node : pNode;

    begin
        node := make(value);

        if (rear = NIL) then 
            begin
                rear := node;
                front := node; 
            end
        else 
            begin
                front^.next := node;
                node^.prev := front;
                front := node; 
            end;
    end;

function dequeue(var rear , front : pNode) : string;

    var result : string;

    begin
        result := '';

        if (rear <> NIL) then 
            if (rear^.next = NIL) then 
                begin
                    result := rear^.str;
                    dispose(rear);
                    rear := NIL;
                    front := NIL; 
                end
            else
                begin
                    result := rear^.str;
                    rear := rear^.next;
                    dispose(rear^.prev);
                    rear^.prev := NIL; 
                end;

        dequeue := result;
    end;

procedure print(rear : pNode);

    var current : pNode;

    begin
        current := rear;

        if (isEmpty(rear)) then writeln('the queue is empty!')
        else 
            begin
                while (current <> NIL) do 
                    begin
                        writeln(current^.str);
                        current := current^.next; 
                    end; 
            end; 
    end;

procedure free(var rear , front : pNode);

    var current , temp : pNode;

    begin
        current := rear;

        while (current <> NIL) do 
            begin 
                temp := current^.next;
                dispose(current);
                current := temp;
            end; 

        rear := NIL;
        front := NIL;        
    end;

function isEmpty(rear : pNode) : boolean;

    begin
        isEmpty := (rear = NIL); 
    end;

procedure getRandomQueue(var rear , front : pNode ; size : integer);
    
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
                enqueue(rear , front , getRandomString(random(5) + 5));
                size := size - 1; 
            end;
        
    end;

begin 
end.

