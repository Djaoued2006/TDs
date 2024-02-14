unit sll;

interface 

    type pNode = ^Node;

        Node = record 
            data : integer;
            next : pNode;
        end;
    
    function makeNode(data : integer) : pNode;
    procedure addNode(var head: pNode ; data : integer ; pos : integer);
    procedure print(head :  pNode);
    function getLinkedList(len : integer) : pNode;
    function length(head : pNode) : integer;
    function getNode(head : pNode ; index : integer) : pNode;
    procedure free(var head : pNode);
    function checkIndex(var head : pNode; index : integer) : boolean;
    procedure swapNodes(var head : pNode ; index1 , index2 : integer);
    procedure sort(var head : pNode);



 
implementation

function makeNode(data : integer) : pNode;

    var node : pNode;

    begin
        new(node);
        node^.data := data;
        node^.next := NIL;
        makeNode := node; 
    end;

procedure addNode(var head : pNode ; data : integer ; pos : integer);

    var current , node : pNode;
        i : integer;

    begin
        node := makeNode(data);
        
        if (head = NIL) then head := node
        else 
            if (pos <= 1) then 
                begin
                    node^.next := head;
                    head := node; 
                end
            else 
                begin
                    i := 1;
                    current := head;
                    while ((i < pos - 1) and (current^.next <> NIL)) do 
                        begin
                            current := current^.next;
                            i := i + 1; 
                        end;

                    node^.next := current^.next;
                    current^.next := node;
                end;
    end;

procedure print(head : pNode);

    var current : pNode;

    begin
        current := head;
        if (head = NIL) then writeln('the linked list is empty!')
        else 
            begin
                while (current^.next <> NIL) do  
                    begin 
                        write(current^.data , ' -> ');
                        current := current^.next;
                    end;
                writeln(current^.data);
            end; 
    end;

procedure free(var head : pNode);

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
    end;

function getLinkedList(len : integer) : pNode;

    var head : pNode;

    begin
        head := NIL;

        while (len <> 0) do 
            begin
                addNode(head , random(25) , length(head) + 1);
                len := len - 1; 
            end; 
        
        getLinkedList := head;
    end;

    

function length(head : pNode) : integer;

    var current : pNode;
        result : integer;

    begin
        current := head;
        result := 0;

        while (current <> NIL) do 
            begin
                current := current^.next;
                result := result + 1; 
            end; 
        
        length := result;
    end;

function getNode(head : pNode ; index : integer) : pNode;

    var result : pNode;

    begin
        result := NIL;
        if ((index > 0) and (index <= length(head))) then
            begin
                result := head;
                index  := index - 1;
                while (index <> 0) do 
                    begin
                        result := result^.next;
                        index := index - 1; 
                    end;
            end; 
        
        getNode := result;
    end;

function checkIndex(var head : pNode; index : integer) : boolean;

    begin
        checkIndex := (index > 0) and (index <= length(head)); 
    end;


procedure swapNodes(var head : pNode ; index1 , index2 : integer);

    var prev , after1 , before2 ,  node1 , node2 , temp : pNode;

    begin
        if ((checkIndex(head , index1)) and (checkIndex(head , index2))) then 
            begin
                node1 := getNode(head , index1);
                node2 := getNode(head , index2);

                if (node1 = head) then 
                    if (node1^.next = node2) then 
                        begin 
                            node1^.next := node2^.next;
                            node2^.next := node1;
                            head := node2;
                        end
                    else 
                        begin
                            prev := getNode(head , index2 - 1);
                            temp := head^.next;
                            head^.next := node2^.next;
                            prev^.next := head; 
                            node2^.next := temp;
                            head := node2;  
                        end
                else
                    if (node1^.next = node2) then 
                        begin 
                            temp := getNode(head , index1 - 1);
                            node1^.next := node2^.next;
                            node2^.next := node1;
                            temp^.next := node2;
                        end
                    else 
                        begin 
                            prev := getNode(head , index1 - 1);
                            after1 := node1^.next;
                            before2 := getNode(head , index2 - 1);
                            temp := node2^.next;

                            prev^.next := node2; // 1
                            node2^.next := after1; //2 
                            node1^.next := temp; //3
                            before2^.next := node1;
                        end; 
            end;
        
    end;

procedure sort(var head : pNode);

    var i , min , j : integer;
        len : integer;

    begin
        len := length(head);

        i := 1;

        while (i < len) do 
            begin
                j := i + 1;
                min := i;
                while (j <= len) do 
                    begin
                        if (getNode(head , min)^.data > getNode(head , j)^.data) then 
                            min := j;
                        j := j + 1;
                    end; 
                
                if (min <> i) then 
                    swapNodes(head , i , min);
                
                i := i + 1;
            end;
    end;




// function mergeLists(head1 , head2 : pNode) : pNode;

//     var result , ptr1 , ptr2 : pNode;

//     begin
//         result := NIL;
//         if (head1 = NIL) then result := head2 
//         else 
//             if (head2 = NIL) then result := head1 
//             else 
//                 begin   
//                     ptr1 := head1;
//                     ptr2 := head2;

//                     while ((ptr1 <> NIL) and (ptr2 <> NIL)) do 
//                         if (ptr1^.data < ptr2^.data) then 
//                             begin
//                                 addNode(result , ptr1^.data);
//                                 ptr1 := ptr1^.next; 
//                             end
//                         else 
    //                         begin
    //                             addNode(result , ptr2^.data);
    //                             ptr2 := ptr2^.next; 
    //                         end;
                    
    //                 while (ptr1 <> NIL) do 
    //                     begin
    //                         addNode(result , ptr1^.data);
    //                         ptr1 := ptr1^.next; 
    //                     end;
                    
    //                 while (ptr2 <> NIL) do 
    //                     begin
    //                         addNode(result , ptr2^.data);
    //                         ptr2 := ptr2^.next; 
    //                     end;
    //             end; 
            
    //     mergeLists := result;
    // end;

begin 
end.