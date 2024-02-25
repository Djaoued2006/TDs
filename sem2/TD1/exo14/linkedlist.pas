unit linkedlist;

interface 

    type pNode = ^Node;
        Node = record 
            value : integer;
            next : pNode;
        end;
    
    function makeNode(value : integer) : pNode;
    procedure addNode(var head : pNode ; value : integer);
    procedure printLinkedList(head : pNode);
    procedure freeLinkedList(var head : pNode);
    procedure sort(var head : pNode);
    function getLength(head : pNode) : integer;
    function getRandomLinkedList(length : integer) : pNode;
    procedure insertSortedList(var head1 , head2 : pNode);

implementation

function makeNode(value : integer) : pNode;

    var node : pNode;

    begin
        new(node);

        node^.value := value;
        node^.next := NIL;

        makeNode := node; 
    end;

procedure addNode(var head : pNode ; value : integer);

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
        tempinteger : integer;

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
                        
                        tempinteger := min^.value;
                        min^.value := current^.value;
                        current^.value := tempinteger;

                        current := current^.next;
                    end; 
            end;
    end;

function getRandomLinkedList(length : integer) : pNode;

    var head : pNode;

    begin
        head := NIL;
        while (Length <> 0) do 
            begin
                addNode(head , random(500)); 
                length := length - 1;
            end;
        
        getRandomLinkedList := head;
    end;

function getTale(head : pNode) : pNode;

    var current : pNode;

    begin
        current := head;
        if (head <> NIL) then 
            while (current^.next <> NIL) do 
                current := current^.next;

        getTale := current; 
    end;

procedure insertSortedList(var head1 , head2 : pNode);
    
    var tale1 , tale2 , prev1 , prev2 , next2 , current , temp , next : pNode;

    begin
        if (head1 <> NIL) then 
            if (head2 = NIL) then head2 := head1
            else 
                begin
                    tale1 := getTale(head1);
                    tale2 := getTale(head2);

                    if (tale1^.value <= head2^.value) then 
                        begin 
                            tale1^.next := head2;
                            head2 := head1;
                        end
                    else 
                        if (tale2^.value <= head1^.value) then 
                            tale2^.next := head1
                        else 
                            begin
                                current := head1;
                                prev1 := NIL;

                                while (current <> NIL) do 
                                    if (current^.value <= head2^.value) then 
                                        begin 
                                            prev1 := current;
                                            current := current^.next;
                                        end
                                    else 
                                        break;
                                
                                if (prev1 <> NIL) then 
                                    begin 
                                        prev1^.next := head2;
                                        head2 := head1;
                                    end;

                                prev2 := head2;
                                next2 := head2^.next;
                                prev1 := current;
                                
                                while (current <> NIL) do 
                                    begin
                                        if (next2 = NIL) then break;
                                        if (current^.value >= next2^.value) then 
                                            begin
                                                prev2 := next2;
                                                next2 := next2^.next;
                                            end
                                        else 
                                            begin
                                                temp := current^.next;
                                                prev2^.next := current;
                                                current^.next := next2;
                                                prev2 := current;
                                                current := temp;
                                            end;
                                    end;
                                
                                if (current <> NIL) then
                                    prev2^.next := current;
                            end;
                end; 
    end;

begin 
end.