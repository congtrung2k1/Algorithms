const fi='RGDAY.INP';
      fo='RGDAY.OUT';
      infi=maxlongint;
var test:byte;
    f:text;
    a:array[0..201] of longint;
    b:array[0..201] of boolean;
    c,t:array[0..201,0..201] of longint;
    n:longint;

procedure Try;
var i,j,k,l,x:longint;
begin
  for i:= 1 to n do
    for j:=1 to n do
      if i>=j then c[i,j]:=0
      else c[i,j]:=infi;
  for l:=2 to n do
    for i:=1 to n-l+1 do
      begin
        j:=i+l-1;
        for k:=1 to j-1 do
         if (c[i,k]<infi)and(c[k+1,j]<infi) then
          begin
            x:=c[i,k]+c[k+1,j]+a[i]*a[k+1]*a[j+1];
            if x < c[i,j] then
              begin
                c[i,j]:=x;
                t[i,j]:=k;
              end;
          end;
      end;
end;

procedure trace(i,j:integer);
var k,l:integer;
begin
  if i<j then
    begin
      k:= t[i,j];
      trace(i,k);
      trace(k+1,j);
      for l:=i+1 to j do if b[l] then break;
      write(f,l,' ');b[l]:=false;
    end;
end;

procedure Init;
begin
  assign(f,fi); reset(f);
  readln(f,n);
  for n:=1 to n do read(f,a[n]);
  close(f);
  dec(n);
  Try;
  assign(f,fo);rewrite(f);
  writeln(f,c[1,n]);
  fillchar(b,sizeof(b),true);
  trace(1,n);
  close(f);
end;


Begin
 Init;
End.
