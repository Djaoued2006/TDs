// selection sort 

program selectionSort;

const size = 256;

type arr = array[1..size] of integer;

//swap function 

procedure swap(x , y : integer);

    var tmp : integer;

    begin
        tmp := x;
        x := y;
        y := tmp; 
    end;

// croissant

procedure sort(var nums : arr);

    var i , j ,tmp : integer;

    begin
        for i := 1 to size do 
            for j := i + 1 to size do
                begin
                    tmp := nums[i];
                    nums[i] := nums[j];
                    nums[j] := tmp; 
                end; 
    end;

// decroissant

procedure sortt(var nums : arr);

    var i , j , tmp : integer;

    begin
        for i := size downto 1 do 
            for j := i - 1 to 1 do 
                begin
                    tmp := nums[i];
                    nums[i] := nums[j];
                    nums[j] := tmp;
                end;
    end;

// sorting

procedure sorttt(var nums : arr; c : char);

    begin
        if c = 'C' then sort(nums)
        else 
            if c = 'D' then sortt(nums)
            else 
                writeln('Invalid input');
    end;

// bubble sort
 
procedure bubbleSort(nums : arr);

    var i , j : integer;

    begin
        for i := 1 to size do 
            for j := i + 1 to size - i do 
                if (nums[i] > nums[i+1]) then 
                    swap(nums[i] , nums[i+1])

    end;