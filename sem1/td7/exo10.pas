program find;

const size = 25;

type matrix = array[1..size , 1..size] of char;

procedure fill(var nums : matrix);

    var i , j : integer;

    begin
        for i := 1 to size do 
            for j := 1 to size do
                nums[i , j] := chr(random(25) + 65);
    end;

function find_C(nums : matrix ;chara : char) : boolean;

    var i , j : integer;
        found : boolean;

    begin

        found := false;

        for i := 1 to size do
            begin
                for j := 1 to size do 
                    if (nums[i , j] = chara) then 
                        begin 
                            found := True; 
                            break;
                        end;
               
                if found then 
                    break;
            end;

        find_C := found;
    end;

function count_chars(nums : matrix ; chara : char) : integer;

    var i , j ,  count : integer;

    begin

        count := 0;

        for i := 1 to size do 
            for j := 1 to size do   
                if (nums[i , j] = chara) then 
                    count := count + 1;

        count_chars := count;

    end;

procedure findCoordinate(var nums : matrix ; chara : char);

    var i , j : integer;
        found : boolean;

    begin
        found := false;

        for i := 1 to size do
            begin 
                for j := 1 to size do
                    if (nums[i , j] = chara) then 
                        begin
                            writeln('the coordinates are : (' , i , ',' , j , ')');
                            found := True;
                            break;
                        end;
                if found then break;
            end;
        
        if not found then 
            writeln('coordinates : (0,0)')
    end;

var nums : matrix;
    chara : char;

begin
    write('Type a char : ');readln(chara);
    fill(nums);
    writeln(chara , ' exists : ' , find_C(nums , chara));
    writeln('The number of times ' , chara , ' shows up in the matrix is : ' , count_chars(nums , chara));
    findCoordinate(nums , chara);
end.