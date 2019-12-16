Const FI='Nhiphan.inp';
      FO='nhiphan.out';

Var a,s: array [0..33,0..33] of int64;
    kq: int64;
    s1: string;
    i,j,n,k,x,t: longint;
    f,g: text;

Procedure Init;
 Begin
 Assign(f,FI); reset(F); Assign(g,FO); rewrite(G);
 Readln(f,n,k);
 Readln(f,x);
 Readln(F,s1);
 Close(f);
 End;

Procedure Try1;
 Begin
 a[0,0]:=1;
 For i:=1 to n do begin a[i,0]:=1;
  For j:=1 to n do begin
   a[i,j]:=a[i-1,j-1]+a[i-1,j];
   For t:=1 to j do s[i,t]:=s[i,t]+a[i,j];
   end;
   end;
 Writeln(g,s[n,k]);
 End;

Procedure Try2;
 Begin
 If x>s[n,k] then begin writeln(g,-1); exit; end;
 i:=1; j:=1;
 for k:=1 to n do
  begin
  if x<=s[i,j+1] then begin Write(g,0); inc(j); end
   else
   begin Write(G,1); x:=x-s[i,j+1]; inc(i); end;
  end;
// Writeln(g);
 End;

PRocedure Try3;
 Var stt,d,l: longint;
 Begin
 Writeln(g);
 stt:=0;
 For i:=1 to n do
  if s1[i]='1' then begin
  stt:=stt+s[n-i,k];
  if k>0 then dec(k);
  end;
 Writeln(g,stt+1);
 Close(G);
 End;

Begin
 Init;
 Try1;
 Try2;
 Try3;
End.
