Uses Math;
Const FI='FISHING.INP';
      FO='FISHING.OUT';
      inf=1000000;

VAR FX1,FX2: ARRAY [0..101,0..101,0..1000] OF LONGINT;
    D: ARRAY [0..101,0..101] OF LONGINT;
    N,M,I,J,X,Y,Z,ANS: LONGINT;
    F: TEXT;

Procedure Init;
 Begin
 Assign(f,FI); Reset(F);
 Readln(f,n,m);
 For i:=1 to n do begin
  For j:=1 to m do
   read(f,d[i,j]);
   readln(F);
   End;
 Close(F);
 End;



Procedure Try;
 Begin
 For x:=1 to n do
  For y:=1 to m do
   begin
   fx1[x,y,0]:=0;
   For z:=1 to min(n,m) do If z>min(x,y) then fx1[x,y,z]:=0
    else if (x=z) and (y=z) then fx1[x,y,z]:=d[x,y]+fx1[x-1,y-1,z-1]
     else
     begin
     fx1[x,y,z]:=0;
     If x>1 then fx1[x,y,z]:=max(fx1[x-1,y,z],fx1[x,y,z]);
     If y>1 then fx1[x,y,z]:=max(fx1[x,y-1,z],fx1[x,y,z]);
     fx1[x,y,z]:=max(d[x,y]+fx1[x-1,y-1,z-1],fx1[x,y,z]);
     end;
   End;
 For x:=1 to n do
  for y:=1 to m do
   begin
   Fx2[x,y,0]:=inf;
   For z:=1 to min(n,m) do if z>min(x,y) then fx2[x,y,z]:=inf
    else
    if (x=z) and (y=z) then fx2[x,y,z]:=d[x,y]+fx2[x-1,y-1,z-1]
     else
     begin
     fx2[x,y,z]:=inf;
     If x>1 then fx2[x,y,z]:=min(fx2[x-1,y,z],fx2[x,y,z]);
     If y>1 then fx2[x,y,z]:=min(fx2[x,y-1,z],fx2[x,y,z]);
     fx2[x,y,z]:=min(d[x,y]+fx2[x-1,y-1,z-1],fx2[x,y,z]);
     end;
  End;

 Assign(f,fo); Rewrite(F);
 Ans:=0;
 For i:=0 to (min(n,m) div 2) do begin
 // Writeln(fx1[n,m,i],' ',fx2[n,m,i*2]);
  ans:=max(ans,fx1[n,m,i]-fx2[n,m,i*2]);
  end;
 Writeln(f,ans);
 Close(F);
 End;


Begin
 Init;
 Try;
End.
