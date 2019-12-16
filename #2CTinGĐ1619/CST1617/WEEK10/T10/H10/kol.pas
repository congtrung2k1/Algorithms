Const FI='kol.inp';
      FO='kol.out';

Var A: array [1..600000] of longint;
    c,s,r,u,v,ts,i,j:longint;
    kt: boolean;
    F,g: text;

Procedure Init;
 Begin
 Assign(F,FI); Reset(F);
 Assign(G,FO); rewrite(G);
 Readln(F,c,s,r);
 For r:=1 to r do begin
  readln(f,u,v,ts); kt:=true;
  For i:=u to v-1 do begin a[i]:=a[i]+ts;
   if a[i]>s then begin kt:=falsE;
                        for j:=i downto u do a[j]:=a[j]-ts;
                        break; end end;

  IF kt=false then writeln(G,'N') else writeln(g,'T');
  End;
 Close(G);
 ClosE(f);
 End;

Begin
 Init;
End.
