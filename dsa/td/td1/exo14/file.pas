program exo;

uses linkedlist;

const size = 5;

procedure insertSorted(var head1 , head2 : pNode);

    var current , temp ,  traverse2 : pNode;

    begin
        sort(head1);
        sort(head2);

        if ((head1 <> NIL) and (head2 <> NIL)) then 
            begin
                current := head1;
                traverse2 := head2;

                while ((traverse2^.next <> NIL) and (current <> NIL)) do 
                    begin
                        if ((current^.value >= traverse2^.value) and (current^.value <= traverse2^.next^.value)) then 
                            begin
                                temp := current^.next;
                                current^.next := traverse2^.next;
                                traverse2^.next := current;
                                current := temp; 
                            end; 
                        traverse2 := traverse2^.next;
                    end;
                
                while (current <> NIL) do 
                    begin
                        traverse2^.next := current;
                        current := current^.next;
                        traverse2 := traverse2^.next; 
                    end;
                
                traverse2^.next := NIL;
            end; 
        
        head1 := head2;
    end;

procedure main();

    var head1 , head2 : pNode;

    begin
        randomize;
        
        head1 := getRandomLinkedList(size);
        head2 := getRandomLinkedList(size);
        
        printLinkedList(head1);
        printLinkedList(head2);

        insertSorted(head1 , head2);

        printLinkedList(head1);

        freeLinkedList(head1); 
    end;

begin
    main();
end.
