const fi=      '';
       maxd=        100009;
type   data=longint;
var   a,kq1,kq2:           array[0..maxd] of longint;
       l:           array[0..maxd] of longint;
       n:           longint;
       d:           longint;
 
 
procedure nhap;
var i:longint;
        f:text;
begin
     assign(f,fi); reset(f);
     readln(f,n);
     for i:=1 to n do
     read(f,a[i]);
     close(f);
end;
 
 
function min(a,b:data):data;
begin
        if a<b then exit(a);
        exit(b);
end;
 
function max(a,b:data):data;
begin
        if a>b then exit(a);
        exit(b);
end;
 
procedure swap(var a,b:data);
var     z:data;
begin
        z:=a;
        a:=b;
        b:=z;
end;
 
 
procedure xuli;
var i,k,dau,cuoi,res:longint;
begin
 
        l[1]:=1;d:=1;
        kq1[1]:=1;
        for i:=2 to n do
                begin
                                if a[i]>a[l[d]] then
                                        begin
                                                inc(d);
                                                l[d]:=i;
                                                kq1[i]:=d;
                                        end
                                else
                                        begin
 
                                                dau:=1;
                                                cuoi:=d;
                                                while dau<cuoi do
                                                        begin
                                                                k:=(dau+cuoi) div 2;
                                                                if a[l[k]]<a[i] then
                                                                        dau:=k+1
                                                                else
                                                                        cuoi:=k;
                                                        end;
                                                l[dau]:=i;
                                                kq1[i]:=dau;
                                        end;
                end;
 
 
        for i:=1 to n div 2 do
                swap(a[i],a[n-i+1]);
 
        l[1]:=1;d:=1;
        kq2[1]:=1;
        for i:=2 to n do
                begin
                                if a[i]>a[l[d]] then
                                        begin
                                                inc(d);
                                                l[d]:=i;
                                                kq2[i]:=d;
                                        end
                                else
                                        begin
 
                                                dau:=1;
                                                cuoi:=d;
                                                while dau<cuoi do
                                                        begin
                                                                k:=(dau+cuoi) div 2;
                                                                if a[l[k]]<a[i] then
                                                                        dau:=k+1
                                                                else
                                                                        cuoi:=k;
                                                        end;
                                                l[dau]:=i;
                                                kq2[i]:=dau;
                                        end;
                end;
 
        res:=0;
        for i:=1 to n do
                res:=max(res,2*min(kq1[i],kq2[n-i+1])-1);
        writeln(res);
 
end;
 
begin
     nhap;
     xuli;
end.