Const FI='Nhiphan.inp';
      FO='Nhiphan.out';

Var a,s: array [0..33,0..33] of int64;
    kq,pos: int64;
    s1: string;
    i,j,n,k,t: longint;
    f,g: text;

Procedure Init;
 Begin
 Assign(f,FI); reset(F); Assign(g,FO); rewrite(G);
 Readln(f,n,k);
 Readln(f,pos);
 Readln(F,s1);
 Close(f);
 End;

Procedure Try1;
 Begin
 For i:=0 to n do a[0,i]:=1;
 For j:=1 to 32 do
  For i:=1 to j do
   a[i,j]:=a[i,j-1]+a[i-1,j-1];
 For i:=1 to N+1 do
  Begin
  if i>K then j:=N-i+2 else j:=N-k+1;
  S[i,j]:=1;
  End;
 For i:=N downto 1 do
  Begin
  if i>K then j:=N-i+1 else j:=N-K;
   For j:=j downto 1 do S[i,j]:=S[i,j+1]+S[i+1,j];
 End;
 kq:=0;
 For i:=K to N do kq:=kq+A[i,N];
 Writeln(g,KQ);
 End;

Procedure Try2;
 Var u,v,tmp,i,j,x: longint;
 Begin
 If pos>kq then begin write(g,'-1'); exit; end;
 i:=1; j:=1;
 For x:=1 to N do
  if pos>s[i,j+1] then
   Begin
   Write(g,1);
   pos:=pos-S[i,j+1];
   inc(i);
   End else Begin Write(g,0); inc(j); End;
 end;


PRocedure Try3;
 Var x: longint;
 Begin
 Writeln(g);
 i:=1; j:=1; kq:=1;
 For x:=1 to N do
  if S1[x]='0' then inc(j) else
  Begin
  kq:=kq+S[i,j+1];
  inc(i);
  End;
 Write(g,kq);
 Close(G);
 End;

Begin
 Init;
 Try1;
 Try2;
 Try3;
End.
