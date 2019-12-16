CONST FI='CEDAR.INP';
      FO='CEDAR.OUT';
TYPE LIST=RECORD
     X,Y: LONGINT; END;

VAR M,N,I,J,U,V: LONGINT;
    A: ARRAY [0..101,0..101] OF LONGINT;
    W,L,R,KQN,KQM,T: ARRAY [0..101] OF LONGINT;
    TRACE: ARRAY [0..101,0..101] OF LIST;
    F: TEXT;

Procedure Init;
 Begin
 Assign(f,FI); Reset(F);
 Readln(f,M);
 For m:=1 to m do Readln(F,L[m],R[m]);
 Readln(f,n);
 For n:=1 to n do Begin Read(f,W[n]); T[n]:=n; End;
 W[0]:=-maxlongint;
 W[n+1]:=maxlongint;
 Close(F);
 End;


Procedure Swap(Var x,y: longint);
 Var tmp: longint;
 Begin
 Tmp:=x; x:=y; y:=tmp;
 End;

procedure sort(l,r: longint);
 var i,j,x,y: longint;
 begin
 i:=l; j:=r;
 x:=w[(l+r) div 2];
 repeat
 while w[i]<x do inc(i);
 while x<w[j] do dec(j);
 if not(i>j) then begin
                Swap(w[i],w[j]);
                Swap(t[i],t[j]);
                inc(i); dec(j);
                end;
 until i>j;
 if l<j then sort(l,j);
 if i<r then sort(i,r);
 end;

Procedure Try;
 Begin
 Sort(1,N);
 For n:=1 to n do A[n,1]:=1;
 For m:=1 to m do A[1,m]:=1;
 For i:=2 to n do
  For j:=2 to m do
   Begin
   A[i,j]:=A[i-1,j];
   Trace[i,j].x:=i-1;
   Trace[i,j].y:=j;
   u:=1;
   While W[u]+L[J]<=W[i] do
    Begin
    For v:=1 to m do
     IF W[u]+R[v]<=W[i] then
      IF a[u,v]+1>A[i,j] then
       begin
       A[i,j]:=a[u,v]+1;
       Trace[i,j].x:=u;
       Trace[i,j].y:=v;
       end;
     Inc(u);
     End;
    End;
 End;

PRocedure INKQ;
 Var Ans,h: longint;
 Begin
 Ans:=0;
 For i:=1 to m do if A[n,i]>ans then Begin ans:=a[n,i]; j:=i; end;
 i:=n;
 h:=0;
 While i<>0 do
  begin
  u:=Trace[i,j].x;
  v:=trace[i,j].y;
  If u<>0 then
   begin
   if A[u,v]+1=a[i,j] then begin inc(h); KQN[h]:=i; KQM[h]:=j; end;
   end
    else
     begin Inc(h); KQN[h]:=i; KQM[h]:=j; End;
  I:=u;
  J:=v;
  End;
 Assign(f,FO); Rewrite(F);
 Writeln(F,ans);
 For i:=h downto 1 do
  Writeln(F,T[KQN[i]],' ',KQM[i]);
 Close(F);
 End;

Begin
 Init;
 Try;
 InKQ;
End.
