Uses math;
CONST FI='BONGBONG.INP';
      FO='BONGBONG.OUT';

VAR X,stack: array [1..200001] of longint;
    r: array [1..200001] of real;
    n,t,i,j,top: longint;
    f: text;


Procedure Init;
 Begin
 Assign(f,FI); reset(f);
 Readln(f,n);
 For n:=1 to n do readln(F,x[n],r[n]);
 Close(F);
 End;

Procedure Try;
 Begin
 t:=1;  top:=1; stack[1]:=1;
 For i:=2 to n do begin
  t:=top;
  While t>0 do begin
   r[i]:=min(r[i],sqr(x[i]-x[stack[t]])/(4*r[stack[t]]));
   if r[i]>=r[stack[t]] then dec(t) else break;
   end;
  top:=t;
  inc(top); stack[top]:=i;
  end;
 assign(f,FO); rewrite(F);
 For n:=1 to n do writeln(f,r[n]:0:3);
 Close(F);
 End;

Begin
 Init;
 Try;
End.

