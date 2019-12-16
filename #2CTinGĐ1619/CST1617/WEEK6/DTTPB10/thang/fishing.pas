Uses Math;
Const fi='fishing.INP';
        fo='fishing.out';
        maxn=100;
        oo=trunc(1e9)+1;
Var fx1,fx2:ARray[0..maxn,0..maxn,0..maxn] Of Longint;
        a:Array[1..maxn,1..maxn] Of Longint;
        res:Longint;
        r,c:Integer;
        f,g:Text;
Procedure Data;
Begin
        Assign(f,fi);Reset(f);
        Assign(g,fo);Rewrite(g);
        Readln(f,r,c);
        For r:=1 to r do
                For c:=1 to c do
                        Read(f,a[r,c]);
End;
Procedure Solve;
Var i,j,k:Integer;
Begin
        For i:=1 to r do
                For j:=1 to c do
                        For k:=0 to min(r,c) div 2 do
                        begin
                                If k=0 then fx1[i,j,k]:=0
                                Else If (k>min(i,j)) then fx1[i,j,k]:=0
                                Else If (k=i)and (j=k) then fx1[i,j,k]:=fx1[i-1,j-1,k-1]+a[i,j]
                                Else
                                begin
                                        fx1[i,j,k]:=0;
                                        If i>1 then fx1[i,j,k]:=max(fx1[i-1,j,k],fx1[i,j,k]);
                                        If j>1 then fx1[i,j,k]:=max(fx1[i,j-1,k],fx1[i,j,k]);
                                        fx1[i,j,k]:=max(fx1[i,j,k],a[i,j]+fx1[i-1,j-1,k-1]);
                                end;
                        end;
        For i:=1 to r do
                For j:=1 to c do
                        For k:=0 to min(r,c) do
                        begin
                                If k=0 then fx2[i,j,k]:=0
                                Else If (k>min(i,j)) then fx2[i,j,k]:=oo
                                Else If (k=i)and (j=k) then fx2[i,j,k]:=fx2[i-1,j-1,k-1]+a[i,j]
                                Else
                                begin
                                        fx2[i,j,k]:=oo;
                                        If i>1 then fx2[i,j,k]:=min(fx2[i-1,j,k],fx2[i,j,k]);
                                        If j>1 then fx2[i,j,k]:=min(fx2[i,j-1,k],fx2[i,j,k]);
                                        fx2[i,j,k]:=min(fx2[i,j,k],a[i,j]+fx2[i-1,j-1,k-1]);
                                end;
                        end;
        res:=0;
        For i:=1 to min(r,c) div 2 do
                res:=max(res,fx1[r,c,i]-fx2[r,c,2*i]);
        Writeln(g,res);
End;
BEGIN
        Data;
        Solve;
        Close(f);CLose(g);
END.
