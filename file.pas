program test;

uses sll;

const size = 10;

procedure main();

    var head : pNode;

    begin
        randomize;
        
        head := getLinkedList(size);

        print(head);

        sort(head);

        print(head);

        free(head); 
    end;

begin
    main();
end.