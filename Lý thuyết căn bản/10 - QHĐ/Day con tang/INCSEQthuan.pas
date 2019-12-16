const fi = 'INCSEQ.INP';
      fo = 'INCSEQ.OUT';

var a,t,l: array [1..10000] of longint;
    n,i,j,lmax,vt: longint;
    f: text;

procedure init;
  var i: longint;
  begin
    assign(f,fi); reset(f);
    read(f,n);
    for i:=1 to n do read(f,A[i]);
    close(f);

    for i:=1 to n do l[i]:=1;		                // khoi tao co so QHD
  end;

procedure incseq;
  var i,j: longint;
  begin
    lmax:=1;						// do dai dai nhat

    for i:=2 to n do                                    // tim ve truoc xem co phan tu nao <nho hon no> va co <do dai + 1 lon hon no> khong
      for j:=i-1 downto 1 do
        if (a[i] >= a[j]) and (l[i] < l[j]+1) then
          begin
            l[i]:=l[j]+1;                               // gan do dai
            if lmax <= l[i] then lmax:=l[i];            // tim do dai dai nhat
            vt:=i;                                      //luu vi tri do dai dai nhat
          end;
  end;

procedure out;
  var f: text;
  begin
    assign(f,fo); rewrite(f);
    writeln(f,lmax);
    i:=vt; j:=0;                           // truy vet tu vi tri dai nhat
    while i>0 do
      begin
        inc(j);                            // luu vao mang
        t[j]:=vt;

        dec(i);                            // tim kiem ve trc xem co phan tu nao <nho hon no> va co <do dai ke tiep>
        while (i>0) and  (a[i] >= a[vt]) and (l[i] <> lmax-1) do dec(i);
        if i>0 then
            begin
              vt:=i;
              dec(lmax);
            end;
      end;
    for i:=j downto 1 do writeln(f,'A[',t[i],'] = ',a[t[i]]);

    close(f);
  end;

BEGIN
  init;
  incseq;
  out;
END.
