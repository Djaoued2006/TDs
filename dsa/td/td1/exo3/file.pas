program exo;

uses linkedlist;

const size = 10;

procedure main();

    var head : pNode;

    begin
        randomize;
        
        head := getRandomLinkedList(size);

        writeln('this is the unsorted linked list!');
        printLinkedList(head);
        writeln('this is the sorted one!'); 
        sort(head);
        printLinkedList(head);

        freeLinkedList(head);
    end;

begin
    main();
end.
