program findPosition;

const rows = 100;
    cols = 40;

type matrix = array[1..rows , 1..cols] of char;

var tab : matrix;
    chara : char;
    number : integer;
    
procedure position(number : integer; chara : char);

    var i , j : integer;
        count : integer;

    begin
        count := 0;

        i := 1;

        while (i <= rows) and (count <> number) do 
            begin 
                j := 1;
                while (j <= cols) and (count <> number) do
                    begin
                        if (tab[i , j] = chara) then 
                            count := count + 1;
                        
                        j := j + 1;
                    end;
             
                i := i + 1;
            end;
        
        if (count = number) then 
            writeln('the coordinates of the ' , number , ' occurence of ' , chara , ' in the matrix is : (' ,(i - 1) , ',' , (j - 1) , ')')
        else 
            writeln(chara , ' exist only ' , count , ' times in the matrix');
    end;

procedure fill_matrix(); 
    
    var i , j : integer;

    begin
        for i := 1 to rows do 
            for j := 1 to cols do 
                begin
                    tab[i] := chr(random(26) + 65); 
                end;
    end;

begin
    write('Type a char : ');readln(chara);
    write('how much times you want : ');readln(number);
    fill_matrix();
    position(number , chara)

end.
