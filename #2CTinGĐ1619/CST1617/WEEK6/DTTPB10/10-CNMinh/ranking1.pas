Const Fi='ranking1.inp';
      FO='ranking1.out';
      max=1000001;

Var a,l,t,b,id: array [0..max] of int64;
    n,x,m,i,j,d: longint;
    f,g: text;

procedure sort(l,r: longint);
 var i,j: longint;
     x,y: int64;
 begin
 i:=l;
 j:=r;
 x:=a[(l+r) div 2];
 repeat
 while a[i]<x do inc(i);
 while x<a[j] do dec(j);
 if not(i>j) then
  begin
  y:=a[i]; a[i]:=a[j]; a[j]:=y;
  y:=id[i]; id[i]:=id[j]; id[j]:=y;
  inc(i);
  j:=j-1;
  end;
 until i>j;
 if l<j then sort(l,j);
 if i<r then sort(i,r);
 end;

Function Find(x: longint):longint;
 Begin
 find:=0;
 While x<=max do begin find:=find+t[x]; x:=x+x and (-x); end;
 end;

Procedure Up(x:longint);
 Begin
 While x>0 do begin inc(t[x]); x:=x-x and (-x); end;
 end;


Procedure Init;
 Begin
 Assign(F,FI); reseT(F);
 Assign(g,FO); rewrite(G);
 Readln(f,n,m);
 For i:=1 to n do begin read(f,a[i]); id[i]:=i; end;
 Sort(1,n);
 d:=0;
 For i:=2 to n do if a[i]=a[i-1] then b[id[i]]:=b[id[i-1]] else
            begin inc(d); b[id[i]]:=d; end;
 For n:=1 to n do begin l[n]:=find(b[n]+1); up(b[n]); end;
 For m:=1 to m do begin readln(f,x); writeln(g,l[x]+1); end;
 Close(F); close(G);
 End;

Begin
 Init;
End.

