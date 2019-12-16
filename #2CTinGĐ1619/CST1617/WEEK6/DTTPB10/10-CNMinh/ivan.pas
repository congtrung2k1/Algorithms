Uses Math;
Const fi='ivan.INP';
      fo='ivan.OUT';
Var     x:Array[0..61] Of Longint;
        l:Array[0..61,0..61,0..61] Of boolean;
        n,m,t,i,j,k: longint;
        kq: int64;
        f,g:Text;

Procedure Init;
Begin
 Assign(f,fi);Reset(f);
 Assign(g,fo);Rewrite(g);
 Readln(f,n,t);
 Fillchar(x,sizeof(x),0);
 For n:=1 to n do Readln(f,x[n]); x[0]:=0;
End;

Function xet(m:Longint):Boolean;
Var i,j,k:Integer;
Begin
 Fillchar(l,sizeof(l),False);
 For i:=1 to n do If x[i]-x[0]<=m then l[0,i,1]:=True;
 For t:=2 to min(n,t) do begin
  For i:=t-1 to n-1 do
   For j:=i+1 to n do
    For k:=0 to i-1 do
    If (x[j]-x[i]<=x[i]-x[k]+m) then
     begin If (l[k,i,t-1]) then l[i,j,t]:=True;end
     Else Break;
     end;
 For j:=1 to t do
  For i:=0 to n-1 do
  If l[i,n,j] then Exit(True);
        Exit(False);
End;

PRocedure Try;
 Var h,r: longint;
 Begin
 h:=1; r:=x[n];
 Repeat
 m:=(h+r) div 2;
 IF xet(m) then begin kq:=m; r:=m end else h:=m+1;
 Until h>=r;
 IF xet(h) then kq:=h else
  if xet(r) then kq:=r;
 Writeln(g,kq);
 Close(f);CLose(g);
 End;


BEGIN
 Init;
 Try;
END.
