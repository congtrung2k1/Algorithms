Const fi='RACE.INP';
        fo='RACE.OUT';
type mang=Array[1..100000] Of Longint;
Var a,b,ida,idb:mang;
        kta,ktb:Array[1..100000] Of Boolean;
        n:Longint;
        f,g:Text;
Procedure Data;
Begin
        Assign(f,fi);Reset(f);
        Assign(g,fo);Rewrite(g);
        Readln(f,n);
        For n:=1 to n do begin Read(f,a[n]);ida[n]:=n;end;
        For n:=1 to n do begin Read(f,b[n]);idb[n]:=n;end;
End;
Procedure sorta(h,l:Longint);
Var i,j,x,tg:Longint;
Begin
        i:=h;j:=l;
        x:=a[ida[(h+l) div 2]];
        Repeat
                While a[ida[i]]<x do inc(i);
                While a[ida[j]]>x do dec(j);
                If i<=j then
                begin
                        tg:=ida[i];ida[i]:=ida[j];ida[j]:=tg;
                        inc(i);dec(j);
                end;
        Until i>j;
        If i<l then sorta(i,l);
        If h<j then sorta(h,j);
End;
Procedure sortb(h,l:Longint);
Var i,j,x,tg:Longint;
Begin
        i:=h;j:=l;
        x:=b[idb[(h+l) div 2]];
        Repeat
                While b[idb[i]]<x do inc(i);
                While b[idb[j]]>x do dec(j);
                If i<=j then
                begin
                        tg:=idb[i];idb[i]:=idb[j];idb[j]:=tg;
                        inc(i);dec(j);
                end;
        Until i>j;
        If i<l then sorta(i,l);
        If h<j then sorta(h,j);
End;
Procedure Solve;
Var luu:Array[1..100000] Of Longint;
        i,j,top:Longint;
Begin
        top:=0;
        Fillchar(kta,sizeof(kta),true);
        Fillchar(ktb,sizeof(ktb),true);
        i:=1;j:=1;
        While i<=n do
        begin
                While j<=n do
                begin
                        If (b[idb[j]]<a[ida[i]]) then
                        begin
                                inc(top);
                                luu[top]:=j;
                                inc(j);
                        end
                        Else break;
                end;
                If (j<=n)and(top<>0) then
                begin
                        Writeln(g,ida[i],#32,idb[luu[top]]);
                        kta[ida[i]]:=False;
                        ktb[idb[luu[top]]]:=False;
                        dec(top);
                end;
                inc(i);
        end;
        j:=n;
        For i:=n downto 1 do
                If kta[ida[i]] then
                begin
                        While not (ktb[idb[j]])and(j>0) do dec(j);
                        Writeln(g,ida[i],#32,idb[j]);
                        dec(j);
                        If j=0 then break;
                end;
End;
BEGIN
        Data;
        sorta(1,n);
        Sortb(1,n);
        Solve;
        Close(f);Close(g);
END.
