program exo;

uses dlinkedlist;

const size = 10;

procedure removeNodeBeg(var head : pNode);

    begin
        removeNode(head , 1); 
    end;

procedure removeNodeEnd(var head : pNode);

    begin
        removeNode(head , getLength(head)); 
    end;

procedure main();

    var head : pNode;
        pos : integer;

    begin
        randomize;
        head := getRandomLinkedList(size);
        printLinkedList(head);
        removeNodeBeg(head);
        removeNodeEnd(head);
        write('type a position : ');ReadLn(pos);
        removeNode(head , pos);
        printLinkedList(head);
        freeLinkedList(head);
    end;

begin
    main();
end.