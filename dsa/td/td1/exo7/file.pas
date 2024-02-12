program exo;

uses linkedlist;

const size = 10;

procedure insert(var head : pNode ; value : string ; rank : integer);

    var node : pNode;
        current : pNode;
    
    begin
        node := makeNode(value);
        if (head = NIL) then 
            head := node //No matter what rank you give , it will be inserted!
        else 
            if (rank <= 1) then 
                begin
                    node^.next := head;
                    head := node; 
                end
            else 
                begin
                    rank := rank - 2;
                    current := head;
                    while ((rank <> 0) and (current^.next <> NIL)) do  
                        begin
                            current := current^.next; 
                            rank := rank - 1;
                        end;
                        
                    node^.next := current^.next;
                    current^.next := node;
                end;
    end;

procedure main();

    var head : pNode;
        s : string;
        rang : integer;

    begin
        randomize;
        head := getRandomLinkedList(size);
        printLinkedList(head);
        write('type a string : ');readln(s);
        write('type the rank : ');readln(rang);
        insert(head , s , rang);
        printLinkedList(head);
        freeLinkedList(head);
    end;

begin 
    main();
end.