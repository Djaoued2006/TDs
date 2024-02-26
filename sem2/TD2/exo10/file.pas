program exo;

uses dlinkedlist;

procedure main();

    var head : pNode;

    begin
        head := getRandomLinkedList(10);
        printLinkedList(head);
        sort(head);
        printLinkedList(head);
    end;

begin
    main();
end.