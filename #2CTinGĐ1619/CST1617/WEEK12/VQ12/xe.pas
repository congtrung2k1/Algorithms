Const FI='XE.inp';
      FO='XE.out';

Var d1,d2,x,y: array [1..10000] of longint;
    ans: int64;
    n,i,j,t: longint;
    f: text;

Procedure Init;
 Begin
 Assign(f,fI); reset(F);
 Readln(f,n);
 For n:=1 to n do
  readln(f,x[n],y[n]);
 Close(f);
 End;

Function Dt(u,v,z: longint): boolean;
 Var vecto,vecto1: record x,y:longint end;
 Begin
 vecto.x:=x[u]-x[v]; vecto.y:=y[u]-y[v];
 vecto1.x:=-vecto.y; vecto1.y:=vecto.x;
 If vecto1.x*(x[z]-x[u]) +vecto1.y*(y[z]-y[u])<0
  then exit(true) else exit(false);
 End;

Procedure Try;
 Begin
 i:=1;
 Repeat
 If dt(i,i+1,i+2) then begin ans:=ans+20000; inc(t);
                             d1[t]:=x[i+1]; d2[t]:=y[i+1];
                        end;
 inc(i);
 Until i=n-1;
 Assign(f,FO); rewrite(F);
 Writeln(f,t);
 For t:=1 to t do writeln(f,D1[t],' ',d2[t]);
 Writeln(f,ans);
 Close(F);
 End;


Begin
 Init;
 Try;
End.
