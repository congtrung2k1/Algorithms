Uses Math;
Const fi='PRINCE.INP';
        fo='PRINCE.OUT';

Var x,m:Array[0..501] Of Longint;
        l:Array[0..501,0..501] Of Int64;
        n:Integer;
        f,g:Text;

Procedure Init;
Begin
        Assign(f,fi);Reset(f);
        Assign(g,fo);Rewrite(g);
        Readln(f,n);
        Fillchar(x,sizeof(x),0);
        Fillchar(m,sizeof(m),0);
        For n:=1 to n do Readln(f,x[n],m[n]);
        Readln(f,x[n+1]);
End;

Procedure Try;
Var i,j,k:Integer;
        kq:Int64;
Begin
        Fillchar(l,sizeof(l),0);
        For i:=1 to n+1 do l[0,i]:=m[i];
        For i:=1 to n do
         For j:=i+1 to n+1 do
          For k:=0 to i-1 do
          If(x[i]-x[k]>=x[j]-x[i]) then begin
           If (l[k,i]<>0)then l[i,j]:=max(l[i,j],l[k,i]+m[j]);end
            Else break;
        kq:=0;
        For i:=0 to n do kq:=max(kq,l[i,n+1]);
        Writeln(g,kq);
End;
BEGIN
        Init;
        Try;
        Close(f);CLose(g);
END.
