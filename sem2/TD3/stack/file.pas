program exo;

uses stack , func;

procedure main();

    var base , top : pNode;
        s : string;
        number : real;
        item : data;
    
    begin
        base := NIL;
        top := NIL;
        randomize;

        getRandomStack(base , top , random(10) + 3);

        writeln('this is the stack now : ');
        print(base);

        writeln;

        s := readString('type the string to push it to the stack : ');
        number := readReal('type the real number to push it to the stack : ');

        writeln;

        push(base , top , number , s);
        print(base);

        writeln;

    
        item := pop(base , top);

        if (item.str = 'empty') then writeln('stack is empty')
        else 
            begin 
                writeln('this is the item popped out of the stack : ');
                writeln('number = ' , item.number , ' , string = ' , item.str);
            end;
        
        writeln;
        
        writeln('this is the stack now : ');

        print(base);

        free(base , top);        
    end;

begin
    main();
end.