program exo;

uses linkedlist;

const size = 5;

//this will insert list1 in list2 at the beg (list1 -> list2)
procedure insertListBeg(var head1 , head2 : pNode);

    var current : pNode;

    begin 
        if (head1 = NIL) then head1 := head2
        else 
            begin
                current := head1;
                while (current^.next <> NIL) do 
                    current := current^.next;

                current^.next := head2; 
            end;
    end;

procedure insertList(var head1 , head2 : pNode);

    var current : pNode;

    begin 
        if (head2 = NIL) then head2 := head1
        else 
            begin
                current := head2;
                while (current^.next <> NIL) do 
                    current := current^.next;

                current^.next := head1; 
            end;
    end;

procedure main();

    var head1 , head2 : pNode;

    begin
        randomize;
        head1 := getRandomLinkedList(size);
        head2 := getRandomLinkedList(size);

        writeln('list  1: ');
        printLinkedList(head1);
        writeln('list 2: ');
        printLinkedList(head2);

        insertListBeg(head1 , head2);

        writeln('after insertion!');

        printLinkedList(head1);
        freeLinkedList(head1);
    end;

begin 
    main();
end.