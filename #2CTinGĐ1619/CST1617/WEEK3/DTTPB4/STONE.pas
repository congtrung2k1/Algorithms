CONST FI='STONE.INP';
      FO='STONE.OUT';
VAR FX,B,t: ARRAY [1..500] OF LONGINT;
    A: ARRAY [1..500,1..500] OF LONGINT;
    N,SL,x: LONGINT;
    F: TEXT;


Procedure Init;
 Var i: longint;
 Begin
 Assign(F,FI); Reset(F);
 Readln(f,n);
 For i:=1 to n do
  begin
  read(f,x,t[x]);
  For sl:=1 to t[x] do read(f,a[x,sl]);
  Readln(F);
  end;
 Close(F);
 End;

procedure sort(l,r: longint);
 var i,j,x,y: longint;
 begin
 i:=l; j:=r;
 x:=b[(l+r) div 2];
 repeat
 while b[i]>x do inc(i);
 while x>b[j] do dec(j);
  if not(i>j) then
   begin
   y:=b[i];
   b[i]:=b[j];
   b[j]:=y;
   inc(i); dec(j);
   end;
 until i>j;
 if l<j then sort(l,j);
 if i<r then sort(i,r);
 end;

Procedure DFS(u: longint);
 Var m,ans,now,i: longint;
 Begin
 m:=t[u];
 IF m=0 then begin fx[u]:=1; exit; end;
 For i:=1 to m do dfs(a[u,i]);
 For i:=1 to m do b[i]:=fx[a[u,i]];
 Sort(1,m);
 ans:=0;
 now:=0;
 For i:=1 to m do
  if now<b[i] then begin ans:=ans+(b[i]-now); now:=b[i]-1; end
   else dec(now);
 fx[u]:=ans;
 End;

Procedure Try;
 Begin
 dfs(1);
 Assign(F,FO); Rewrite(F);
 Writeln(F,fx[1]);
 Close(F);
 End;


Begin
 Init;
 Try;
End.
