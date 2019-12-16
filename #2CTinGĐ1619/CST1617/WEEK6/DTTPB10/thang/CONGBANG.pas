Uses math;
Const fi='CONGBANG.INP';
        fo='CONGBANG.OUT';
Var a,id,s:Array[1..100] Of Longint;
        t,n,p,sum:Longint;
        f,g:Text;
Procedure Solve;
Var i,j,tmp:Longint;
Begin
        For i:=1 to n-1 do
                For j:=i+1 to n do
                begin
                        If (a[i]<a[j])or((a[i]=a[j])and(id[i]>id[j])) then
                        begin
                                tmp:=a[i];a[i]:=a[j];a[j]:=tmp;
                                tmp:=id[i];id[i]:=id[j];id[j]:=tmp;
                        end;
                end;
        If sum<p then writeln(g,'IMPOSSIBLE')
        Else
        begin
                i:=n;
                For j:=n downto 1 do
                begin
                        s[j]:=min(a[j],p div i);
                        p:=p-s[j];
                        dec(i);
                end;
                For i:=1 to n-1 do
                For j:=i+1 to n do
                begin
                        If (id[i]>id[j]) then
                        begin
                                tmp:=s[i];s[i]:=s[j];s[j]:=tmp;
                                tmp:=id[i];id[i]:=id[j];id[j]:=tmp;
                        end;
                end;
                For i:=1 to n do write(g,s[i],#32);Writeln(g);
        end;
End;
BEGIN
        Assign(f,fi);reset(f);
        Assign(g,fo);Rewrite(g);
        Readln(f,t);
        For t:=1 to t do
        begin
                Readln(f,p,n);
                sum:=0;
                For n:=1 to n do begin Read(f,a[n]);id[n]:=n;sum:=sum+a[n];end;
                Solve;
        end;
        Close(f);close(g);
END.
