program te;

type time = record 
    hour , minutes , seconds : integer
    end;

type date = record
    day , month , year : integer;
    end;

type dateANDtime = record 
    d : date;
    t : time;
    end;

procedure readtime(t : time);

    begin 
        repeat 
            writeln();
            writeln('INSERT A TIME!!');
            write('type the hour : ');readln(t.hour);
            write('type the minutes : ');readln(t.minutes);
            write('type the seconds : ');readln(t.seconds);
        until((t.hour >= 0) and (t.hour < 25) and (t.minutes >= 0) and (t.minutes < 61) and (t.seconds >= 0) and (t.seconds < 61));
    end;

procedure readdate(d : date); 

    begin 
        repeat 
            writeln();
            writeln('INSERT A DATE!!');
            write('type the day : ');readln(d.day);
            write('type the month : ');readln(d.month);
            write('type the year : ');readln(d.year);
        until((d.year >= 0) and (d.day >= 0) and (d.day < 32) and (d.month >= 0) and (d.month < 13));
    end;

procedure readdateANDtime(dt : dateANDtime);

    begin 
        repeat 
            writeln();
            writeln('INSERT A DATE!!');
            write('type the day : ');readln(dt.d.day);
            write('type the month : ');readln(dt.d.month);
            write('type the year : ');readln(dt.d.year);
        until((dt.d.year >= 0)and (dt.d.day >= 0) and (dt.d.day < 32) and (dt.d.month >= 0) and (dt.d.month < 13));
    end;

function checkDate(d1 , d2 : date) : boolean ;

    begin
        checkDate := (d1.year = d2.year) and (d1.month = d2.month) and (d1.day = d2.day) 
    end;

function checkTime(t1 , t2 : time): boolean;

    begin
        checkTime := (t1.hour = t2.hour) and (t1.minutes = t2.minutes) and (t1.seconds = t2.seconds) 
    end;

procedure checkDateANDTime (dt1 , dt2 : dateANDtime ; var equal , lessTHAN : boolean);

    begin
        equal := checkTime(dt1.t , dt2.t) and checkDate(dt1.d , dt2.d);

        if not equal then  
            begin
                if (dt1.d.year = dt2.d.year) then   
                    if (dt1.d.month = dt2.d.month) then 
                        if (dt1.d.day = dt2.d.day) then 
                            if (dt1.t.hour = dt2.t.hour) then 
                                if (dt1.t.minutes = dt2.t.minutes) then 
                                    if (dt1.t.seconds > dt2.t.seconds) then 
                                        lessTHAN := False
                                    else 
                                        lessTHAN := True
                                else 
                                    if (dt1.t.minutes > dt2.t.minutes) then 
                                        lessTHAN := False
                                    else 
                                        lessTHAN := True
                            else 
                                if (dt1.t.hour > dt2.t.hour) then 
                                    lessTHAN := False
                                else 
                                    lessTHAN := True
                        else 
                            if (dt1.d.day > dt2.d.day) then 
                                lessTHAN := False
                            else 
                                lessTHAN := True
                    else 
                        if (dt1.d.month > dt2.d.month) then 
                            lessTHAN := False
                        else 
                            lessTHAN := True
                else 
                    if (dt1.d.year > dt2.d.year) then 
                        lessTHAN := False
                    else 
                        lessTHAN := True
            end;
    end;

var t1 , t2 : time;
    d1 , d2 : date;
    dt1 , dt2 : dateANDtime;
    equal , lessTHAN : boolean;

begin
    readtime(t1);
    readtime(t2);
    if checkTime(t1 , t2) then 
        writeln('the given times are equal')
    else 
        writeln('the given times are not equal');
    
    readdate(d1) ;
    readdate(d2);

    if checkDate(d1 , d2) then
        writeln('the given dates are equal')
    else 
        writeln('the given dates are not equal');

    readdateANDtime(dt1);
    readdateANDtime(dt2);

    checkDateANDTime(dt1 , dt2 , equal , lessTHAN);

    if equal then 
        writeln('the given dates and times are equal')
    else 
        if lessTHAN then 
            writeln('the date and time 1 are less than the date and time 2')
        else 
            writeln('the date and time 2 are less than the date and time 1')

end.