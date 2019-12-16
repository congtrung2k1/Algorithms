program bai1_tr17_4;
var fi,fo: text;
    n,s,i,tong,sl: longint;
    A: array [1..100000] of longint;

    procedure kkk();
      var kt: boolean;
          i,j: longint;
      begin
        sl:=0;
        kt:=false;
        while (kt=false) and (sl<=n+1) do
          begin
           inc(sl);
           if sl>n then exit;
           for i:=1 to n do
             begin
              tong:=0;
              for j:=i to i+sl-1 do
                if i+sl-1 <= n then inc(tong,A[j]);
              if tong>=s then exit ;
             end;
          end;
      end;

BEGIN
assign (fi,'SUB.INP'); reset(fi);
assign (fo,'SUB.OUT'); rewrite(fo);

while not eof(fi) do
  begin
    read (fi,n,s);
    for i:=1 to n  do read (fi,A[i]);
    kkk();
    if sl<=n then writeln (fo,sl) else writeln (fo,0);
    for i:=1 to n do A[i]:=0;
  end;

close(fi); close(fo);
END.