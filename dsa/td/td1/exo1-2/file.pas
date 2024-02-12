program exo;

uses linkedlist;

const size = 10;

type 
    strings = array[1..size] of string;

function generateString(length : integer) : string;

    var result : string;

    begin
        result := '';
        while (length <> 0) do 
            begin
                result := result + chr(ord(random(26) + ord('A')));
                length := length - 1;
            end; 
        
        generateString := result;
    end;

function getArray() : strings;

    var i : integer;

    begin
        for i := 1 to size do 
            getArray[i] := generateString(random(10) + 2);
    end;

function toList(arr : strings ; c : char) : pNode;

    var head : pNode;
        i : integer;    

    begin
        head := NIL;

        if (c = 'b') then
            for i := 1 to size do 
                addNode(head , arr[i])
        else 
            for i := 1 to size do 
                addNode(head , arr[size - i + 1]);

        
        toList := head;
    end;

procedure printArray(arr : strings);

    var i : integer;

    begin
        write('[');
        for i := 1 to (size - 1) do 
            write(arr[i] , ' , ');
        writeln(arr[i + 1] , ']'); 
    end;



procedure main();

    var head : pNode;
        c: char;
        arr : strings;

    begin
        randomize;

        write('b or e : ');readln(c);

        arr := getArray();

        head := toList(arr , c);

        printArray(arr);
        printLinkedList(head);

        freeLinkedList(head); 
    end;

begin 
    main();
end.

