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

begin 
end.