uses linkedlist;

procedure main();

    var head : pNode;
        node : pNode;

    begin
        randomize;
        head := getRandomLinkedList(10);
        printLinkedList(head);
        bubbleSort(head);
        node := head;
        // swapAdjacentNodes(head , node);

        // while (node <> NIL) do 
        //     begin
        //         swapAdjacentNodes(head , node);
        //         node := node^.next;
        //     end;
        printLinkedList(head);
        freeLinkedList(head); 
    end;

begin
    main();
end.