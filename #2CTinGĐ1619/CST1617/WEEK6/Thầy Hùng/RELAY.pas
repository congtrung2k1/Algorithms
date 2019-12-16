Uses Math;
Const FI='RELAY.INP';
      FO='RELAY.OUT';
      inf=trunc(10e17);
VAR A,B,C: ARRAY [0..100006] OF Int64;
    FX: ARRAY [0..100006] OF INT64;
    N,I,J,K: LONGINT;
    Ans,Tmp: int64;
    F: TEXT;

Procedure Init;
 Begin
 Assign(f,FI); Reset(F);
 Readln(f,n,k);
 For n:=1 to n do Readln(f,a[n],b[n],c[n]);
 Close(F);
 End;

Procedure Swap(Var x,y: int64);
 Var tmp: int64;
 Begin
 Tmp:=x; x:=y; y:=tmp;
 End;

procedure sort(l,r: longint);
 var i,j,y: longint;
     x: int64;
 begin
 i:=l; j:=r;
 x:=a[(l+r) div 2];
 repeat
 while a[i]<x do inc(i);
 while x<a[j] do dec(j);
 if not(i>j) then begin
                Swap(a[i],a[j]);
                Swap(b[i],b[j]);
                Swap(c[i],c[j]);
                Inc(i); Dec(j);
                end;
         until i>j;
 if l<j then sort(l,j);
 if i<r then sort(i,r);
 end;


Procedure Try;
 Begin
 Sort(1,n);
 For i:=1 to n do begin
  If A[i]=0 then Fx[i]:=C[i]*(B[i]-A[i]) else Fx[i]:=inf;
  For j:=i-1 downto 1 do
   If b[j]>=a[i] then
    begin
    Tmp:=(B[i]-A[i])*C[i]+Fx[j];
    If B[j]>A[i] then Dec(Tmp,(B[j]-A[i])*C[j]);
    FX[i]:=Min(Fx[i],Tmp);
    End;
  End;
   // Fx[i]:=Min(fx[i],Fx[j]+C[i]*(B[i]-A[i])-C[j]*(B[j]-A[i]));
 Assign(f,FO); RewritE(F);
 Ans:=inf;
 For i:=1 to n do
  If b[i]>=k then Ans:=min(ans,fx[i]);
 Writeln(f,Ans);
 Close(F);
 End;



Begin
 Init;
 Try;
end.
