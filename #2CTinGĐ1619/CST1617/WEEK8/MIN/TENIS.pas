CONST FI='TENIS.INP';
      FO='TENIS.OUT';

Var red,s1,s2: String;
    n,i,poc,mec,x,y,z,smece: longint;
    ok: boolean;
    pob: array [0..2] of longint;
    F,G: Text;

FUNCTion TRY:BOOLEAN;
 VAR T: LONGINT;
 P: STRING;
 BEGIN
 IF X=Y THEN EXIT(FALSE);
 IF X<Y THEN BEGIN
 T:=X; X:=Y; Y:=T;
 P:=S1; S1:=S2; S2:=P;
 Pob[1]:=Pob[1]+1;
 end else pob[0]:=pob[0]+1;
 If s1='federer' then exit(false) else
  if x<6 then exit(false) else
   if x=6 then exit(y<=4) else
    if (x=7) and (z<3) then exit((y=5) or (y=6)) else
     if (x>=7) and (z=3) then exit(x=y+2) else
      exit(False);
 Exit(true);
 END;


PROCEdure INIT;
 BEGIN
 Assign(F,Fi); Reset(F); Assign(g,FO); Rewrite(G);
 Readln(f,RED);
 i:=Pos('',red);
 s1:=Copy(red,1,i-1);
 S2:=Copy(Red,i+1,length(red)-i);
 Readln(f,n);
 For Mec:=1 to n do begin
  readln(f,Red);
  Red:=Red+'';
  pob[1]:=0; pob[2]:=0;
  z:=1; poc:=1; Ok:=True;
  For i:=1 to length(red) do begin
   IF Red[i]=':' then begin
    Val(copy(Red,poc,i-poc),x,smece); Poc:=i+1; end
   else if red[i]='' then begin
    Val(copy(Red,poc,i-poc),y,smece);
    Poc:=i+1;
    Ok:=Ok and (pob[1]<2) and (pob[2]<2);
    Ok:=Ok and Try;
    z:=z+1;
    end;
   end;
  Ok:=ok and ((pob[1]=2) or (pob[2]=2));
  IF ok then Writeln(g,'da') else writeln(g,'ne');
  End;
 Close(F); Close(G);
 End;




Begin
 Init;
End.
