unit dll;

interface 

    type 
        pNode = ^Node;
        Node = record
            value : string;
            next , prev : pNode;
        end;
    
    function make(value : string) : pNode;
    procedure add(var head , tail : pNode ; value : string ; pos : integer);
    procedure print(head : pNode);
    procedure free(var head , tail : pNode);
    function getNode(head : pNode ; pos : integer) : pNode;
    procedure printReverse(tail : pNode);
    function find(head : pNode ; value : string) : boolean;
    procedure sort(var head : pNode);
    function getTail(head : pNode ; pos : integer) : pNode;
    function length(head : pNode) : integer;
    procedure sortRev(var head , tail : pNode);
    procedure getRandomList(var head , tail : pNode; length : integer);


implementation

function make(value : string) : pNode;

    var node : pNode;

    begin
        new(node);
        node^.value := value;
        node^.next := NIL;
        node^.prev := NIL;
        make := node; 
    end;

procedure add(var head , tail : pNode ; value : string ; pos : integer);

    var node , current: pNode;
    
    begin
        node := make(value);

        if (head = NIL) then 
            begin
                head := node;
                tail := node; 
            end
        else 
            begin
                current := getNode(head , pos - 1);
                if (current^.next = NIL)  then 
                    begin
                        current^.next := node;
                        node^.prev := current;
                        tail := node;
                    end
                else 
                    begin
                        node^.next := current^.next;
                        current^.next := node;
                        node^.next^.prev := node;
                        node^.prev := current;
                    end;
            end;
    end;

function getNode(head : pNode ; pos : integer) : pNode;

    var current : pNode;

    begin
        current := head;

        if (head <> NIL) then 
            if (pos <> 1) then
                begin
                    pos := pos - 1;
                    while ((pos <> 0) and (current^.next <> NIL)) do 
                        begin
                            pos := pos - 1;
                            current := current^.next; 
                        end; 
                end; 
            
        getNode := current;
    end;

function find(head : pNode ; value : string) : boolean;

    var current : pNode;

    begin
        current := head;
        while (current <> NIL) do 
            begin
                if (current^.value = value) then break;
                current := current^.next; 
            end; 
        
        find := (current <> NIL);
    end;

procedure print(head : pNode);

    var current : pNode;

    begin
        if (head = NIL) then writeln('the linked list is empty!')
        else 
            begin
                current := head;
                while (current^.next <> NIL) do 
                    begin
                        write(current^.value , ' <-> ');
                        current := current^.next; 
                    end;
                writeln(current^.value);
            end; 
    end;

procedure free(var head , tail : pNode);

    var current , temp : pNode;

    begin
        current := head;
        while (current <> NIL) do 
            begin
                temp := current^.next;
                dispose(current);
                current := temp; 
            end; 
        head := NIL;
        tail := NIL;
    end;

procedure printReverse(tail : pNode);

    var current : pNode;

    begin 
        if (tail = NIL) then writeln('the linked list is empty!')
        else 
            begin
                current := tail;
                while (current^.prev <> NIL) do 
                    begin
                        write(current^.value , ' <-> ');
                        current := current^.prev; 
                    end;
                writeln(current^.value);
            end; 
    end;

function getTail(head : pNode ; pos : integer) : pNode;

    begin
        getTail := getNode(head , length(head));
    end;

function length(head : pNode) : integer;

    var node : pNode;

    begin
        length := 0;

        if (head <> NIL) then 
            begin
                node := head;
                while (node <> NIL) do 
                    begin
                        node := node^.next;
                        length := length + 1; 
                    end; 
            end; 
    end;


procedure swap(var a , b : string);

    var temp : string;

    begin
        temp := a;
        a := b;
        b := temp; 
    end;

procedure sort(var head : pNode);

    var current , temp , min : pNode;

    begin 
        if (length(head) > 1) then 
            begin
                current := head;
                while (current^.next <> NIL) do 
                    begin
                        temp := current^.next;
                        min := current;

                        while (temp <> NIL) do 
                            begin
                                if (temp^.value < min^.value) then min := temp;
                                temp := temp^.next; 
                            end;
                        
                        if (current <> min) then swap(min^.value , current^.value);

                        current := current^.next;
                    end; 
            end;
    end;

procedure reverse(var head , tail : pNode);

    var temp , node , next : pNode;

    begin 
        node := head;

        temp := tail;
        tail := head;
        head := temp;

        while (node <> NIL) do 
            begin
                next := node^.next;
                node^.next := node^.prev;
                node^.prev := next;
                node := next; 
            end;

    end;

procedure sortRev(var head , tail : pNode);

    begin
        sort(head);
        reverse(head , tail);
    end;

function getString(length : integer) : string;

    var result : string;

    begin
        result := '';
        while (length <> 0) do
            begin
                length := length - 1;
                result := result + chr(random(26) + ord('A')); 
            end; 
        
        getString := result;
    end;

procedure getRandomList(var head , tail : pNode; length : integer);

    var i : integer;
    
    begin
        free(head , tail);

        for i := 1 to length do 
            add(head , tail , getString(random(5) + 2) , 1);
        
    end;

begin 
end.
