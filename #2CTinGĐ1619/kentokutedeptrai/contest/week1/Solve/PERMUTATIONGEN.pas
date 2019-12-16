var s: array [1..100000] of longint;
    n,i,k,a,b: longint;

procedure swap(var a,b: longint);
  var tmp: longint;
  begin
      tmp:=a; a:=b; b:=tmp;
  end;

BEGIN
    read(n);               
    for i:=1 to n do read(s[i]);

    i:=n-1;
    while (i>0) and (s[i]>s[i+1]) do dec(i);
    if i=0 then writeln(-1)
    else  begin
              k:=n;
              while (s[k] < s[i]) do dec(k);
              swap(s[k],s[i]);
              a:=i+1; b:=n;
              while a<b do
                begin
                    swap(s[a],s[b]);
                    inc(a); dec(b);
                end;
              for i:=1 to n do write(s[i],' ');
              writeln;
          end;
END.