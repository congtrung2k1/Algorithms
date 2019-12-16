USES MATH;
CONST FI='LKNIGHT.INP';
      FO='LKNIGHT.OUT';

VAR N,K,U,V,I,J,xmax,xmin,ymax,ymin: LONGINT;
    Ans: Int64;
    TD: ARRAY ['1'..'8'] OF LONGINT=(-2,-1,1,2,2,1,-1,-2);
    TC: ARRAY ['1'..'8'] OF LONGINT=(1,2,2,1,-1,-2,-2,-1);
    C: CHAR;
    F: TEXT;


Procedure Init;
 Begin
 Assign(f,fi); Reset(F);
 U:=0; V:=0;
 Readln(f,n,k);
 For k:=1 to k do Begin
  Read(f,c);
  U:=U+TD[c]; V:=V+TC[c];
  Xmin:=Min(xmin,u);
  Xmax:=Max(Xmax,u);
  YMin:=Min(ymin,v);
  Ymax:=Max(ymax,v);
  End;
 Close(F);
 End;


Procedure Try;
 Begin
 Ans:=0;
 Xmax:=xmax-xmin+1;
 Ymax:=Ymax-ymin+1;
 Assign(f,fo); Rewrite(F);
 If (Xmax>n) and (ymax>n) then writeln(f,0)
  else Writeln(f,(n-xmax+1)*(n-ymax+1));
 Close(F);
 End;



Begin
 Init;
 Try;
End.
