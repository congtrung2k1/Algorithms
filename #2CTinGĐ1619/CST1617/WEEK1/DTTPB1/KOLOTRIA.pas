Const FI='KOLOTRIA.INP';
      FO='KOLOTRIA.OUT';

TYPE LIST=^NODE;
     NODE= RECORD
     V:LONGINT; LINK: LIST; END;

VAR  A: ARRAY [1..10000] OF LIST;
     B: ARRAY [1..10000] OF Int64;
     N,M,U,V: LONGINT;
     ANS,T: INT64;
     TMP: LIST;
     F: TEXT;


Function c3(n: longint): int64;
 Begin
 c3:=n*(n-1) div 2;
 c3:=c3*(n-2) div 3;
 End;

PROCEdure INIT;
 BEGIN
 Assign(f,FI); reset(F);
 Readln(F,n,m);
 For n:=1 to n do a[n]:=nil;
 For m:=1 to m do begin
  Readln(f,u,v);
  new(tmp);
  tmp^.V:=v; tmp^.link:=a[u]; a[u]:=tmp;
  end;
 Close(F);
 End;


Procedure Try;
 Begin
 Assign(F,FO); Rewrite(F);
 If n<3 then begin writeln(f,0); close(F); exit; end;
 t:=0;
 For u:=1 to n do begin
  tmp:=a[u];
  While tmp<>nil do
   begin
   v:=tmp^.v;
   inc(b[u]); inc(b[v]);
   tmp:=tmp^.link;
   end;
  end;
 For u:=1 to n do t:=t+(b[u]*(n-1-b[u]));
 Writeln(f,c3(n)-(t div 2));
 Close(F);
 End;


Begin
 Init;
 Try;
End.

