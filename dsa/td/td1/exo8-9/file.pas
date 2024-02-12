program exo;

uses linkedlist;

const size = 10;

procedure delete(var head : pNode ; c : char);

    var current : pNode;

    begin
        if (head <> NIL) then 
            begin
                current := head;
                if (c = 'b') then 
                    begin
                        current := head^.next;
                        Dispose(head);
                        head := current;
                    end
                else 
                    if (head^.next = NIL) then 
                        begin
                            Dispose(head);
                            head := NIL; 
                        end
                    else 
                        begin
                            while (current^.next^.next <> NIL) do 
                                current := current^.next;
                            Dispose(current^.next);
                            current^.next := NIL; 
                        end;
            end; 
    end;

procedure main();

    var head : pNode;

    begin
        randomize;
        head := getRandomLinkedList(size); 
        printLinkedList(head);
        Delete(head , 'b');
        printLinkedList(head);
        Delete(head , 'e');
        printLinkedList(head);
        freeLinkedList(head);
    end;

begin
    main();
end.