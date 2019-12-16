//Cao Nguyet Minh -12Ctin -LHP
Uses math;
Const FI='SPEED.inp';
      FO='SPEED.OUT';

VAR A,T,L: ARRAY [0..151,0..151] OF LONGINT;
    XET: ARRAY [0..151] OF BOOLEAN;
    D,D1: ARRAY [0..151] OF REAL;
    TRACE,B: ARRAY [-1..151] OF LONGINT;
    N,X,M,I,J,K,U,V,S,t1: LONGINT;
    TMP: REAL;
    F: TEXT;


PROCEdure Init;
 Begin
 Assign(f,FI); Reset(f);
 Readln(f,n,m,x);
 For m:=1 to m do begin
  Readln(f,i,j,v,k);
  If v=0 then a[i,j]:=-1 else a[i,j]:=v;
  L[i,j]:=k;
  end;
 Close(F);
 End;

Procedure Dji;
 Begin
 For i:=0 to n-1 do d[i]:=100000;
 d1:=d;
 Fillchar(xet,sizeof(xet),true);
 d[0]:=0;
 Trace[0]:=n; a[n,0]:=70;
 Repeat
 tmp:=maxlongint;
 For i:=0 to n-1 do
  if (d[i]<tmp) and (xet[i]) then begin tmp:=d[i]; u:=i; end;
 xet[u]:=false;
 If (tmp=maxlongint) or (u=X) then break;
 For v:=0 to n-1 do
  if xet[v] then begin
  if a[u,v]=-1 then t1:=a[trace[u],u] else t1:=a[u,v];
  if (l[u,v]<>0) then if (d[v]>d[u]+(l[u,v]/t1)) OR (D1[V]>(l[u,v]/t1)) then
   begin
   d[v]:=d[u]+(l[u,v]/t1);
   d1[v]:=l[u,v]/t1;
   trace[v]:=u;
   a[u,v]:=t1;
   end;
  end;
 Until False;
 End;

Procedure Try;
 Begin
 dji;
 s:=x;
 t1:=0;
 Repeat
 inc(T1); B[T1]:=S;
 s:=trace[s];
 Until s=n;
 Writeln(t1);
 Assign(f,FO); Rewrite(F);
 For i:=t1 downto 1 do Write(f,b[i],' ');
 Close(F);
 End;


Begin
 Init;
 Try;
End.
