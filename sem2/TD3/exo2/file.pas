program exo2;

uses dll , func;

procedure main();   

    var head , tail : pNode;
        i , pos : integer;
        s : string;


    begin
        head := NIL;
        tail := NIL;

        getRandomList(head , tail , 10);

        print(head);

        // s := readString('type a string to add to the linked list : ');
        // pos := readInteger('type the position of the new element : ');

        // add(head , tail , s , pos);

        // print(head);


        // s := readString('type the string to search for it : ');

        // if (find(head , s)) then 
        //     writeln('the string is well found')
        // else 
        //     writeln('string not found');
    
        // writeln('sort the list in the increasing order : ');
        // sort(head);
        // print(head);


        // writeln('sorting the list in the decreasing order : ');
        // sortRev(head , tail);
        // print(head);

        free(head, tail);

    end;

begin
    main();
end.