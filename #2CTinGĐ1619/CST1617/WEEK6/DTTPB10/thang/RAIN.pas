Const fi='RAIN.INP';
        fo='RAIN.OUT';
Type td=record x1,x2,y1,y2:Longint;end;
Var a:Array[1..1000] Of td;
        y:Array[1..1000] Of Longint;
        n,x:Longint;
        f,g:Text;
Procedure Data;
Begin
        Assign(f,fi);Reset(f);
        Assign(g,fo);Rewrite(g);
        Readln(f,x,n);
        For n:=1 to n do
                With a[n] do
                begin
                        Readln(f,x1,y1,x2,y2);
                        If y1>y2 then y[n]:=y1 else y[n]:=y2;
                end;
ENd;
Procedure sort(h,l:Longint);
Var i,j,tg,x:Longint;
        tmp:td;
Begin
        i:=h;j:=l;
        x:=y[(h+l) div 2];
        Repeat
                While y[i]<x do inc(i);
                While y[j]>x do dec(j);
                If i<=j then
                begin
                        tg:=y[i];y[i]:=y[j];y[j]:=tg;
                        tmp:=a[i];a[i]:=a[j];a[j]:=tmp;
                        inc(i);dec(j);
                end;
        Until i>j;
        If i<l then sort(i,l);
        If h<j then sort(h,j);
End;
Procedure Solve;
Var i:Longint;
Begin
        Randomize;
        sort(1,n);
        i:=n;
        While i>0 do
        begin
                With(a[i]) do
                begin
                        If (x1<=x)and(x<=x2) then
                                If y1<y2 then x:=x1 Else x:=x2;
                end;
                dec(i);
        end;
        Writeln(g,x);
ENd;
BEGIN
        Data;
        Solve;
        Close(f);Close(g);
END.