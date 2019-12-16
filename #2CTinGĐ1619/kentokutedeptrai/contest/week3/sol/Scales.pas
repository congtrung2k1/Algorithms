const fi = 'scales.inp';
      fo = 'scales.out';
var ans: array [0..35] of int64;
    a: array [1..1000000] of longint;
    s: string;
    i,d: longint;
    n: int64;

procedure init;
  var f: text; i: longint;
  begin
      assign(f,fi); reset(f); read(f,n); close(f);
      ans[0]:=1;
      for i:=1 to 35 do ans[i]:=ans[i-1] * 3;
  end;

procedure out;
  var f: text;
      i: longint;
  begin
      assign(f,fo); rewrite(f);
      write(f,n,' ');
      for i:=1 to n do write(f,ans[a[i]],' ');
      writeln(f);
      write(f,d,' ');
      for i:=length(s) downto 1 do
        if s[i]='1' then write(f,ans[length(s)-i],' ');
      close(f);
  end;

BEGIN
    init;

    s:='';
    while n>0 do
      begin
          s:= chr(n mod 3 + 48) + s;
          n:=n div 3;
      end;
    s:='0'+s;

    n:=0; i:=length(s);
    while i>0 do
      if s[i]<>'2' then dec(i)
      else begin
               inc(n); a[n]:=length(s)-i;
               while s[i]='2' do
                 begin
                     s[i]:='0'; dec(i);
                 end;
               inc(s[i]);
           end;

    d:=0;
    for i:=1 to length(s) do
      if s[i]='1' then inc(d);
    out;
END.