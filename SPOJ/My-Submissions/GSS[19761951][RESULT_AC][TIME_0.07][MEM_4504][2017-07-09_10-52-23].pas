uses math;
type sty = record
         sum,pre,suf,ans: longint;
     end;
var it: array [0..4*50000] of sty;
    a:  array [1..4*50000] of longint;
    n,m,i,u,v: longint;

procedure build(i,l,r: longint);
  var mid: longint;
  begin
      if l=r then
        with it[i] do
          begin
              sum:=a[l]; pre:=a[l]; suf:=a[l]; ans:=a[l];
          end
      else begin
               mid:=(l+r) div 2;
               build(2*i,l,mid);
               build(2*i+1,mid+1,r);
               with it[i] do
                 begin
                     sum:=it[2*i].sum + it[2*i+1].sum;
                     pre:=max(it[2*i].pre , it[2*i+1].pre + it[2*i].sum);
                     suf:=max(it[2*i+1].suf , it[2*i].suf + it[2*i+1].sum);
                     ans:=max( max(it[2*i].ans , it[2*i+1].ans) , it[2*i].suf + it[2*i+1].pre );
                 end;
           end;
  end;

function query(i,l,r: longint): sty;
  var mid: longint;
      a,b: sty;
  begin
      if (v < l) or (r < u) then exit(it[0]);
      if (u <= l) and (r <= v) then exit(it[i]);

      mid:=(l+r) div 2;
      a:=query(2*i,l,mid); b:=query(2*i+1,mid+1,r);
      with query do
                 begin
                     sum:=a.sum + b.sum;
                     pre:=max(a.pre , b.pre + a.sum);
                     suf:=max(b.suf , a.suf + b.sum);
                     ans:=max( max(a.ans , b.ans) , a.suf + b.pre );
                 end;
      exit(query);
  end;

BEGIN
    read(n);
    for i:=1 to n do read(A[i]);
    it[0].sum:=0; it[0].pre:=-maxlongint; it[0].suf:=-maxlongint; it[0].ans:=-maxlongint;
    build(1,1,n);

    read(m);
    for i:=1 to m do
      begin
          read(u,v);
          writeln(query(1,1,n).ans);
      end;
END.