uses stackArray;

procedure main();

    var top : integer;
        arr : stack;
        i : integer;

    begin
        top := init_stack();

        for i := 1 to size do 
            push(arr , top , i);
    
        
        print(arr , top);

        // writeln(top);

        reverse(arr , top);

        print(arr , top);
    end;

begin 
    main();
end.