CONST FI='FROGS.INP';
      FO='FROGS.OUT';

VAR A,B,C,STACK: ARRAY [0..1000000] OF LONGINT;
    TOP,N,I : longint;
    F: text;

Procedure Init;
 Begin
 Assign(f,FI); REset(F);
 Readln(f,n);
 For i:=0 to n-1 do read(f,a[i]);
 Readln(F);
 For i:=0 to n-1 do read(f,b[i]);
 Close(F);
 End;

Procedure Try;
 Begin
 top:=0;
 i:=n-1;
 stack[top]:=20000001;
 For i:=n-1 downto 0 do
  begin
  while a[i]>=stack[top] do dec(top);
  inc(top); stack[top]:=a[i];
  If b[i]>=top then c[i]:=-1 else c[i]:=stack[top-b[i]];
  End;
 Writeln(n);
 Assign(f,FO); Rewrite(F);
 For i:=0 to n-1 do write(f,c[i],' ');
 Close(F);
 End;



BEgin
 Init;
 TRy;
End.
