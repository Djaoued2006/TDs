program exo;

type 
    pNode = ^Node;
    Node = record 
        value : integer;
        next : pNode;
    end;

procedure addNode(var head : pNode; value : integer);

    var current : pNode;
        node : pNode;
    
    begin
        new(node);
        node^.value := value;
        node^.next := NIL;

        current := head;

        if (head = NIL) then head := node
        else 
            begin
                while (current^.next <> NIL) do current := current^.next;
                current^.next := node; 
            end; 
    end;

function getLinkedList(length : integer) : pNode;

    var head , newNode : pNode;

    begin
        new(head);
        newNode := head;

        while (length <> 0) do 
            begin  
                newNode^.value := random(10);
                new(newNode^.next);
                newNode := newNode^.next;
                length := length - 1;
            end; 
        dispose(newNode);
        newNode := NIL;

        getLinkedList := head;
    end;

procedure print(head : pNode);

    var current : pNode;

    begin
        current := head;
        if (head = NIL) then writeln('the linked list is empty')
        else 
            begin
                while (current^.next <> NIL) do 
                    begin
                        write(current^.value , ' -> ');
                        current := current^.next; 
                    end; 
                writeln(current^.value);
            end; 
    end;

procedure getEvenOddLinkedList(head : pNode ; var even , odd : pNode);

    var current : pNode;

    begin
        even := NIL;
        odd := NIL;

        current := head;
        while (current <> NIL) do 
            begin
                if (current^.value mod 2 = 0) then addNode(even , current^.value)
                else 
                    addNode(odd , current^.value);  
                
                current := current^.next;
            end; 
    end;

procedure main();   

    var head , even , odd  : pNode;

    begin
        head := getLinkedList(10);
        getEvenOddLinkedList(head, even , odd);
        print(head);
        print(even); 
        print(odd);
    end;
