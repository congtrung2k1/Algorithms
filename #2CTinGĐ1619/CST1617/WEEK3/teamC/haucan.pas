program haucan;
const
        fi = 'haucan.inp';
        fo = 'haucan.out';
        maxN = 100000;
var
        f:text;
        a:array[0..maxN] of int64;
        l,q,d,k:int64;
procedure nhap;
begin
        assign(f,fi); reset(f);
        readln(f,l,q,k,d);
        close(f);
end;

procedure xuat(sol:longint);
begin
        assign(f,fo); rewrite(f);
        writeln(f,sol);
        close(f);
end;

procedure xuli;
var
        i,t:longint;
begin
        a[0]:=Q;
        if l mod d = 0 then t:=l div d - 1 else t:=l div d;
        for i:=1 to t do
        begin
                if a[i-1] < d then begin a[i]:= 0; xuat(-1); exit; end;
                if (a[i-1] div k > 1) then a[i]:=(a[i-1] div k -1)*(k-2*d) + (k-d)
                else
                        if k < a[i-1] then a[i]:=k-d
                                else a[i]:=a[i-1] - d;
        end;
        inc(i);
        if l mod d = 0 then d:=d else d:=l mod d;
        if a[i-1] < d then begin a[i]:= 0; xuat(-1); exit; end;
        if (a[i-1] div k > 1) then a[i]:=(a[i-1] div k -1)*(k-2*d) + (k-d)
        else
                if k < a[i-1] then a[i]:=k-d
                else a[i]:=a[i-1] - d;
        xuat(a[i]);
end;

BEGIN
        nhap;
        xuli;
END.