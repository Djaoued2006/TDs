program exo;

uses dlinkedlist;

const size = 10;

procedure addNodeBeg(var head : pNode ; value : string);

    begin
        addNode(head , value , 1); 
    end;

procedure addNodeEnd(var head : pNode ; value : string);

    begin
        addNode(head , value , getLength(head) + 1);
    end;

procedure main();

    var head : pNode;
        s : string;

    begin
        randomize;
        head := getRandomLinkedList(size); 
        write('type a string : ');readln(s);
        addNodeBeg(head , s);
        addNodeEnd(head , s);
        printLinkedList(head);
        freeLinkedList(head);
    end;


begin
    main();
end.