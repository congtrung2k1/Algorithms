Const fi='balldrop.inp';
        fo='balldrop.out';
Var fx:array[0..100,0..64] Of int64;
        n:Integer;
        m:int64;
        f,g:Text;
Procedure Data;
Begin
        Assign(f,fi);Reset(f);
        Assign(g,fo);Rewrite(g);
        Readln(f,n,m);
End;
Procedure Solve;
Var b,t:Integer;
Begin
        Fillchar(fx,sizeof(fx),0);
        For b:=1 to n do
                For t:=1 to 63 do
                begin
                        If (b=1)and (t=1) then fx[b,t]:=1
                        Else fx[b,t]:=fx[b-1,t-1]+fx[b,t-1]+1;
                end;
        For t:=1 to 64 do
                If fx[n,t]>=m then begin writeln(g,t);Exit;end;
        Writeln(g,'More than 63 trials needed.');
End;
BEGIN
        Data;
        Solve;
        Close(f);Close(g);
END.