CONST FI='TASK.INP';
      FO='TASK.OUT';

VAR BACRA,BACVAO,B: ARRAY [0..1001] OF LONGINT;
    A: ARRAY [0..1001,0..1001] OF BOOLEAN;
    KT: ARRAY [0..1001] OF BOOLEAN;
    ANS,T,N,M: LONGINT;
    F: TEXT;


PROCEdure Init;
 Var u,v: longint;
 Begin
 Assign(f,fi); Reset(F);
 Readln(F,n,m);
 For m:=1 to m do
  Begin
  Readln(F,u,v);
  A[u,v]:=true;
  Inc(bacra[u]);
  Inc(bacvao[v]);
  End;
 Close(F);
 End;


Procedure Try;
 Var u,v,tmp: longint;
 Begin
 fillchar(kt,sizeof(kt),true);
 Ans:=0; T:=0;
 Repeat
 tmp:=0;
  For u:=1 to n do
   IF (Bacvao[u]=0) and (kt[u]) then begin
    inc(tmp); B[TMP]:=u;
   End;
 If tmp=0 then break;
 For tmp:=1 to tmp do begin
  u:=b[tmp]; kt[u]:=false;
  For v:=1 to n do
   if a[u,v] then begin dec(bacvao[v]); Dec(bacra[u]);
                        a[u,v]:=false; end;
   end;
 If tmp>ans then ans:=tmp;
 Inc(T);
 Until false;
 Writeln(t,' ',ans);
 End;


Begin
 Init;
 Try;
End.
