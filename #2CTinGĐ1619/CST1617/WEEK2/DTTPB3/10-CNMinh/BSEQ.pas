Const FI='bseq.inp';
      Fo='bseq.out';
Var q: array ['A'..'Z'] of boolean;
    a: array [1..1000] of string;
    all: string;
    s: string;
    n:byte;
    not_ans,full: int64;
    f,g: text;


Function notbld(k:byte;z: char):boolean;
 Var j: byte;
 Begin
 For j:=1 to k-1  do if s[j]=z then exit(false);
 for j:=1 to k-1 do
  if (abs(ord(z)-ord(s[j]))=k-j) then exit(False);
 If k>1 then
  if abs(ord(Z)-ord(s[k-1]))=2 then exit(false);
 If k>2 then
  if abs(ord(z)-ord(s[k-2]))=1 then exit(False);
 Exit(true);
 End;

Procedure try(k:byte);
 Var i:byte;
 begin
 for i:=1 to length(a[k]) do
  if notbld(k,a[k,i]) then
   begin
    s[k]:=a[k,i];
    if k<n then try(k+1) else inc(not_ans);
   end;
 end;

Procedure solution;
 Var i,k: longint;
     ch: char;
 Begin
 Fillchar(q,sizeof(q),false);
 Assign(f,FI); reset(F);
 Assign(g,FO); rewrite(g);
 While not seekeof(F) do begin
  readln(f,n);
  if n=0 then break;
  all:='';
  For n:=1 to n do all:=all+chr(64+n);
  For i:=1 to n do begin
   for n:=1 to n do q[all[n]]:=true;
   a[i]:='';
   Readln(F,s);
   For k:=1 to length(s) do begin
    ch:=s[k];
    IF ch='?' then begin a[i]:=all; break; end;
    If (ch in ['A'..'Z']) then
     IF q[ch] then begin a[i]:=a[i]+ch; q[ch]:=false; end;
   end;
   End;
 Full:=1;
 For i:=1 to n do full:=full*length(a[i]);
 not_ans:=0;
 For i:=1 to length(a[1]) do
  begin s[1]:=a[i,1];
  try(2);
  end;
 Writeln(g,full-not_ans);
 end;
 Close(F);
 Close(G);
 End;


Begin
 solution;
End.



