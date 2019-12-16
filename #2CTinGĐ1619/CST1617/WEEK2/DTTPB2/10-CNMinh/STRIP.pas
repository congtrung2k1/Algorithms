Const FI='strip.inp';
      FO='strip.out';

Var a: array [0..62] of qword;
    i,j,k:longint;
    n:qword;
    f,g:text;

Procedure Try(x:qword);
 Var q:longint;
     t,dd,d,l:qword;
 Begin
 d:=0; t:=0; l:=1; q:=k;
 Repeat
 if x>a[q] div 2 then
  begin
  x:=a[q]-x+1;
  dd:=t+t+d+1;
  t:=d; d:=dd;
  end else t:=t+l;
 l:=l*2;
 dec(q);
 Until q=0;
 Writeln(g,d+1);
 End;

Procedure Khoitao;
 Begin
 a[0]:=1;
 For i:=1 to 62 do a[i]:=a[i-1]*2;
 End;

Procedure Init;
 Begin
 Assign(g,FO); rewrite(g);
 Assign(F,FI); reset(F);
 While not eof(F) do begin
  readln(f,k,n);
  Try(n);
  end;
 Close(F);
 Close(G);
 End;


Begin
 Khoitao;
 Init;
End.
