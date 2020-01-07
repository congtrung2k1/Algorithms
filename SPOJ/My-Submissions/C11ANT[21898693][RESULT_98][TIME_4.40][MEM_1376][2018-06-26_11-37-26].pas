uses math;
const esp = 1e-16;
var n,i: longint;
    l,r,m1,m2: extended;
    a,v: array [1..100000] of longint;

function tinh(time: extended): extended;
var smax,smin: extended;
    i: longint;
begin
    smax:= a[1] + time * v[1];
    smin:= a[1] + time * v[1];
    for i:=2 to n do begin
        smax:= max(smax, a[i] + time * v[i]);
        smin:= min(smin, a[i] + time * v[i]);
    end;
    exit((smax - smin) / 2);
end;

BEGIN
    read(n);
    for i:=1 to n do read(a[i]);
    for i:=1 to n do read(v[i]);

    l:=0; r:= 1e9 + 1;
    while (l <= r - esp) do begin
        m1:= l + (r - l) / 3;
        m2:= r - (r - l) / 3;
        if tinh(m1) <= tinh(m2) then r:= m2 else l:= m1;
    end;

    writeln(tinh(l):0:3);
END.