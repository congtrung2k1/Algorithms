Const Fi='ranking2.inp';
      FO='ranking2.out';
      maxn=10000000;

Var a,l,t: array [1..maxn] of longint;
    n,x,m: longint;
    f,g: text;


Function Find(x: longint):longint;
 Begin
 find:=0;
 While x<=maxn do begin find:=find+t[x]; x:=x+x and (-x); end;
 end;

Procedure Up(x:longint);
 Begin
 While x>0 do begin inc(t[x]); x:=x-x and (-x); end;
 end;


Procedure Init;
 Begin
 Assign(F,FI); reset(F);
 Assign(g,FO); rewrite(G);
 Readln(f,n,m);
 Read(f,a[1]);
 l[1]:=0; up(a[1]);
 For n:=2 to n do begin read(f,a[n]); l[n]:=find(a[n]+1); up(a[n]); end;
 Readln(F);
 For m:=1 to m do begin readln(f,x); writeln(g,l[x]+1); end;
 Close(F); close(G);
 End;

Begin
 Init;
End.

