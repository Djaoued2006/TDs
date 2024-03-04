unit linkedlist;

//this is the implementation of the linked list data structure in the form of an array!

interface 
    
    const size = 11;

    type     
        node = record
            value : integer;
            is_free : boolean;
            next : integer;
        end;

        list = array[1..size] of node;

    function init_list() : list;    
    procedure add(var arr : list ;var head : integer; pos , value : integer);
    procedure print(arr : list ; head : integer);
    procedure remove(var arr : list ; var head : integer ; pos : integer);


implementation

function make(value : integer) : node;

    var result : node;

    begin
        result.value := value;
        result.is_free := FALSE;
        result.next := 0;

        make := result; 
    end;

procedure free(var arr : list ; pos : integer);

    begin
        arr[pos].is_free := TRUE; 
    end;

function init_list() : list;

    var result : list;
        i : integer;

    begin 
        for i := 1 to size do 
            free(result , i);
        
        init_list := result;
    end;


//this will return false if there's no element available in the array!
function getIndex(arr : list ;var index : integer) : boolean;

    begin 
        index := 1;

        while (index <> size) do 
            if (arr[index].is_free) then break
            else 
                inc(index);
        
        getIndex := (arr[index].is_free);
    end;

//this will return the index of the last element in a list!
function getLast(arr : list ; head : integer) : integer;
    
    var result : integer;

    begin 
        result := head;

        if (head <> 0) then 
            while (arr[result].next <> 0) do 
                result := arr[result].next;
        
        getLast := result;
    end;

procedure add(var arr : list ;var head : integer; pos , value : integer);

    var newElement : node;
        i , index , temp : integer;
    
    begin 
        if (getIndex(arr , index)) then 
            begin
                newElement := make(value);
                arr[index] := newElement;

                if (head = 0) then 
                    head := index
                else 
                    if (pos = 1) then 
                        begin
                            arr[index].next := head;
                            head := index; 
                        end 
                    else 
                        begin
                            i := 1;
                            pos := pos - 1;
                            temp := head;

                            while (i <> pos) do 
                                begin
                                    if (arr[temp].next = 0) then break;
                                    temp := arr[temp].next;
                                    i := i + 1;
                                end;
                            
                            arr[index].next := arr[temp].next;
                            arr[temp].next := index;
                        end;
            end 
        else 
            writeln('can not add ' , value , ' , no memory available!');
    end;


procedure print(arr : list ; head : integer);

    var temp : integer;

    begin 
        if (head = 0) then writeln('the linked list is empty')
        else 
            begin
                temp := head;
                while (arr[temp].next <> 0) do 
                    begin
                        write(arr[temp].value , ' -> ');
                        temp := arr[temp].next; 
                    end; 
                writeln(arr[temp].value);
            end;
    end;

procedure remove(var arr : list ; var head : integer ; pos : integer);

    var temp , i : integer;

    begin
        if (head <> 0) then 
            if (pos = 1) then 
                begin
                    free(arr , head);
                    head := arr[head].next;
                end
            else 
                if (arr[head].next = 0) then 
                    begin
                        free(arr , head);
                        head := 0; 
                    end
                else
                    begin
                        i := 1;
                        pos := pos - 1;
                        temp := head;

                        while (i <> pos) do 
                            begin
                                if (arr[arr[temp].next].next = 0) then break;
                                i := i + 1;
                                temp := arr[temp].next;
                            end; 
                        
                        arr[temp].next := arr[arr[temp].next].next;
                        free(arr , arr[temp].next);    
                    end;
    end;

begin 
end.

