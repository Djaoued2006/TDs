program exo;

uses linkedlist;

const size = 10;

procedure delete(var head: pNode; rank : integer);

    var current , temp : pNode;

    begin
        if (head <> NIL) then
            if (getLength(head) = 1) then 
                begin
                    Dispose(head);
                    head := NIL; 
                end
            else 
                if (rank <= 1) then  
                    begin
                        current := head^.next;
                        Dispose(head);
                        head := current; 
                    end
                else 
                    begin
                        current := head;
                        rank := rank - 2;
                        while ((current^.next^.next <> NIL) and (rank <> 0)) do 
                            begin
                                current := current^.next;
                                rank := rank - 1; 
                            end;
                        temp := current^.next;
                        current^.next := temp^.next;
                        Dispose(temp);
                    end;
    end;


procedure main();

    var head : pNode;
        rank : integer;

    begin
        head := GetRandomLinkedList(size);
        printLinkedList(head);

        write('type the rank : ');readln(rank);
        delete(head , rank);
        
        printLinkedList(head);  
        freeLinkedList(head);
    end;

begin 
    main();
end.