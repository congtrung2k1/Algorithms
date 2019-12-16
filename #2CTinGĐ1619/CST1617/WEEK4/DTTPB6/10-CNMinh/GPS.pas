Uses math;
Const FI='GPS.inp';
      FO='GPS.out';

Var z: array [0..501,0..501] of longint;
    i,j,k,n,m,t:longint;
    x,y: string;
    f,g: text;

Function v(e,f:longint):longint;
 Begin
 IF x[e]=y[f] then exit(2) else exit(-1);
 End;

Procedure Try;
 Begin
 Assign(f,FI); reset(F);
 Assign(g,FO); rewrite(G);
 Readln(f,t);
 For t:=1 to t do begin
  Fillchar(z,sizeof(z),0);
  Readln(f,x); readln(F,y);
  m:=length(x); n:=length(y);
  For i:=1 to m do z[i,0]:=-i-4;
  For j:=1 to n do z[0,j]:=-j-4;
  For i:=1 to m do
   For j:=1 to n do begin
    z[i,j]:=v(i,j)+z[i-1,j-1];
    For k:=1 to j-1 do z[i,j]:=max(z[i,j],v(i,k)+z[i-1,k-1]-4-(j-k));
    For k:=1 to i-1 do z[i,j]:=max(z[i,j],v(k,j)+z[k-1,j-1]-4-(i-k));
    End;
  Writeln(g,z[m,n]);
  end;
{ For i:=0 to m do begin
  For j:=0 to n do
  Write(z[i,j],' ');
  writeln; end;
  Readln;   }
  Close(f); Close(G);
 End;

Begin
 Try;
End.
