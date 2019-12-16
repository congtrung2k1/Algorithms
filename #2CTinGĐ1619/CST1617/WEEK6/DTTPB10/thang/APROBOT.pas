Uses Math;
Const fi='APROBOT.INP';
        fo='APROBOT.OUT';
Var a,id,c,fx:Array[1..5000] Of Integer;
        n,k,ans:Integer;
        f,g:Text;
Procedure Data;
Begin
        Assign(f,fi);Reset(f);
        Assign(g,fo);Rewrite(g);
        Readln(f,n,k);
        For n:=1 to n do begin Read(f,a[n]);id[n]:=n;end;
End;
{Procedure sort(h,l:Integer);
Var i,j,x,tg:Integer;
Begin
        i:=h;j:=l;
        x:=a[id[(h+l) div 2]];
        Repeat
                While a[id[i]]>x do inc(i);
                WHile a[id[j]]<x do dec(j);
                If i<=j then
                begin
                        tg:=id[i];id[i]:=id[j];id[j]:=tg;
                        inc(i);dec(j);
                end;
        Until i>j;
        If i<l then sort(i,l);
        If h<j then sort(h,j);
End;      }
Procedure Solve;
Var i,j,tg:Integer;
Begin
        {sort(1,n);}
        For i:=1 to n-1 do
                For j:=i+1 to n do
                        If (a[id[i]]<a[id[j]])or((a[id[i]]=a[id[j]])and (id[i]>id[j])) then
                        begin
                                tg:=id[i];id[i]:=id[j];id[j]:=tg;
                        end;
        j:=1;
        For i:=1 to n do
        begin
                c[id[i]]:=j;
                If i=k*j then inc(j);
        end;
        fx[1]:=1;ans:=1;
        For i:=2 to n do
        begin
                fx[i]:=1;
                For j:=1 to i-1 do
                        IF (c[i]>=c[j])and (fx[i]<fx[j]+1) then fx[i]:=fx[j]+1;
                ans:=max(ans,fx[i]);
        end;
        Writeln(g,n-ans);
End;
BEGIN
        Data;
        Solve;
        Close(f);CLose(g);
END.
