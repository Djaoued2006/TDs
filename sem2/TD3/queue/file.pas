program exo;

uses queue , func;

procedure main();

    var rear , front : pNode;
        s : string;
    
    begin
        rear := NIL;
        front := NIL;
        randomize;

        getRandomQueue(rear , front , 10);

        print(rear);

        writeln;


        s := readString('type a string to enqueue : ');

        enqueue(rear , front , s);
        
        writeln;

        print(rear);

        s := dequeue(rear , front);

        writeln;

        if (s = '') then writeln('the queue is empty')
        else 
            writeln('this is the enqueued string : ' , s);

        writeln;
        
        writeln('this is the queue now');

        writeln;

        print(rear);

        free(rear , front);
    end;

begin
    main();
end.