program exo6;

const size = 100;

type T1 = array[1..size] of char;

var tab : T1;
    i , c : integer;

procedure replace_maj_min();

    var i : integer;

    begin
        for i := 1 to size do 
            begin 
                if (ord(tab[i]) > 96) then // that means all the chars >= a
                    tab[i] := chr(ord(tab[i]) - 32);
            end; 
    end;
 
begin
    randomize;

    for i := 1 to size do 
        begin
            c := random(2);
            if c = 1 then 
                tab[i] := chr(random(26) + 65)
            else 
                tab[i] := chr(random(26) + 97);
        end;
    
    for i := 1 to size do 
        write(tab[i] , ' ');

    replace_maj_min();

    for i := 1 to 3 do
        writeln;

    for i := 1 to size do 
        write(tab[i] , ' ');
end.
