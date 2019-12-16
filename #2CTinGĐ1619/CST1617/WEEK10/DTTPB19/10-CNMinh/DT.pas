USES MATH;
CONST FI='DT.INP';
      FO='DT.OUT';
TYPE LIST= RECORD
     X,Y,Z: LONGINT;
     END;
VAR A: ARRAY [0..500005] OF LIST;
    BIT: ARRAY [0..500005] OF LONGINT;
    N: LONGINT;
    F: TEXT;


Procedure Init;
 Var i,p: Longint;
 Begin
 Assign(f,fi); reset(F);
 Readln(f,n);
 For i:=1 to n do Begin Read(f,p); A[p].x:=i; End;
 Readln(F);
 For i:=1 to n do Begin Read(f,p); A[p].y:=i; End;
 Readln(f);
 For i:=1 to n do Begin Read(f,p); A[p].z:=i; End;
 Close(F);
 End;

procedure sort(l,r: longint);
 var i,j,x: longint;
     y: List;
 begin
 i:=l; j:=r;
 x:=a[(l+r) div 2].x;
 repeat
 while a[i].x<x do inc(i);
 while x<a[j].x do dec(j);
 if not(i>j) then begin
                  y:=a[i]; a[i]:=a[j]; a[j]:=y;
                  inc(i); dec(j);
                  end;
 until i>j;
 if l<j then sort(l,j);
 if i<r then sort(i,r);
 End;

Function Get(U: Longint): Longint;
 Var Kq: Longint;
 Begin
 Kq:=n+1;
 While u>0 do
  Begin
  Kq:=Min(Kq,Bit[u]);
  U:=u-(u And (-u));
  End;
 Exit(KQ);
 End;


Procedure Update(u,Val: longint);
 Begin
 While u<=n do
  Begin
  Bit[u]:=Min(Bit[u],Val);
  u:=U+(U and (-U));
  end;
 End;

Procedure Try;
 Var i,Dem,Gt: Longint;
 Begin
 For i:=1 to n do Bit[i]:=N+1;
 Sort(1,n);
 Dem:=0;
 For i:=1 to n do
  Begin
  Gt:=Get(A[i].z);
  If GT>A[i].y then inc(dem);
  Update(A[i].z,A[i].y);
  end;
 Assign(f,fo); Rewrite(F);
 Writeln(f,Dem);
 Close(F);
 end;


Begin
 Init;
 try;
End.
