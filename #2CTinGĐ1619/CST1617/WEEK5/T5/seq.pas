USES MATH;
CONST FI='SEQ.INP';
      FO='SEQ.OUT';

VAR A,KT,D,C,ID:ARRAY [1..100000] OF LONGINT;
    ANS,M,N,I,J: LONGINT;
    F: TEXT;

PROCEdure INIT;
 BEGIN
 ASSIGN(F,FI); RESET(F);
 Readln(f,n,m);
 For n:=1 to n do Begin
  Read(F,a[n]);
  id[n]:=n;
  End;
 Close(F);
 End;

procedure sort(l,r: longint);
 var i,j,x,y: longint;
 begin
 i:=l; j:=r;
 x:=a[id[(l+r) div 2]];
 repeat
 while a[id[i]]<x do inc(i);
 while x<a[id[j]] do dec(j);
 if not(i>j) then begin y:=id[i]; id[i]:=id[j]; id[j]:=y;
                        inc(i); dec(j);
             end;
 until i>j;
 if l<j then sort(l,j);
 if i<r then sort(i,r);
 end;

Procedure Try;
 Var tmp,sum: longint;
 Begin
 Sort(1,n); tmp:=1;
 C[1]:=1;
 For i:=2 to n do
  If a[id[i]]=a[id[i-1]] then c[id[i]]:=tmp
   else begin inc(tmp); c[id[i]]:=tmp; end;
 For i:=1 to n do inc(kt[c[i]]);
 j:=1; ans:=0; sum:=0;
 For i:=1 to n do begin
  If sum<m then
   If (kt[c[i]]>d[c[i]]) then
    if (d[c[i]]=0) then begin inc(sum); inc(d[c[i]]); end else inc(d[c[i]]);
  While sum>=m do begin
                    dec(d[c[j]]);
                    dec(sum);
                    ans:=max(ans,i-j+1);
                    inc(j);
   End;
  Ans:=max(ans,i-j+1);
  End;
 Assign(F,FO); Rewrite(F);
 Writeln(f,Ans);
 Close(F);
 End;



Begin
 Init;
 Try;
End.
