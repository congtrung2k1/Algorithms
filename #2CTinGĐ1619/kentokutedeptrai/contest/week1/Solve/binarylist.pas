var n,k,m,s:longint;
    f:array[1..10001,0..9999]of longint;
    out:array[1..10000]of longint;

procedure look_up(i,z:longint);
var j:longint;
begin
  if i>n then exit;
  if m>=k then
  begin
    dec(m,f[i,z]);
    for j:=0 to 1 do
      if (z<s-1) or (j=1) then
      begin
        if j=0 then inc(m,f[i+1,z+1])
        else inc(m,f[i+1,0]);
        if m>=k then
        begin
          out[i]:=j;
          if j=0 then look_up(i+1,z+1)
          else look_up(i+1,0);
          exit
        end
      end
  end;
  if f[i,z]>-1 then exit;
  f[i,z]:=0;
  for j:=0 to 1 do
    if (z<s-1) or (j=1) then
    begin
      if j=0 then
      begin
        look_up(i+1,z+1);
        if m>=k then
        begin out[i]:=j; exit end;
        inc(m,f[i+1,z+1]); inc(f[i,z],f[i+1,z+1])
      end
      else
      begin
        look_up(i+1,0);
        if m>=k then
        begin out[i]:=j; exit end;
        inc(m,f[i+1,0]); inc(f[i,z],f[i+1,0])
      end;
      if m>=k then
      begin
        out[i]:=j;
        if j=0 then look_up(i+1,z+1)
        else look_up(i+1,0);
        exit
      end
    end;
  dec(m,f[i,z])
end;

begin
  read(n,k,s);
  fillchar(f,sizeof(f),255);
  for s:=1 to s do f[n+1,s-1]:=1;
  m:=0;
  look_up(1,0);
  if m=0 then write(-1)
  else
    for n:=1 to n do
      write(out[n],#32)
end.
