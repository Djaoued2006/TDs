unit cll;

interface 

    type pNode = ^Node;
        Node = record 
            value : integer;
            next : pNode;
        end;
    
    function make(head : pNode; value : integer) : pNode;
    procedure add(var head : pNode ; value  , pos: integer);
    procedure remove(var head : pNode ; pos : integer);
    function getNode(head : pNode ; pos : integer) : pNode;
    procedure print(head : pNode);
    procedure free(var head : pNode);
    function getLast(head : pNode) : pNode;
    procedure sort(var head : pNode);

implementation 

function make(head : pNode ; value : integer) : pNode;

    var node : pNode;

    begin
        new(node);
        node^.value := value;
        node^.next := head;

        make := node;
    end;

procedure add(var head : pNode ; value , pos : integer);

    var node , last : pNode;

    begin
        node := make(head , value);

        if (head = NIL) then 
            begin
                head := node;
                head^.next := head; 
            end
        else 
            begin
                node^.next := head;
                last := getLast(head);
                last^.next := node;
            end;       
    end;

procedure print(head : pNode);

    var current : pNode;

    begin
        if (head = NIL) then writeln('the list is empty!')
        else 
            begin
                write(head^.value , ' -> ');
                current := head^.next;
                while (current^.next <> head) do 
                    begin
                        write(current^.value , ' -> ');
                        current := current^.next
                    end; 
                writeln(current^.value);
            end;
    end;

function getNode(head : pNode ; pos : integer) : pNode;

    var node : pNode;

    begin
        node := head;
        

        if (head <> NIL) then 
            begin
                pos := pos - 1;
                while ((pos <> 0) and (node^.next <> head)) do 
                    begin
                        pos := pos - 1;
                        node := node^.next; 
                    end; 
            end;
        
        getNode := node; 
    end;

procedure swap(var a , b : integer);

    var temp : integer;

    begin
        temp := a;
        a := b;
        b := temp; 
    end;

function len(head : pNode) : integer;    

    var node : pNode;

    begin   
        len := 0;
        if (head <> NIL) then 
            begin
                len := 1;
                node := head;

                while (node^.next <> head) do 
                    begin
                        len := len + 1;
                        node := node^.next; 
                    end; 
            end; 
    end;

procedure sort(var head : pNode);

    var current , temp , min : pNode;

    begin
        if (len(head) > 1) then 
            begin 
                current := head;
                while (current^.next <> head) do 
                    begin
                        min := current;
                        temp := current^.next;

                        while (temp <> head) do 
                            begin
                                if (min^.value > temp^.value) then min := temp;
                                temp := temp^.next; 
                            end; 
                        
                        if (min <> current) then
                        swap(min^.value , current^.value);
                        current := current^.next;
                    end;
            end; 
    end;

procedure remove(var head : pNode ; pos : integer);

    var node , temp : pNode;

    begin
        if (head <> NIL) then 
            begin
                if (pos = 1) then 
                    begin
                        temp := getLast(head);
                        node := head;
                        head := head^.next;
                        temp^.next := head;
                        dispose(node);
                        node := NIL; 
                    end
                else 
                    begin
                        node := getNode(head , pos - 1);
                        if (node^.next <> head) then 
                            begin
                                temp := node^.next;
                                node^.next := temp^.next;
                                dispose(temp);
                                temp := NIL;
                            end;
                    end;
            end; 
    end;

procedure free(var head : pNode);

    var current , temp : pNode;

    begin
        if (head <> NIL) then 
            if (head^.next = head) then 
                begin
                    dispose(head);
                    head := NIL; 
                end
            else 
                begin
                    current := head^.next;
                    while (current <> head) do 
                        begin
                            temp := current^.next;
                            dispose(current);
                            current := temp; 
                        end; 
                    dispose(head);
                    head := NIL;
                end;
    end;



function getLast(head : pNode) : pNode;

    var current: pNode;

    begin
        current := head;

        if (head <> NIL) then 
            if (head^.next <> head) then 
                begin
                    while (current^.next <> head) do 
                        current := current^.next; 
                end;
        
        getLast := current; 
    end;

begin
    
end.



