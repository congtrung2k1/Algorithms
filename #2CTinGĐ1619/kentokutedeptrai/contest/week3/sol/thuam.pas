uses math;
const fi = 'thuam.inp';
      fo = 'thuam.out';
type sty = record
         smax,smin: longint;
     end;
var a: array [1..1000000] of longint;
    it: array [0..4*1000000] of sty;
    n,m,c,u,v: longint;

procedure build(i,l,r: longint);
  var mid: longint;
  begin
      if l=r then
        begin
            it[i].smin:=a[l];
            it[i].smax:=a[l];
            exit;
        end;
      mid:=(l+r) div 2;
      build(2*i, l, mid); build(2*i+1, mid+1, r);
      it[i].smin:=min(it[2*i].smin , it[2*i+1].smin);
      it[i].smax:=max(it[2*i].smax , it[2*i+1].smax);
  end;

procedure init;
  var f: text; i: longint;
  begin
      assign(f,fi); reset(f);
      read(f,n,m,c);
      for i:=1 to n do read(f,A[i]);
      close(f);
      it[0].smin:=maxlongint; it[0].smax:=-1;
      build(1,1,n);
  end;

function tinh(i,l,r: longint): sty;
  var mid: longint;
      le,ri: sty;
  begin
      if (r < u) or (v < l) then exit(it[0]);
      if (u <= l) and (r <= v) then exit(it[i]);
      mid:=(l+r) div 2;
      le:=tinh(2*i,l,mid);
      ri:=tinh(2*i+1,mid+1,r);
      tinh.smin:=min(le.smin , ri.smin);
      tinh.smax:=max(le.smax , ri.smax);
  end;

procedure out;
  var check: boolean;
      i: longint;
      f: text;
      t: sty; 
  begin
      assign(f,fo); rewrite(f);
      check:=false;
      for i:=1 to n-m+1 do
        begin
            u:=i; v:=i+m-1;
            t:=tinh(1,1,n);
            if t.smax - t.smin <= c then
              begin
                  check:=true;
                  writeln(f,i);
              end;
        end;
      if check=false then writeln(f,0);
      close(f);
  end;

BEGIN
    init;
    out;
END.