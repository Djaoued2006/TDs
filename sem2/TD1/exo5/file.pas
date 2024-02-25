program exo;

uses linkedlist;

const size = 10;

procedure insertBeg(var head : pNode; value : string);

    var node : pNode;

    begin
        node := makeNode(value);
        node^.next := head;
        head := node; 
    end;


procedure main();

    var head : pNode;
        s : string;

    begin
        randomize;

        head := getRandomLinkedList(size); 

        printLinkedList(head);

        write('type a string : ');readln(s);

        insertBeg(head , s);

        printLinkedList(head);

        freeLinkedList(head);
    end;

begin 
    main()
end.