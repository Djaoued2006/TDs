program exo;

uses linkedlist;

const size = 10;

procedure deleteFrom(var head : pNode ; start , endd : integer);

    var i : integer;
        current , temp : pNode;
    
    begin
        if ((head <> NIL) and (start > 0)) then 
            if (start = 1) then 
                begin
                    current := head;
                    i := 1;
                    while ((i <= endd) and (current <> NIL)) do 
                        begin
                            temp := current^.next;
                            Dispose(current);
                            current := temp;
                            i := i + 1; 
                        end;
                    head := current;
                end
            else 
                if ((start <= getLength(head))) then 
                    begin
                        current := head;
                        for i := 2 to (start - 1) do 
                            current := current^.next;
                        
                        i := start;

                        while ((i <= endd) and (current^.next <> NIL)) do
                            begin
                                temp := current^.next;
                                current^.next := temp^.next;
                                Dispose(temp);
                                i := i + 1;
                            end;
                    end;
    end;

procedure main();

    var head : pNode;

    begin
        head := getRandomLinkedList(size);

        printLinkedList(head);
        // deleteFrom(head , 5 , 100);


        trash(head);

        printLinkedList(head);

        freeLinkedList(head);
    end;

begin 
    main();
end.