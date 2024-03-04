unit linkedlist;

interface 

    type pNode = ^Node;
        Node = record 
            value : string;
            next : pNode;
        end;
    
    function makeNode(value : string) : pNode;
    procedure addNode(var head : pNode ; value : string);
    procedure printLinkedList(head : pNode);
    procedure freeLinkedList(var head : pNode);
    procedure sort(var head : pNode);
    function getLength(head : pNode) : integer;
    function getRandomLinkedList(length : integer) : pNode;
    procedure trash(head : pNode);

implementation

function makeNode(value : string) : pNode;

    var node : pNode;

    begin
        new(node);

        node^.value := value;
        node^.next := NIL;

        makeNode := node; 
    end;

procedure addNode(var head : pNode ; value : string);

    var node , current : pNode;

    begin
        node := makeNode(value);
        if (head = NIL) then head := node
        else 
            begin
                current := head;

                while (current^.next <> NIL) do 
                    current := current^.next;

                current^.next := node;
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
                        write(current^.value , ' -> ');
                        current := current^.next;
                    end; 
                writeln(current^.value);
            end; 
    end;

procedure freeLinkedList(var head : pNode);

    var current , temp : pNode;

    begin
        if (head <> NIL) then 
            begin
                current := head;
                repeat
                    temp := current^.next;
                    Dispose(current);
                    current := temp;
                until (current = NIL);
            end; 
        head := NIL;
        writeln();
        writeln('Linked List empty!');
    end;

function getLength(head : pNode) : integer;

    var result : integer;
        current : pNode;

    begin
        result := 0;
        current := head;

        while (current <> NIL) do 
            begin
                inc(result);
                current := current^.next; 
            end; 
        
        getLength := result;
    end;

procedure sort(var head : pNode);

    var current , temp : pNode;
        min : pNode;
        tempString : string;

    begin
        if (getLength(head) >= 2) then 
            begin
                current := head;

                while (current^.next <> NIL) do 
                    begin
                        temp := current^.next;
                        min := current;
                        while (temp <> NIL) do 
                            begin
                                if (temp^.value < min^.value) then min := temp;
                                temp := temp^.next; 
                            end; 
                        
                        tempString := min^.value;
                        min^.value := current^.value;
                        current^.value := tempString;

                        current := current^.next;
                    end; 
            end;
    end;

function getRandomLinkedList(length : integer) : pNode;
    
    function generateString(length : integer) : string;

    var result : string;

    begin
        result := '';
        while (length <> 0) do 
            begin
                result := result + chr(ord(random(26) + ord('A')));
                length := length - 1;
            end; 
        
        generateString := result;
    end;

    var head : pNode;

    begin
        head := NIL;
        while (Length <> 0) do 
            begin
                addNode(head , generateString(random(5) + 1)); 
                length := length - 1;
            end;
        
        getRandomLinkedList := head;
    end;

procedure trash(head : pNode);

    begin
        head := NIL;
    end;

begin 
end.