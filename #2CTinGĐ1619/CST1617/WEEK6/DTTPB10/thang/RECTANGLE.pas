Uses Math;
Const fi='RECTANGLE.INP';
        fo='RECTANGLE.OUT';
Var s,fx:Array[0..40,0..40,0..40,0..40] OF Integer;
        a:Array[0..40,0..40] Of Integer;
        n,m:Integer;
        f,g:Text;
Procedure Data;
Begin
        Assign(f,fi);Reset(f);
        Assign(g,fo);Rewrite(g);
        Readln(f,n,m);
        Fillchar(a,sizeof(a),0);
        For n:=1 to n do
                For m:=1 to m do
                begin
                        Read(f,a[n,m]);
                        a[n,m]:=a[n,m]+a[n-1,m]+a[n,m-1]-a[n-1,m-1];
                end;
End;
Function try(x,y,u,v:Integer):INteger;
Var i,j,tmp,sum:Integer;
Begin
        If fx[x,y,u,v]<>-1 then Exit(fx[x,y,u,v]);
        If (s[x,y,u,v]=(u-x+1)*(v-y+1))or(s[x,y,u,v]=0) then
        begin
                fx[x,y,u,v]:=1;Exit(1);
        end;
        sum:=(u-x+1)*(v-y+1);
        For i:=x to u-1 do
        begin
                tmp:=try(x,y,i,v)+try(i+1,y,u,v);
                sum:=min(tmp,sum);
        end;
        For j:=y to v-1 do
        begin
                tmp:=try(x,y,u,j)+try(x,j+1,u,v);
                sum:=min(tmp,sum);
        end;
        fx[x,y,u,v]:=sum;
        Exit(sum);
End;
Procedure Solve;
Var i,j,k,l:Integer;
Begin
        For i:=1 to n do
                For j:=1 to m do
                        For k:=1 to i do
                                For l:=1 to j do
                                begin
                                        s[k,l,i,j]:=a[k-1,l-1]-a[k-1,j]-a[i,l-1]+a[i,j];
                                        fx[k,l,i,j]:=-1;
                                end;
        Writeln(g,try(1,1,n,m));
End;
BEGIN
        Data;
        Solve;
        Close(f);CLose(g);
END.
