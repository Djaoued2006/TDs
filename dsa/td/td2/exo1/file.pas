program exo;

uses linkedlist;

const size = 10;

procedure sortUsingPointers(var head : pNode);

    var current , temp : pNode;
        min : pNode;

    begin
        if (head <> NIL) then 
            begin
                current := head;
                while (current^.next <> NIL) do 
                    begin
                        min := current;
                        temp := current^.next;
                        while (temp <> NIL) do 
                            begin 
                                if (temp^.value < min^.value) then min := temp;
                                temp := temp^.next;
                            end;
                        
                        if (min <> current) then 
                            begin
                                temp := min^.next;
                                min^.next := current^.next;
                                current^.next := temp; 
                            end;
                        
                        current := min^.next;
                    end;
            end; 
    end;

procedure main();

    var head : pNode;

    begin
        head := getRandomLinkedList(size);
        printLinkedList(head);
        sortUsingPointers(head);
        printLinkedList(head);
        freeLinkedList(head);
    end;

begin 
    main();
end.