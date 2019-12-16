var n,i,x,top: longint;
    h,s,f,ans: array [0..1000001] of longint;

procedure init;
  var i,j: longint;
  begin
      read(n);
      for i:=0 to n-1 do read(h[i]);
      for i:=0 to n-1 do read(s[i]);
      fillchar(f,sizeof(f),0);
      fillchar(ans,sizeof(ans),0);
  end;

BEGIN
    init;

    top:=0;
    for i:=n-1 downto 0 do
      begin
          inc(top);
          while (h[i] > h[f[top-1]]) and (top>1) do dec(top);
          f[top]:=i;
          if top <= s[i] then ans[i]:=-1 else ans[i]:=h[f[top-s[i]]];
      end;

    for i:=0 to n-1 do write(ans[i],' ');
END.