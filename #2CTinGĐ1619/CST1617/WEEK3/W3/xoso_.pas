CONST FI='XOSO.INP';
      FO='XOSO.OUT';
      inf=10000;
VAR n,i,j,k,t,ans: longint;
    a,b,x: array [1..10000] of longint;
    xet: array [1..10001,1..10001] of boolean;
    kt: boolean;
    f,g: text;


Procedure Init;
 Begin
 Assign(f,FI); Reset(F);
 Assign(g,FO); Rewrite(G);
 Readln(f,n);
 fillchar(xet,sizeof(xet),true);
 for i:=1 to inf do x[i]:=1;
 If n<=10000 then
  For i:=1 to n do
  begin
  Readln(f,a[i],b[i]);
  ans:=0;
 { For j:=i-1 downto 1 do begin
   if (a[i]>a[j]) and (a[i]<b[j]) then
    if xet[a[i],j] then begin inc(ans); xet[a[i],j]:=false; end;
   If (b[i]>a[j]) and (b[i]<b[j]) then
    if xet[b[i],j] then begin inc(ans); xet[b[i],j]:=false; end;  }
  For j:=x[a[i]] to i-1 do
   if (a[i]>a[j]) and (a[i]<b[j]) then inc(ans);
  For j:=x[b[i]] to i-1 do
   If (b[i]>a[j]) and (b[i]<b[j]) then inc(ans);
  x[a[i]]:=i; x[b[i]]:=i;
 // end;
  Writeln(g,ans);
  End;
 Close(F); Close(G);
 End;



Begin
 Init;
end.
