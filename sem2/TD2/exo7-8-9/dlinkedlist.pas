unit dlinkedlist;

interface 

    type pNode = ^Node;
        Node = record 
            value : string;
            next , previous : pNode;
        end;
    
    function makeNode(value : string): pNode;
    procedure addNode(var head : pNode ; value : String ; pos : integer); 
    procedure printLinkedList(head  : pNode);
    procedure freeLinkedList(var head : pNode);
    function getRandomLinkedList(length : integer) : pNode;
    function getLength(head : pNode) : integer;
    procedure removeNode(var head : pNode ; pos : integer);


implementation

function generateString(length : integer) : string;

    var result : string;

    begin
        result := '';
        while (length <> 0) do  
            begin
                result := result + chr(random(26) + ord('A'));
                length := length - 1; 
            end;
        
        generateString := result;
    end;

function makeNode(value : string) : pNode;

    var node : pNode;

    begin
        new(node);
        node^.value := value;
        node^.next := NIL;
        node^.previous := NIL;
        makeNode := node; 
    end;

procedure addNode(var head : pNode ; value : string ; pos : integer);

    var node , current: pNode;

    begin
        node := makeNode(value);
        if (head = NIL) then head := node
        else 
            if (pos <= 1) then 
                begin
                    node^.next := head;
                    head^.previous := node;
                    head := node; 
                end
            else 
                begin
                    current := head;
                    pos := pos - 2;
                    while ((pos <> 0) and (current^.next <> NIL)) do 
                        begin
                            current := current^.next;
                            pos := pos - 1;
                        end; 
                    
                    node^.next := current^.next;
                    current^.next := node;
                    node^.previous := current;

                    if (current^.next <> NIL) then current^.next^.previous := node;
                end;
    end;


procedure printLinkedList(head : pNode);

    var current : pNode;

    begin
        if (head = NIL) then writeln('the linked list is empty!')
        else 
            begin
                current := head;
                while (current^.next <> NIL) do 
                    begin
                        write(current^.value , ' <-> ');
                        current := current^.next; 
                    end; 
                writeln(current^.value);
            end; 
    end;

procedure freeLinkedList(var head : pNode);

    var current , temp : pNode;

    begin
        current := head;
        while (current <> NIL) do 
            begin
                temp := current^.next;
                Dispose(current);
                current := temp; 
            end; 
        
        head := NIL;
    end;

function getRandomLinkedList(length : integer) : pNode;

    var head : pNode;

    begin
        head := NIL;
        while (length <> 0) do 
            begin 
                addNode(head , generateString(random(10) + 2) , 1);
                length := length - 1;
            end; 
        
        getRandomLinkedList := head;
    end;

function getLength(head : pNode) : integer;

    var result : integer;
        current : pNode;

    begin
        result := 0; 
        current := head;
        while (current <> NIL) do 
            begin
                result := result + 1;
                current := current^.next; 
            end;
        
        getLength := result;
    end;

procedure removeNode(var head : pNode ; pos : integer);

    var current , temp: pNode; 
    
    begin   
        if (head <> NIL) then 
            begin
                if (pos <= 1) then 
                    begin
                        current := head^.next;
                        Dispose(head);
                        head := current;
                        head^.previous := NIL; 
                    end
                else 
                    begin
                        current := head;
                        pos := pos - 1;
                        while ((pos <> 0) and (current^.next <> NIL)) do 
                            begin
                                current := current^.next;
                                pos := pos - 1; 
                            end;
                        
                        if (current^.next = NIL) then 
                            begin
                                temp := current^.previous;
                                temp^.next := current^.next;
                                Dispose(current);
                                current := temp;
                            end
                        else 
                            begin
                                temp := current^.previous;
                                temp^.next := current^.next;
                                current^.next^.previous := temp;
                                Dispose(current);
                            end;
                    end;
            end; 
    end;

begin 
end.
