Uses Math;
Const fi='BST.INP';
        fo='BST.OUT';
        oo=trunc(1e9);
Var p,sum:Array[0..250] Of Longint;
        fx,s:Array[0..250,0..250] Of Longint;
        n:Integer;
        f,g:Text;
Procedure Solve;
Var i,j,l,k:integer;
Begin
        For l:=1 to n-1 do
                For i:=1 to n-l do
                begin
                        j:=i+l;
                        fx[i,j]:=min(fx[i,j-1]+sum[j-1]-sum[i-1],fx[i+1,j]+sum[j]-sum[i]);
                        For k:=i+1 to j-1 do
                                fx[i,j]:=min(fx[i,j],fx[i,k-1]+fx[k+1,j]+sum[j]-sum[i-1]-p[k]);
                end;
        Writeln(g,fx[1,n]);
ENd;
Procedure Data;
Begin
        Assign(f,fi);Reset(f);
        Assign(g,fo);Rewrite(g);
        While not eof(f) do
        begin
                Read(f,n);
                sum[0]:=0;
                For n:=1 to n do
                begin Read(f,p[n]);sum[n]:=sum[n-1]+p[n];end;
                Readln(f);
                Solve;
        end;
End;
BEGIN
        Data;
        Close(f);CLose(g);
END.