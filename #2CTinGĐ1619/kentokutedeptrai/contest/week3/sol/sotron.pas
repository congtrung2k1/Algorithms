var s: string;
    n: int64;
    i: longint;

BEGIN
    read(n); dec(n); 

    s:='';
    while n<>0 do
      begin
          s:=s + chr(n mod 2 + 48);
          n:= n div 2;
      end;
    while s[1]='0' do delete(s,1,1);
    for i:=1 to length(s) do
      if s[i]='1' then write('5') else write('0');
    writeln;
END.