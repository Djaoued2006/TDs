program exo;

uses linkedlist;

procedure insertList(var head1  , head2 : pNode ; rank : integer);

    var current , tail : pNode;

    begin   
        if (rank <= 1) then 
            if (head1 = NIL) then head1 := head2
            else 
                begin
                    current := head1;
                    while (current^.next <> NIL) do current := current^.next;
                    current^.next := head2; 
                end
        else 
            begin
                if (getLength(head2) = 1) then 
                    begin 
                        head2^.next := head1;
                        head1 := head2
                    end
                else 
                    begin 
                        tail := head1;
                        if (tail <> NIL) then 
                            begin
                                while (tail^.next <> NIL) do tail := tail^.next;

                                rank := rank - 2;
                                current := head2;

                                while ((rank <> 0) and (current^.next^.next <> NIL)) do 
                                    begin
                                        rank := rank - 1;
                                        current := current^.next; 
                                    end; 
                                    
                                tail^.next := current^.next^.next;
                                current^.next := tail;

                            end;
                        head1 := head2;
                    end;
            end;
    end;