Const FI='11933.inp';
      FO='11933.out';
Var sum,n,tmp,c,even,t: longint;
    kt: boolean;
    f,g:text;

Function pow(x,y: longint): longint;
 Var t: longint;
 Begin
 IF y=0 then exit(1);
 t:=1;
 for y:=1 to y do t:=t*x;
 Exit(t);
 End;

Procedure Try;
 Begin
 Assign(F,FI); Reset(F);
 Assign(g,FO); rewrite(G);
 While not eof(F) do
  begin
  Readln(f,n);
  if n=0 then break;
  tmp:=n;
  c:=0; even:=0; sum:=0;
  While tmp<>0 do
   begin
    if tmp mod 2 =1 then
     begin
     inc(even);
     if even mod 2 =1 then sum:=sum+pow(2,c);
     end;
    tmp:=tmp div 2;
    inc(c);
   end;
  Writeln(g,sum,' ',n-sum);
  End;
 Close(F); Close(G);
 End;


Begin
 Try;
End.