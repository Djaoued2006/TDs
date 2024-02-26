program exo;

uses linkedlist;

const size = 5;

function testSorting(head : pNode) : boolean;

    var current: pNode;

    begin
        current := head;
        while (current^.next <> NIL) do 
            if (current^.value > current^.next^.value) then break
            else 
                current := current^.next;

        testSorting := (current^.next = NIL); 
    end;

procedure testFunction(numberOfTimes : integer);

    var head1 , head2 : pNode;
        i , j : integer;

    begin
        for i := 1 to numberOfTimes do 
            begin 
                head1 := getRandomLinkedList(size);
                head2 := getRandomLinkedList(size);
                sort(head1);
                sort(head2);
                insertSortedList(head1 , head2);
                if (testSorting(head2)) then 
                    begin 
                        writeln('test passed! ');
                        freeLinkedList(head2);
                        for j := 1 to 2 do writeln;
                    end
                else 
                    begin
                        for j := 1 to 3 do writeln;
                        writeln('found problem at : ');
                        printLinkedList(head2);
                        break;  
                    end;
            end;
    end;

procedure main();

    var head1 , head2 : pNode;

    begin
        randomize;
        
        testFunction(10);

        freeLinkedList(head2); 
    end;

begin
    main();
end.
