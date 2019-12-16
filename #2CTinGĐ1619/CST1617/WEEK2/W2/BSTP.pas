CONST FI='BSTP.INP';
      FO='BSTP.OUT';
      maxnm=200000;
Var FT,pos: array [1..maxnm] of longint;
    sum,x,i,maxi,test,t,n,m: longint;
    f,g: text;

Function Query (x : LongInt) : LongInt;
    Var sum : LongInt;
    Begin
        sum:=0;
        While x>0 do
            Begin
                inc(sum,FT[x]);
                x:=x-(x and (-x));
            End;
        exit(sum);
    End;

Procedure Update (x,y : LongInt);
    Begin
        While (x<=maxi) do
            Begin
                Ft[x]:=ft[x]+y;
               x:=x+(x and (-x));
            End;
    End;



Procedure Init;
 Begin
 Assign(F,FI); Reset(F);
 Assign(g,FO); rewrite(G);
 Readln(f,test);
 For test:=1 to test do
  begin
  Readln(f,n,m);
  maxi:=n+m;
  Fillchar(pos,sizeof(pos),0);
  Fillchar(ft,sizeof(ft),0);
  For i:=1 to n do begin
   pos[i]:=m+i; update(pos[i],1);
   End;
  For i:=1 to m do begin
   Read(f,x);
   t:=0;
   t:=Query(pos[x]-1);
   Write(g,t,' ');
   Update(pos[x],-1);
   Pos[x]:=maxi-n-i+1;
   Update(pos[x],1);
   end;
  Readln(f);
  Writeln(g);
  End;
 Close(f); Close(G);
 End;


Begin
 Init;
End.