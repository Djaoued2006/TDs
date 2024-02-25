program findPrimes;


var i , j , count: int64;
    isPrime : boolean;

begin 

    count := 0;
    i := 2;

    while count < 50000 do 

        begin 

            isPrime := True;

            for j := 2 to (i div 2) do 

                begin

                    if (i mod j = 0) then 
                        begin 
                          isPrime := False;
                          break;
                        end;

                end;  

            if isPrime then 

                begin 

                    count := count + 1;
                    writeln('[' , count , '] : ',i);

                end;

            i := i + 1

        end;
    
end.