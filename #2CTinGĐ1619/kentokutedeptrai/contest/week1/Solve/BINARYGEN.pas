var s: ansistring;
    n,i: longint;

BEGIN
    readln(n);
    readln(s);
    for i:=n downto 1 do
      if s[i]='0' then
        begin s[i]:='1'; break; end else s[i]:='0';

    if i=1 then
      if s[i]='0' then s:='-1';

    writeln(s);
END.