Uses math;
Const FI='stmerge.inp';
      FO='stmerge.out';

Var a: array [0..1001,1..1001,0..2] of longint;
    c: array [0..1001,1..1001] of longint;
    i,j,k,n,m,kq,test:longint;
    f,g: text;

Procedure Try;
 Begin
 For i:=1 to m do
  for j:=1 to n do
   begin a[i,j,0]:=0; a[i,j,1]:=0 end;
 a[1,1,0]:=c[1,1];
 a[1,1,1]:=c[1,1];
 For j:=2 to n do begin
  a[1,j,0]:=min(a[1,j-1,0],a[1,j-1,1]+c[i,1]);
  a[1,j,1]:=c[1,j];
  end;
 For i:=2 to m do begin
  a[i,1,0]:=c[i,1];
  a[i,1,1]:=min(a[i-1,1,1],a[i-1,1,0]+c[i,1]);
  end;
 for i:=2 to m do
  For j:=2 to n do begin
  a[i,j,0]:=min(a[i,j-1,0],a[i,j-1,1]+c[i,j]);
  a[i,j,1]:=min(a[i-1,j,1],a[i-1,j,0]+c[i,j]);
  end;
 kq:=min(a[m,n,0],a[m,n,1]);
 Writeln(g,kq);
 End;

Procedure Init;
Begin
 Assign(f,FI); reset(F);
 Assign(g,FO); rewrite(g);
 Readln(f,test);
 For k:=1 to test do begin
 Readln(f,m,n);
 For i:=1 to m do
  For j:=1 to n do read(f,c[i,j]);
 readln(F);
 Try;
 End;
Close(F); Close(G);
End;


Begin
 Init;
End.