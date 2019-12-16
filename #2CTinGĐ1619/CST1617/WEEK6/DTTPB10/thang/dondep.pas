Const fi='DONDEP.INP';
        fo='DONDEP.OUT';
Var l,r:Array[0..1001] Of integer;
        a:Array[1..20000] Of integer;
        n,m:Integer;
        f,g:Text;
Procedure Data;
Begin
        Assign(f,fi);Reset(f);
        ASsign(g,fo);Rewrite(g);
        Readln(f,m,n);
        For n:=1 to n do Read(f,a[n]);
End;
Function ans:integer;
Var i,k,d:integer;
Begin
        k:=n div 2;
        Fillchar(l,sizeof(l),0);
        Fillchar(r,sizeof(r),0);
        For i:=1 to k do begin inc(l[a[i]]);inc(r[a[i+k]]);end;
        For k:=n div 2 downto 1 do
        begin
                d:=0;
                If l[m]=0 then
                begin
                        For i:=m downto 1 do
                        begin
                                d:=d+r[i]-l[i-1];
                                If d<0 then break;
                        end;
                        If d>=0 then Exit(k);
                end;
                dec(l[a[k]]);dec(r[a[k*2]]);
                dec(r[a[k*2-1]]);inc(r[a[k]]);
        end;
        Exit(0);
End;
BEGIN
        Data;
        Writeln(g,ans) ;
        CLose(f);CLose(g);
END.

