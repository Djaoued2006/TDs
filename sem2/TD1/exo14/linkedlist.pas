unit linkedlist;

interface 

    type pNode = ^Node;
        Node = record 
            value : integer;
            next : pNode;
        end;
    
    function makeNode(value : integer) : pNode;
    procedure addNode(var head : pNode ; value : integer);
    procedure printLinkedList(head : pNode);
    procedure freeLinkedList(var head : pNode);
    procedure sort(var head : pNode);
    function getLength(head : pNode) : integer;
    function getRandomLinkedList(length : integer) : pNode;
    procedure insertSortedList(var head1 , head2 : pNode);

implementation

function makeNode(value : integer) : pNode;

    var node : pNode;

    begin
        new(node);

        node^.value := value;
        node^.next := NIL;

        makeNode := node; 
    end;

procedure addNode(var head : pNode ; value : integer);

    var node , current : pNode;

    begin
        node := makeNode(value);
        if (head = NIL) then head := node
        else 
            begin
                current := head;

                while (current^.next <> NIL) do 
                    current := current^.next;

                current^.next := node;
            end;
    end;

procedure printLinkedList(head : pNode);

    var current : pNode;

    begin
        if (head = NIL) then writeln('the linked list is empty!')
        else 
            begin
                current := head;
                while (current^.next <> NIL) do 
                    begin
                        write(current^.value , ' -> ');
                        current := current^.next;
                    end; 
                writeln(current^.value);
            end; 
    end;

procedure freeLinkedList(var head : pNode);

    var current , temp : pNode;

    begin
        if (head <> NIL) then 
            begin
                current := head;
                repeat
                    temp := current^.next;
                    Dispose(current);
                    current := temp;
                until (current = NIL);
            end; 
        head := NIL;
        writeln();
        writeln('Linked List empty!');
    end;

function getLength(head : pNode) : integer;

    var result : integer;
        current : pNode;

    begin
        result := 0;
        current := head;

        while (current <> NIL) do 
            begin
                inc(result);
                current := current^.next; 
            end; 
        
        getLength := result;
    end;

procedure sort(var head : pNode);

    var current , temp : pNode;
        min : pNode;
        tempinteger : integer;

    begin
        if (getLength(head) >= 2) then 
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
                        
                        tempinteger := min^.value;
                        min^.value := current^.value;
                        current^.value := tempinteger;

                        current := current^.next;
                    end; 
            end;
    end;

function getRandomLinkedList(length : integer) : pNode;

    var head : pNode;

    begin
        head := NIL;
        while (Length <> 0) do 
            begin
                addNode(head , random(500)); 
                length := length - 1;
            end;
        
        getRandomLinkedList := head;
    end;

function getTail(head : pNode) : pNode;

    var current : pNode;

    begin
        current := head;
        if (head <> NIL) then 
            while (current^.next <> NIL) do 
                current := current^.next;

        getTail := current; 
    end;

procedure insertSortedList(var head1 , head2 : pNode);
    
    var tale1 , tale2 , prev1 , prev2 , next2 , current , temp , next : pNode;

    begin
        if (head1 <> NIL) then 
            if (head2 = NIL) then head2 := head1
            else 
                begin
                    //la fonction getTail va retourner le dernier element dans la list!

                    tale1 := getTail(head1);
                    tale2 := getTail(head2);

                    if (tale1^.value <= head2^.value) then 
                        begin 
                            tale1^.next := head2;
                            head2 := head1;
                        end
                    else 
                        if (tale2^.value <= head1^.value) then 
                            tale2^.next := head1
                        else 
                            begin
                                current := head1;
                                prev1 := NIL; 
                                
                                {
                                    supposons que : 
                                        liste 1 : 1 -> 2 -> 3 -> 10 
                                        liste 2 :  5 -> 6
                                    la boucle suivante va traiter ce cas
                                    
                                    elle va couper la liste 1 en deux portions 

                                    sous-liste 1 : 1 -> 2 -> 3
                                    sous-liste 2 : 10

                                    et elle va inserer la sous-liste 1 en debut de la list 2
                                    donc on va obtenir 

                                    liste 2 : 1 -> 2 -> 3 -> 5 -> 6 
                                    liste 1 : 10

                                    remarque : la liste est unidirectionele c pour cetter raison j'ai besoin du pointeur
                                    prev1 qui va toujours garder l'adresse de l'element avant current!
                                }

                                while (current <> NIL) do 
                                    if (current^.value <= head2^.value) then 
                                        begin 
                                            prev1 := current;
                                            current := current^.next;
                                        end
                                    else 
                                        break;
                                
                                // si prev1 = NIL alors on a pas le cas special donc aucun traitement n'ai demande
                                if (prev1 <> NIL) then 
                                    begin 
                                        prev1^.next := head2;
                                        head2 := head1;
                                    end;

                                prev2 := head2;
                                next2 := head2^.next;
                                prev1 := current;
                                
                                while (current <> NIL) do 
                                    begin
                                        if (next2 = NIL) then break; // si on a parcouru toute la liste 2 alors on a terminer
                                                                    // il reste juste de traiter le cas ou on a pas parcouru toute la liste 1

                                        if (current^.value >= next2^.value) then 
                                            begin
                                                prev2 := next2;
                                                next2 := next2^.next;
                                            end
                                        else 
                                            begin
                                                //si la valeur d'un certain noeud dans la liste 1 est < la valeur de next2 alors on fait le traitement
                                                temp := current^.next;
                                                prev2^.next := current;
                                                current^.next := next2;
                                                prev2 := current;
                                                current := temp;
                                            end;
                                    end;
                                
                                if (current <> NIL) then
                                    prev2^.next := current;
                            end;
                end; 
    end;
 

begin 
end.