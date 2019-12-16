Const fi='SUBSUM2.INP';
        fo='SUBSUM2.OUT';
        oo=(4*trunc(1e9)+1);
Var d1,d2,c1,c2,n,t1,t2:Longint;
        s1,s2,ans,tg1,tg2,a:real;
        f,g:Text;
BEGIN
        Assign(f,fi);Reset(f);
        Assign(g,fo);rewrite(g);
        Readln(f,n);d1:=1;c1:=0;d2:=1;c2:=0;tg1:=-oo;tg2:=-oo;s1:=0;s2:=0;
        For n:=1 to n do
        begin
                Read(f,a);
                If (s1>0)and(s1+a>0) then s1:=s1+a Else begin s1:=a;t1:=n;end;
                If tg1<s1 then begin d1:=t1;c1:=n;tg1:=s1;end;
                If (s2>0)and(s2-a>0) then s2:=s2-a Else begin s2:=-a;t2:=n;end;
                If tg2<s2 then begin d2:=t2;c2:=n;tg2:=s2;end;
        end;
        If tg1>tg2 then begin Writeln(g,tg1*tg1:0:0);Writeln(g,d1,#32,c1);end
        else begin Writeln(g,tg2*tg2:0:0);Writeln(g,d2,#32,c2);end;
        Close(f);Close(g);
END.
