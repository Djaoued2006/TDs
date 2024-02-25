program notes;

var number , i : integer;
    mark , lowest , largest , sum , best , worst : integer;

begin

    write('type the number of students in the class : ');readln(number);

    // for loop
    for i := 1 to number do
    begin
        if (i = 1) then 
        begin  
            write('type the mark of the student number ' , i , ' : ');readln(mark);
            lowest := mark;
            best := i;
            worst := i ;
            largest := lowest;
            sum := mark;
        end
        else 
            write('type the mark of the student number ' , i , ' : ');readln(mark);
            if mark > largest then
            begin
                largest := mark;
                best := i ;
            end;
            if mark < lowest then
            begin 
                lowest := mark;
                worst := i;
            end;
            sum := sum + mark;
        end;
    end;
    
    writeln('Total Number of Students: ' , number);
    writeln('Lowest mark : ' , lowest , ' gotten by the student number : ' , best );
    writeln('Largest mark : ' , largest , ' gotten by the student number : ' , worst);
    writeln('The average is : ' , sum / number);

    writeln();
    writeln('==================================================================');
    writeln();

    // while loop 
    while (i > 0) do
    begin
        if (i = number) then 
        begin  
            write('type the mark of the student number ' , number - i + 1 , ' : ');readln(mark);
            lowest := mark;
            best := number - i + 1;
            worst := number - i + 1 ;
            largest := lowest;
            sum := mark;
        end
        else 
            write('type the mark of the student number ' , number - i + 1 , ' : ');readln(mark);
            if mark > largest then
            begin
                largest := mark;
                best := number - i + 1 ;
            end;
            if mark < lowest then
            begin 
                lowest := mark;
                worst := number - i + 1;
            end;
            sum := sum + mark
        end;
        i := i - 1
    end;
    writeln('Total Number of Students: ' , number);
    writeln('Lowest mark : ' , lowest , ' gotten by the student number : ' , best );
    writeln('Largest mark : ' , largest , ' gotten by the student number : ' , worst);
    writeln('The average is : ' , sum / number);

    writeln();
    writeln('==================================================================');
    writeln();

    // repeat loop
    repeat 
    i := i + 1;
    for i := 1 to number do
    begin
        if (i = 1) then 
        begin  
            write('type the mark of the student number ' , i , ' : ');readln(mark);
            lowest := mark;
            best := i;
            worst := i ;
            largest := lowest;
            sum := mark;
        end
        else 
            write('type the mark of the student number ' , i , ' : ');readln(mark);
            if mark > largest then
            begin
                largest := mark;
                best := i ;
            end;
            if mark < lowest then
            begin 
                lowest := mark;
                worst := i;
            end;
            sum := sum + mark;
        end
    until(i = number);
    writeln('Total Number of Students: ' , number);
    writeln('Lowest mark : ' , lowest , ' gotten by the student number : ' , best );
    writeln('Largest mark : ' , largest , ' gotten by the student number : ' , worst);
    writeln('The average is : ' , sum / number);

end.