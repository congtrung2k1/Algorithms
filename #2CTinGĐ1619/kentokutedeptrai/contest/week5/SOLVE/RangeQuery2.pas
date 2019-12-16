const fi = 'RangeQuery2.INP';
      fo = 'RangeQuery2.OUT';
var a,it,leaf: array [1..4*100000] of qword;
    n,q,i,u,v: longint;
    tmp: char;
    f,g: text;

procedure build(i,l,r: longint);
  var mid: longint;
  begin
      if l=r then
        begin
            leaf[l]:=i;
            it[i]:=a[l];
            exit;
        end;
      mid:=(l+r) div 2;
      build(2*i,l,mid); build(2*i+1,mid+1,r);
      it[i]:=it[2*i] + it[2*i+1];
  end;

procedure update(i: longint);
  begin
      if i=0 then exit;
      while i>0 do
        begin
            it[i]:=it[2*i] + it[2*i+1];
            i:=i div 2;
        end;
  end;

function tinh(i,l,r: longint): longint;
  var mid: longint;
  begin
      if (r < u) or (v < l) then exit(0);
      if (u<=l) and (r<=v) then exit(it[i]);
      mid:=(l+r) div 2;
      exit(tinh(2*i,l,mid) + tinh(2*i+1,mid+1,r));
  end;

BEGIN
    assign(f,fi); reset(f);
    assign(g,fo); rewrite(g);
    read(f,n,q);
    for i:=1 to n do read(f,A[i]); readln(f);
    build(1,1,n);

    while q>0 do
      begin
          dec(q);
          read(f,tmp);
          if tmp='U' then
            begin
                read(f,tmp);
                readln(f,u,v);
                a[u]:=v; it[leaf[u]]:=v;
                update(leaf[u] div 2);
            end
          else begin
                   read(f,tmp);
                   readln(f,u,v);
                   writeln(g,tinh(1,1,n));
               end;
      end;
    close(g);
END.