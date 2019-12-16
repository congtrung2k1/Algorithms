USES MATH;
CONST FI='GIAOHANG.INP';
      FO='GIAOHANG.OUT';

VAR RA,VAO,XET: ARRAY [0..1001] OF BOOLEAN;
    A: ARRAY [0..1001,0..1001] OF BOOLEAN;
    N,U,V,ANS,DEM: LONGINT;
    F: TEXT;


Procedure Init;
 Var u,v: longint;
 Begin
 Assign(F,FI); Reset(F);
 Readln(f,n);
 Fillchar(a,sizeof(a),false);
 ans:=n;
 For u:=0 to n-1 do begin
  Read(f,dem);
  For dem:=1 to dem do
   begin
   read(f,v);
  { IF vao[v]=0 then dec(ans);
   Inc(Vao[v]);
   Inc(Ra[u]);
   If Ra[u]=2 then dec(ans);    }
   a[u,v]:=true;
   End;
  End;
 Close(F);
 End;


Procedure Try;
 Begin
 dec(n);
 FILLCHAR(VAO,SIZEOF(VAO),TRUE);
 RA:=VAO;
 XET:=RA;
 For u:=0 to n do
  For v:=0 to n do
   If a[u,v] then begin
    If (vao[v]) And (xet[v]) then Begin Xet[v]:=false; Dec(ans); end;
    IF (not ra[u]) and (xet[u]) then begin xet[u]:=false; dec(ans); end;

    Vao[v]:=false;
     Ra[u]:=false;
  End;
 {For u:=0 to n-1 do
  If (Vao[u]>1) or (Ra[u]>1) then Dec(ans); }
 Assign(f,FO); REwrite(F);
 Writeln(f,ans);
 Close(F);
 End;


Begin
 Init;
 TRy;
End.

