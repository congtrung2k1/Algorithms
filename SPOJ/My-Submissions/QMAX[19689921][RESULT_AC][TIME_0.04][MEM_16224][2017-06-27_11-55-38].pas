uses math;

var tr,ph,v,a: array [0..1000000] of longint;
    n,m,r,l,q,i,u,uu,k: longint;

procedure build(i,l,r: longint);
  var mid: longint;
  begin
      tr[i]:=l; ph[i]:=r;
      if l=r then v[i]:=a[l]
      else begin
               mid:= (l+r) shr 1;
               build(2*i,l,mid);
               build(2*i+1,mid+1,r);
               v[i]:=max(v[2*i],v[2*i+1]);
           end;
  end;

function tinh(i: longint): int64;
  begin
      if (tr[i]>r) or (ph[i]<l) then exit(0);
      if (tr[i]>=l) and (ph[i]<=r) then exit(v[i]);
      tinh:=max(tinh(2*i), tinh(2*i+1));
      exit(tinh);
  end;

BEGIN
    read(n,m);
    for i:=1 to m do
      begin
          read(u,uu,k);
          inc(A[u],k);
          dec(A[uu+1],k);
      end;

    A[0]:=0;
    for i:=1 to n do A[i]:=A[i-1] + A[i];

    build(1,1,n);

    read(q);
    for i:=1 to q do
      begin
          read(l,r);
          writeln(tinh(1));
      end;
END.