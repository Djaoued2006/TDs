program calcSum;

const number = 9;

function calc() : integer;

    var i , j , sum  : integer;
        matrix : array[1..number] of array[1..number] of integer;


    begin
        for i := 1 to number do 
            for j := 1 to number do 
                matrix[i][j] := random(1000);

        sum := 0;

        for i := 1 to number do 
            sum := sum + matrix[i][i];

        calc := sum;
    end;

begin
    writeln(calc());
end.