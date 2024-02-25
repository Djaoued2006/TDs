program updateNewdate;


procedure findNewDate(number : integer ; var d , y , m : integer);
    
    var i  : integer;

    begin 

        i := 1;
        m := 1;
        y := 2014;

        while number >= 0 do 

            begin 

                d := number;

                case i of 
                    1 : begin 
                            number := number - 31;
                            m := m + 1;
                        end;
                    2 : begin 
                            number := number - 28;
                            m := m + 1;
                        end;
                    3 : begin 
                            number := number - 31;
                            m := m + 1;
                        end;
                    4 : begin 
                            number := number - 30;
                            m := m + 1;
                        end;
                    5 : begin 
                            number := number - 31;
                            m := m + 1;
                        end;
                    6 : begin 
                            number := number - 30;
                            m := m + 1;
                        end;
                    7 : begin 
                            number := number - 31;
                            m := m + 1;
                        end;
                    8 : begin 
                            number := number - 31;
                            m := m + 1;
                        end;
                    9 : begin 
                            number := number - 30;
                            m := m + 1;
                        end;
                    10 : begin 
                            number := number - 31;
                            m := m + 1;
                        end;
                    11 : begin 
                            number := number - 30;
                            m := m + 1;
                        end;
                    12 : begin 
                            number := number - 31;
                            m := m + 1;
                        end;
                    end;
                
                i := i + 1;

            end;
        d := d + 1;
    end;


var d , y , m , number : integer;

begin 

    write('type a number : ');readln(number);
    findNewDate(number , d  , y , m);
    writeln('the updated date is : ' , y , '/' , m - 1, '/' , d)
end.