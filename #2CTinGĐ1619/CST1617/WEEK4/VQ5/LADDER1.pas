CONST FI='LADDER.INP';
      FO='LADDER.OUT';

VAR LO,HI,A: ARRAY [1..100000] OF LONGINT;
    I,J,N,M,DEM: LONGINT;
    F,G: TEXT;


Procedure Try;
 Var kt: boolean;
 Begin
 dem:=1; lo[1]:=1; i:=1; kt:=false;
 Repeat
 If not kt and (a[i]>a[i+1]) then kt:=true
  else
   if kt and (a[i]<a[i+1]) then
   begin
   hi[dem]:=i;
   inc(dem);
   lo[dem]:=i;
   kt:=not kt;
   end;
 Inc(i);
 Until i>n;
 if lo[dem]=n then dec(dem);
 hi[dem]:=n;
 End;

Function TKNP(x: longint): longint;
 Var l,r,m,tmp: longint;
 Begin
 l:=1; r:=dem; tmp:=0;
 repeat
 m:=(l+r) div 2;
 IF lo[m]<=x then
  begin
  tmp:=m;
  l:=m+1 end else r:=m-1;
 Until L>r;
 Exit(tmp);
 End;

PROCEDURE Init;
 Var vt,u,v: longint;
 Begin
 Assign(F,FI); Reset(F);
 Assign(G,FO); Rewrite(g);
 Readln(F,n,m);
 For n:=1 to n do read(F,a[n]);
 Try;
 For m:=1 to m do
  begin
  Readln(f,u,v);
  vt:=tknp(u);
  If v<=hi[vt] then writeln(G,1) else writeln(g,0);
  End;
 Close(F); Close(G);
 End;


Begin
 Init;
End.


