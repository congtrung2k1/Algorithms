Const Fi='ranking1.inp';
      FO='ranking1.out';
      max=100000;

Var a: array [1..max] of qword;
    id,l,t: array [1..max] of longint;
    n,x,m: longint;
    f,g: text;

procedure sort(l,r: longint);
var i,j,y: longint;
    x: qword;
begin
i:=l; j:=r;
x:=a[id[(l+r) div 2]];
repeat
 while a[id[i]]<x do inc(i);
 while x<a[id[j]] do dec(j);
 if not(i>j) then
 begin
 y:=id[i]; id[i]:=id[j]; id[j]:=y;
 inc(i);
 j:=j-1;
 end;
until i>j;
if l<j then sort(l,j);
if i<r then sort(i,r);
end;

Function calc(x: longint):longint;
 Begin
 calc:=0;
 While x<=max do begin calc:=calc+t[x]; x:=x+x and (-x); end;
 end;

Procedure Up(x:longint);
 Begin
 While x>0 do begin inc(t[x]); x:=x-x and (-x); end;
 end;


Procedure Init;
 Var i: longint;
 Begin
 Assign(F,FI); reseT(F);
 Assign(g,FO); rewrite(G);
 Readln(f,n,m);
 For i:=1 to n do begin read(f,a[i]); id[i]:=i; end;
 Sort(1,n);
 For i:=1 to n do a[i]:=id[i];
 For i:=1 to n do begin l[i]:=calc(a[i]+1); up(a[i]); end;
 For i:=1 to m do begin readln(f,x); writeln(g,l[x]+1); end;
 Close(F); close(G);
 End;

Begin
 Init;
End.

