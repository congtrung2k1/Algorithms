CONST FI='XEPHANG.INP';
      FO='XEPHANG.OUT';

VAR OLD,NEW,KT: ARRAY [-1..1000] OF LONGINT;
    Test,n,x,m,i,u,v: longint;
    f,g: text;


Procedure Init;
 Begin
 Assign(F,FI); Reset(F);
 Assign(g,FO); RewritE(g);
 Readln(f,test);
 For test:=1 to test do
  begin
  Readln(f,n);
  For i:=1 to n do kt[i]:=1;
  For i:=1 to n do begin read(f,x); old[i]:=x; end;
  readln(f);
  Readln(f,m);
  new:=old;
  for m:=1 to m do
   begin
   readln(f,u,v);
   If old[u]>old[v] then begin dec(kt[new[v]]); inc(new[v]);
                               inc(kt[new[v]]);
                               dec(kt[new[u]]); dec(new[u]);
                               inc(kt[new[u]]); end
   else if old[u]<old[v] then begin dec(kt[new[u]]); inc(new[u]);
                                     inc(kt[new[u]]);
                                     dec(kt[new[v]]); dec(new[v]);
                                     inc(kt[new[v]]); end;

   end;
  for i:=1 to n do if kt[i]<>1 then begin writeln(g,'IMPOSSIBLE'); break; end;
  If (i=n) and (kt[i]=1) then begin
   for i:=1 to n do write(g,new[i],' ');
  Writeln(g);
  end;
  End;
 Close(F); Close(G);
 end;



Begin
 Init;
End.