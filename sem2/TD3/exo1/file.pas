program exo1;

uses cll;


procedure main();

    var head: pNode;
        i : integer;

    begin
        head := NIL;
        for i := 1 to 10 do 
            add(head , 10 - i , 1);
        
        print(head);

        sort(head);
        
        print(head);

        

        free(head);
    end;

begin
    main();
end.