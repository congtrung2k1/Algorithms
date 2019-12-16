const fi = 'INCSEQ.INP';
      fo = 'INCSEQ.OUT';
var a,l,t: array [0..100000000] of longint;
    n: longint;

procedure init;
  var f: text;
      i: longint;
  begin
    assign(f,fi); reset(f);
    read(f,n);
    for i:=1 to n do read(f,a[i]);
    close(f);
  end;

procedure INCSEQ;
  var i,j,z,jmax: longint;
  begin
    a[0]:=low(longint); a[n+1]:=maxlongint;             // khoi tao gioi han
    l[n+1]:=1;                                          // dat co so do dai quy hoach dong

    for i:= n downto 0 do
      begin                                             // chon trong mang phan tu a[i] < a[j] va jmax co l[jmax] lon nhat (dam bao tang dan)
        jmax:=n+1;
        for j:=i+1 to n+1 do
          if (a[i]<a[j]) and (l[j]>l[jmax]) then jmax:=j;
        l[i]:=l[jmax]+1;                                // luu do dai day con
        t[i]:=jmax;                                     // truy vet
      end;
  end;

procedure out;
  var f: text;
      i: longint;
  begin
    assign(f,fo); rewrite(f);
    writeln(f,l[0]-2);

    i:=t[0];
    while i <> n+1 do
      begin
        writeln(f,'A[',i,'] = ',a[i]);
        i:=t[i];
      end;
    close(f);
  end;

BEGIN
  init;
  incseq;
  out;
END.
