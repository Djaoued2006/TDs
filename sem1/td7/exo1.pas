// search algorithms 
   
const size = 100;

type arr = array[1..size] of integer;

// 1 : unsorted array!!
function find(target : integer , nums : arr) : boolean;

    var  i : integer;
        result : boolean;

    begin
        result := False;

        for i := 1 to size do 
            if (nums[i] = target) then 
                begin
                    result := True;
                    break;
                end; 

        find := result;
    end;

// 2 : sorted arrays

    // 1 : increasingly!!

function findSorted(target : integer ; nums : arr) : boolean;

    var result : boolean;
        mid , start , endd : integer;

    begin
        start := 0;
        endd := size;
        result := False;

        while (start <= endd) do 
            
            if (result) then 
                break;

            mid := (start + endd) div 2;
            
            if (arr[mid] = target) then 
                result := True
            else 
                if (arr[mid] < target) then 
                    begin
                        start := mid + 1; 
                    end
                else 
                    begin
                        endd := mid - 1; 
                    end;
        
        find := result;
    end;
 
    // 2 : decreasingly!!

function findSorted3(target : integer ; nums : arr) : boolean;

    var found : boolean;
        start , mid , endd : integer;
    
    begin
        start := 0;
        endd := size;
        found := false;

        while (start <= endd) do 

            if found then break;

            mid := (start + endd) div 2;

            if (nums[i] = target) then 
                found := True
            else 
                if (nums[i] > target) then 
                    start := mid + 1
                else 
                    endd := mid - 1;
        
        findSorted3 := result;
            
    end;
  